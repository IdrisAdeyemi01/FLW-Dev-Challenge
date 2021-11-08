import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jumga_flutterwave_project/auth/auth.dart';
import 'package:jumga_flutterwave_project/components/colors.dart' as colours;
import 'package:jumga_flutterwave_project/models/shop_owner.dart';
import 'package:jumga_flutterwave_project/models/shop_owner_data.dart';
import 'package:jumga_flutterwave_project/views/seller/my_products.dart';
import 'package:jumga_flutterwave_project/custom_widgets/store_button.dart';

class MyStore extends StatelessWidget {
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  final _auth = AuthService();
  final CollectionReference shopOwners =
      FirebaseFirestore.instance.collection('sellers');
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ShopOwnerData>(
        stream: ShopOwnerDataBase(_auth.auth.currentUser.uid).shopOwnerDocument,
        builder: (context, snapshot) {
          if (!snapshot.hasData ||
              snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              color: colours.green90,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            ShopOwnerData _shopOwner = snapshot.data;
            return Scaffold(
              key: _scaffoldMessengerKey,
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
                          CircleAvatar(
                            backgroundColor: colours.lightGrey,
                            backgroundImage: _shopOwner.picture == null
                                ? null
                                : NetworkImage('${_shopOwner.picture}'),
                            child: _shopOwner.picture == null
                                ? Icon(
                                    Icons.person,
                                    size: 30,
                                    color: colours.appGrey,
                                  )
                                : null,
                            radius: 25,
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Text(
                              '${_shopOwner.firstName} ${_shopOwner.lastName}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
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
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Coming soon'),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        },
                      ),
                      StoreButton(
                        label: 'Edit Details',
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Coming soon'),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        });
  }
}
