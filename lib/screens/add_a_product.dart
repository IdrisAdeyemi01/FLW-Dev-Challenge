import 'package:flutter/material.dart';
import 'package:jumga_flutterwave_project/models/product_data.dart';
import 'package:jumga_flutterwave_project/screens/home_page.dart';
// import 'package:jumga_flutterwave_project/components/colors.dart' as colours;
import 'package:jumga_flutterwave_project/widgets/dark_green_button.dart';
import 'package:jumga_flutterwave_project/widgets/text_field_container.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddAProduct extends StatefulWidget {
  @override
  _AddAProductState createState() => _AddAProductState();
}

class _AddAProductState extends State<AddAProduct> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  User loggedInUser;

  getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(user);
      }
    } catch (e) {
      print(e);
    }
  }

  String productName;
  String productDescription;
  String deliveryNote;
  String returnPolicy;
  String productPrice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Add A New Product',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Product Name',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextFieldContainer(
                hintText: '',
                onChanged: (value) {
                  productName = value;
                },
              ),
              SizedBox(height: 30),
              Text(
                'Price',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextFieldContainer(
                onChanged: (val) {
                  setState(() {
                    productPrice = val;
                  });
                  productPrice = val;
                  print(productPrice);
                },
                hintText: '',
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 30),
              Text(
                'Description',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextFieldContainer(
                  onChanged: (val) {
                    productDescription = val;
                  },
                  hintText: ''),
              SizedBox(height: 30),
              Text(
                'Delivery Note',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextFieldContainer(
                  hintText: '',
                  onChanged: (value) {
                    deliveryNote = value;
                  }),
              SizedBox(height: 30),
              Text(
                'Return Policy',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextFieldContainer(
                  hintText: '',
                  onChanged: (value) {
                    returnPolicy = value;
                  }),
              SizedBox(height: 50),
              // Text(
              //   '',
              //   style: TextStyle(
              //     color: Colors.black,
              //     fontSize: 18,
              //     fontWeight: FontWeight.w600,
              //   ),
              // ),
              // TextFieldContainer(hintText: ''),
              // SizedBox(height: 30),
              DarkGreenButton(
                label: 'Add Product',
                onPressed: () async {
                  print(productPrice);
                  print(productDescription);
                  print(productName);
                  print(deliveryNote);
                  print(returnPolicy);

                  await _firestore.collection('products').add({
                    'delivery_note': deliveryNote,
                    'description': productDescription,
                    'price': int.parse(productPrice),
                    'product_name': productName,
                    'return_policy': returnPolicy,
                    'shop_name': loggedInUser.displayName,
                    'id': Provider.of<Productdata>(context, listen: false)
                        .productsList
                        .length,
                  });
                  _scaffoldKey.currentState.showSnackBar(SnackBar(
                    content: Text('Done'),
                    duration: Duration(seconds: 3),
                  ));
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
