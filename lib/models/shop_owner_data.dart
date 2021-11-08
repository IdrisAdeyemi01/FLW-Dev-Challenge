import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jumga_flutterwave_project/models/shop_owner.dart';

class ShopOwnerDataBase {
  String uid;
  ShopOwnerDataBase(this.uid);

  final CollectionReference shopOwners =
      FirebaseFirestore.instance.collection('sellers');

  Future updateShopOwnerData(
      {String firstName,
      String lastName,
      String email,
      String address,
      String city,
      String state,
      String country,
      String phoneNumber,
      String imageURL}) async {
    return await shopOwners.doc(uid).set({
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'address': address,
      'phoneNumber': phoneNumber,
      'city': city ?? '',
      'state': state ?? '',
      'country': country ?? '',
      'profilePicURL': imageURL,
    });
  }

  ShopOwnerData getShopOwnerData(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return ShopOwnerData(
      emailAddress: data['email'],
      firstName: data['firstName'],
      lastName: data['lastName'],
      phoneNumber: data['phoneNumber'],
      address: data['address'],
      city: data['city'],
      state: data['state'],
      country: data['country'],
      picture: data['profilePicURL'],
    );
  }

  Stream<ShopOwnerData> get shopOwnerDocument {
    return shopOwners.doc(uid).snapshots().map(getShopOwnerData);
    // return users.document(uid).snapshots();
  }
}
