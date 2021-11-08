import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jumga_flutterwave_project/auth/auth.dart';
import 'package:jumga_flutterwave_project/components/colors.dart' as colours;
import 'package:jumga_flutterwave_project/services/image_getter.dart';
import 'package:jumga_flutterwave_project/views/seller/profile_page.dart';
import 'package:jumga_flutterwave_project/custom_widgets/text_field_container.dart';
import 'package:jumga_flutterwave_project/custom_widgets/dark_green_button.dart';
import 'package:email_validator/email_validator.dart';
import 'package:jumga_flutterwave_project/components/colors.dart' as colors;
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;

class SellerRegistration extends StatefulWidget {
  @override
  _SellerRegistrationState createState() => _SellerRegistrationState();
}

class _SellerRegistrationState extends State<SellerRegistration> {
  // final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
  // GlobalKey<ScaffoldMessengerState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AuthService _auth = AuthService();
  // final _imagePicker = ImagePicker();
  final _imageGetter = ImageGetter();

  String emailAddress;
  String passWord;
  String firstName;
  String lastName;
  String address;
  String city = '';
  String state = '';
  String country = '';
  String phoneNumber;
  String _imageURL;
  // File _image;

  Future<String> getImage() async {
    return await _imageGetter.getImageLinkAndUpload();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
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
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
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
                            validator: (String value) {
                              if (value.length == 0) {
                                return 'Please enter your first name';
                              } else {
                                return null;
                              }
                            },
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
                            validator: (String value) {
                              if (value.length == 0) {
                                return 'Please enter your last name';
                              } else {
                                return null;
                              }
                            },
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
                    validator: (email) => EmailValidator.validate(emailAddress)
                        ? null
                        : "Please enter a correct email",
                    onChanged: (val) {
                      emailAddress = val;
                    },
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Phone number',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextFieldContainer(
                    hintText: 'Phone number',
                    keyboardType: TextInputType.number,
                    validator: (String phone) {
                      if (phone.length == 0) {
                        return 'Enter your phone number';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (val) {
                      phoneNumber = val;
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
                    validator: (String value) {
                      if (value.length == 0) {
                        return 'Please enter your address';
                      } else {
                        return null;
                      }
                    },
                    hintText: 'Address',
                    keyboardType: TextInputType.streetAddress,
                    onChanged: (value) {
                      address = value;
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextFieldContainer(
                        validator: (String value) {
                          if (value.length == 0) {
                            return 'Kindly enter your city';
                          } else {
                            return null;
                          }
                        },
                        textfieldWidth: screenSize.width * 0.4,
                        hintText: 'City',
                        onChanged: (value) {
                          city = value;
                        },
                      ),
                      TextFieldContainer(
                        validator: (String value) {
                          if (value.length == 0) {
                            return 'Kindly enter your state';
                          } else {
                            return null;
                          }
                        },
                        textfieldWidth: screenSize.width * 0.4,
                        hintText: 'State',
                        onChanged: (value) {
                          state = value;
                        },
                      ),
                    ],
                  ),
                  TextFieldContainer(
                    validator: (String value) {
                      if (value.length == 0) {
                        return 'Kindly enter your country';
                      } else {
                        return null;
                      }
                    },
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
                    validator: (String value) {
                      if (value.length == 0) {
                        return 'Kindly enter a password';
                      } else {
                        return null;
                      }
                    },
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
                    validator: (String value) {
                      if (value != passWord) {
                        return 'Password does not match';
                      } else {
                        return null;
                      }
                    },
                    hintText: 'Confirm Password',
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      InkWell(
                        child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              border: Border.all(color: colors.green50),
                              color: colors.lightGrey),
                          child: _imageURL == null
                              ? Icon(
                                  Icons.add,
                                  color: colors.appGrey,
                                  size: 50,
                                )
                              : Image.network(_imageURL),
                        ),
                        onTap: () async {
                          print('Putting in image URL');
                          _imageURL = await getImage();
                          setState(() {});
                          print('Image URLLLL: $_imageURL');
                          // getImageLinkAndUpload();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Image added successfully'),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: screenSize.height * 0.1),
                  DarkGreenButton(
                    label: 'Sign Up',
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        try {
                          final newUser =
                              await _auth.registerWithEmailAndPassword(
                                  firstname: firstName,
                                  lastname: lastName,
                                  address: address,
                                  city: city,
                                  state: state,
                                  country: country,
                                  email: emailAddress,
                                  password: passWord,
                                  img: _imageURL);

                          if (newUser != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfilePage(),
                              ),
                            );
                          }
                        } catch (e) {
                          print(e);
                          // _scaffoldMessengerKey.currentState
                          //     .showSnackBar(SnackBar(
                          //   content: Text('Unable to Sign Up, Pls try again'),
                          //   duration: Duration(seconds: 3),
                          // ));
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
