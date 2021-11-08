import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jumga_flutterwave_project/models/shop_owner.dart';
import 'package:jumga_flutterwave_project/models/shop_owner_data.dart';

class AuthService {
  AuthService({this.context});
  final BuildContext context;
  FirebaseAuth _auth = FirebaseAuth.instance;
  String errorMessage = '';
  GlobalKey<ScaffoldMessengerState> _scaffoldMessenger =
      GlobalKey<ScaffoldMessengerState>();

  FirebaseAuth get auth {
    return _auth;
  }

  // Get user (i.e shop owner) from firebase user
  ShopOwner _shopOwnerFromFirebaseUser(User user) {
    return user != null ? ShopOwner(uid: user.uid) : null;
  }

  // Register with email and password.
  Future<ShopOwner> registerWithEmailAndPassword({
    String firstname,
    String lastname,
    String phonenumber,
    String email,
    String address,
    String city,
    String state,
    String country,
    String password,
    String img,
  }) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      await ShopOwnerDataBase(user.uid).updateShopOwnerData(
        firstName: firstname,
        lastName: lastname,
        email: email,
        address: address,
        city: city,
        state: state,
        country: country,
        phoneNumber: phonenumber,
        imageURL: img,
      );
      return _shopOwnerFromFirebaseUser(user);
    } catch (e) {
      errorMessage = e.message;
      _scaffoldMessenger.currentState.showSnackBar(
        SnackBar(
          content: Text(' Unable to create account'),
        ),
      );

      // switch (e.code) {
      //   case "invalid-email":
      //     errorMessage = "Your email address appears to be malformed.";
      //     break;
      //   case "ERROR_TOO_MANY_REQUESTS":
      //     errorMessage = "Too many requests. Try again later.";
      //     break;
      //   case "ERROR_OPERATION_NOT_ALLOWED":
      //     errorMessage = "Signing in with Email and Password is not enabled.";
      //     break;
      //   case "ERROR_EMAIL_ALREADY_IN_USE":
      //     errorMessage = "Email already in use.";
      //     break;
      //   default:
      //     errorMessage = "An undefined error happened.";
      // }
      return null;
    }
  }

  Future<ShopOwner> signInWithEmailAndPassword(
      {String email, String password}) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _shopOwnerFromFirebaseUser(user);
    } catch (e) {
      errorMessage = e.message;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(' Unable to sign in: $errorMessage'),
        ),
      );

      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      errorMessage = e.message;
      _scaffoldMessenger.currentState.showSnackBar(
        SnackBar(
          content: Text(' Unable to sign out: $errorMessage'),
        ),
      );

      print(e);
      return null;
    }
  }
}
