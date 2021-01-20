import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jumga_flutterwave_project/components/colors.dart' as colours;
import 'package:jumga_flutterwave_project/screens/profile_page.dart';
import 'package:jumga_flutterwave_project/widgets/text_field_container.dart';
import 'package:jumga_flutterwave_project/widgets/dark_green_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SellerRegistration extends StatefulWidget {
  @override
  _SellerRegistrationState createState() => _SellerRegistrationState();
}

class _SellerRegistrationState extends State<SellerRegistration> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _auth = FirebaseAuth.instance;

  String emailAddress;
  String passWord;
  String firstName;
  String lastName;
  String address;
  String city = '';
  String state = '';
  String country = '';

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              'Sign Up',
              style: TextStyle(
                color: colours.green100,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Card(
                  margin: EdgeInsets.all(10),
                  semanticContainer: false,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 5, bottom: 5, right: 20, left: 20),
                      child: Text(
                        'Back',
                        style: TextStyle(
                          color: colours.green100,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'First Name',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextFieldContainer(
                          hintText: 'First Name',
                          keyboardType: TextInputType.name,
                          textfieldWidth: screenSize.width * 0.4,
                          onChanged: (value) {
                            firstName = value;
                          },
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Last Name',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextFieldContainer(
                          hintText: 'Last Name',
                          keyboardType: TextInputType.name,
                          textfieldWidth: screenSize.width * 0.4,
                          onChanged: (value) {
                            lastName = value;
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Text(
                  'Email',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextFieldContainer(
                  hintText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (val) {
                    emailAddress = val;
                  },
                ),
                SizedBox(height: 30),
                Text(
                  'Address',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextFieldContainer(
                  hintText: 'Adress',
                  keyboardType: TextInputType.streetAddress,
                  onChanged: (value) {
                    address = value;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFieldContainer(
                      textfieldWidth: screenSize.width * 0.4,
                      hintText: 'City',
                      onChanged: (value) {
                        city = value;
                      },
                    ),
                    TextFieldContainer(
                      textfieldWidth: screenSize.width * 0.4,
                      hintText: 'State',
                      onChanged: (value) {
                        state = value;
                      },
                    ),
                  ],
                ),
                TextFieldContainer(
                  hintText: 'Country',
                  onChanged: (value) {
                    country = value;
                  },
                ),
                SizedBox(height: 30),
                Text(
                  'Password',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextFieldContainer(
                  hintText: 'Password',
                  obscureText: true,
                  onChanged: (pword) {
                    passWord = pword;
                  },
                ),
                SizedBox(height: 30),
                Text(
                  'Confirm Password',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextFieldContainer(
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),
                SizedBox(height: screenSize.height * 0.1),
                DarkGreenButton(
                  label: 'Sign Up',
                  onPressed: () async {
                    if (firstName != null && lastName != null) {
                      try {
                        final newUser =
                            await _auth.createUserWithEmailAndPassword(
                                email: emailAddress, password: passWord);
                        if (newUser != null) {
                          var user = newUser.user;

                          await user.updateProfile(
                            displayName: '$firstName $lastName',
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfilePage(),
                            ),
                          );
                        }
                      } catch (e) {
                        _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text('Unable to Sign Up, Pls try again'),
                          duration: Duration(seconds: 3),
                        ));
                      }
                    } else {
                      _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text('Please enter your first name and last name'),
                          duration: Duration(seconds: 3),
                        ));
                      
                    }
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
