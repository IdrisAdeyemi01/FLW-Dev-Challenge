import 'package:flutter/material.dart';
import 'package:jumga_flutterwave_project/components/colors.dart' as colours;
import 'package:jumga_flutterwave_project/screens/my_products.dart';
import 'package:jumga_flutterwave_project/widgets/store_button.dart';

class MyStore extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: colours.green90,
      appBar: AppBar(
        backgroundColor: colours.green90,
        elevation: 0,
        title: Center(
          child: Text(
            'My Store',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 30),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(radius: 20, backgroundColor: colours.green30),
                  SizedBox(width: 30),
                  Expanded(
                    child: Text('Musa AbdulKareem',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w600)),
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),
              StoreButton(
                label: 'View Products',
                onPressed: () {
                   Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyProducts(),
                  ),
                );
                },
              ),
              StoreButton(
                label: 'Check Invoices',
                onPressed: () {
                  _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text('Coming soon'),
                          duration: Duration(seconds: 3),
                        ));
                },
              ),
              StoreButton(
                label: 'Edit Details',
                onPressed: () {
                  _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text('Coming soon'),
                          duration: Duration(seconds: 3),
                        ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


