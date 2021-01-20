import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jumga_flutterwave_project/widgets/dark_green_button.dart';

class CreateStoreFinal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('images/thank_you_store.svg'),
              SizedBox(height: 20),
              Text(
                'Thanks for creating \na store with us',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'To activate your store, you have \nto pay a token of \$20.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(
                height: 50,
              ),
              DarkGreenButton(
                label: 'Proceed to Payment',
                onPressed: () {},
              )
            ],
          )),
    );
  }
}
