import 'package:flutter/material.dart';
import 'package:jumga_flutterwave_project/components/colors.dart' as colours;
import 'package:jumga_flutterwave_project/screens/create_a_store02.dart';
import 'package:jumga_flutterwave_project/widgets/text_field_container.dart';
import 'package:jumga_flutterwave_project/widgets/dark_green_button.dart';

class CreateAStore01 extends StatefulWidget {
  @override
  _CreateAStore01State createState() => _CreateAStore01State();
}

class _CreateAStore01State extends State<CreateAStore01> {
  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              'Create a store',
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
                Text('Profile',
                    style: TextStyle(fontSize: 16, color: colours.green100)),
                SizedBox(height: 50),
                Text(
                  'Business Name',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextFieldContainer(hintText: ''),
                SizedBox(height: 30),
                Text(
                  'About Business',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextFieldContainer(hintText: ''),
                SizedBox(height: 30),
                Text(
                  'What category of products/ services do you offer?',
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextFieldContainer(hintText: ''),
                SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                DarkGreenButton(
                  label: 'Continue',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateAStore02()));
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
