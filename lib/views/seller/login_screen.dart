import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:jumga_flutterwave_project/auth/auth.dart';
import 'package:jumga_flutterwave_project/components/colors.dart' as colours;
import 'package:jumga_flutterwave_project/views/seller/profile_page.dart';
import 'package:jumga_flutterwave_project/custom_widgets/text_field_container.dart';
import 'package:jumga_flutterwave_project/custom_widgets/dark_green_button.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _auth = AuthService();

  String emailAddress;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Form(
        key: _formKey,
        child: Container(
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
                validator: (email) => EmailValidator.validate(emailAddress)
                    ? null
                    : "Please enter a correct email",
                onChanged: (val) {
                  emailAddress = val;
                },
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
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
                obscureText: true,
                validator: (String value) {
                  if (value.length == 0) {
                    return 'Kindly enter a password';
                  } else {
                    return null;
                  }
                },
                hintText: 'Password',
                onChanged: (value) {
                  password = value;
                },
              ),
              Spacer(),
              DarkGreenButton(
                label: 'Log In',
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    try {
                      final newUser = await _auth.signInWithEmailAndPassword(
                        email: emailAddress.trim(),
                        password: password,
                      );
                      if (newUser != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfilePage(),
                          ),
                        );
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Unable to login'),
                        duration: Duration(seconds: 3),
                      ));
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
