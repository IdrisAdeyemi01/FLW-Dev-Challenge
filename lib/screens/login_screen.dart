import 'package:flutter/material.dart';
import 'package:jumga_flutterwave_project/components/colors.dart' as colours;
import 'package:jumga_flutterwave_project/screens/profile_page.dart';
import 'package:jumga_flutterwave_project/widgets/text_field_container.dart';
import 'package:jumga_flutterwave_project/widgets/dark_green_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _auth = FirebaseAuth.instance;

  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              'Log in',
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
                )),
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                onChanged: (value) {
                  email = value;
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
                onChanged: (value) {
                  password = value;
                },
              ),
              Spacer(),
              DarkGreenButton(
                label: 'Log In',
                onPressed: () async {
                  try {
                    await _auth.signInWithEmailAndPassword(
                      email: email.trim(),
                      password: password,
                    );

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(),
                      ),
                    );
                  } catch (e) {
                    _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text('Unable to login'),
                          duration: Duration(seconds: 3),
                        ));
                  }
                },
              ),
            ],
          ),
        ));
  }
}
