import 'package:flutter/material.dart';
import 'package:jumga_flutterwave_project/components/colors.dart' as colours;
import 'package:jumga_flutterwave_project/screens/add_a_product.dart';
import 'package:jumga_flutterwave_project/widgets/store_button.dart';

class MyProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: colours.green90,
          elevation: 0,
          // leading: CircleAvatar(
          //   backgroundColor: colours.green30,
          //   radius: 1,
          // ),
          title: Center(
            child: Text(
              'My Products',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              StoreButton(
                label: 'Add a product',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddAProduct(),
                    ),
                  );
                },
              )
            ],
          ),
        ));
  }
}
