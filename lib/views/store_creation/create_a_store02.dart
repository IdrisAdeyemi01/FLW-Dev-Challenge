import 'package:flutter/material.dart';
import 'package:jumga_flutterwave_project/components/colors.dart' as colours;
import 'package:jumga_flutterwave_project/views/store_creation/create_a_store03.dart';
import 'package:jumga_flutterwave_project/custom_widgets/text_field_container.dart';
import 'package:jumga_flutterwave_project/custom_widgets/dark_green_button.dart';

class CreateAStore02 extends StatefulWidget {
  @override
  _CreateAStore02State createState() => _CreateAStore02State();
}

class _CreateAStore02State extends State<CreateAStore02> {
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
                    padding:
                        EdgeInsets.only(top: 5, bottom: 5, right: 20, left: 20),
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
              Text('Profile | Contact',
                  style: TextStyle(fontSize: 16, color: colours.green100)),
              SizedBox(height: 50),
              Text(
                'Physical Address',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextFieldContainer(hintText: ''),
              SizedBox(height: 30),
              Text(
                'Email',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextFieldContainer(hintText: ''),
              SizedBox(height: 30),
              Text(
                'WhatsApp Number',
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
                          builder: (context) => CreateAStore03()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
