import 'package:flutter/material.dart';
import 'package:jumga_flutterwave_project/screens/login_screen.dart';
import 'package:jumga_flutterwave_project/screens/seller_registration.dart';
import 'package:jumga_flutterwave_project/widgets/dark_green_button.dart';
import 'package:jumga_flutterwave_project/components/colors.dart' as colours;

class BeASeller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        color: colours.green100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'JUMGA',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 100),
            DarkGreenButton(
              label: 'Sign Up',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SellerRegistration(),
                  ),
                );
              },
              containerColor: Colors.white,
              textColor: colours.green100,
            ),
            SizedBox(height: 10),
            DarkGreenButton(
              label: 'Sign In',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login(),
                  ),
                );
              },
              containerColor: Colors.white,
              textColor: colours.green100,
            ),
          ],
        ),
      ),
    );
  }
}
