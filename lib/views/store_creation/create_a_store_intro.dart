import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jumga_flutterwave_project/views/store_creation/create_a_store01.dart';
import 'package:jumga_flutterwave_project/custom_widgets/dark_green_button.dart';
import 'package:jumga_flutterwave_project/components/colors.dart' as colours;

class CreateStoreIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('images/create_store.svg'),
              SizedBox(height: 20),
              Text(
                'Create a store',
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
                'You currently don\'t have a store \nwith us. Create a store and \n improve your sales',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(
                height: 40,
              ),
              DarkGreenButton(
                label: 'Create a store',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateAStore01(),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              DarkGreenButton(
                textColor: colours.green100,
                containerColor: colours.green20,
                label: 'Cancel',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          )),
    );
  }
}
