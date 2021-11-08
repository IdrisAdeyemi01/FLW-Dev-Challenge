import 'package:flutter/material.dart';
import 'package:jumga_flutterwave_project/auth/auth.dart';
import 'package:jumga_flutterwave_project/components/colors.dart' as colours;
import 'package:jumga_flutterwave_project/models/product.dart';
import 'package:jumga_flutterwave_project/models/shop_owner.dart';
import 'package:jumga_flutterwave_project/models/shop_owner_data.dart';
import 'package:jumga_flutterwave_project/views/seller/add_a_product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyProducts extends StatelessWidget {
  final _auth = AuthService();
  final _firestore = FirebaseFirestore.instance;
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
            backgroundColor: colours.green90,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: colours.green90,
              elevation: 0,
              leading: Container(
                height: 20,
                width: 20,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundImage: _shopOwner.picture == null
                        ? null
                        : NetworkImage('${_shopOwner.picture}'),
                    child: _shopOwner.picture == null
                        ? Icon(
                            Icons.person,
                            size: 10,
                            color: colours.appGrey,
                          )
                        : null,
                  ),
                ),
              ),
              title: Text(
                'My Products',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: colours.green20,
              child: Icon(
                Icons.add,
                color: colours.appGrey,
                size: 40,
              ),
              tooltip: 'Add a product',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddAProduct(),
                  ),
                );
              },
            ),
            body: Container(
              padding: EdgeInsets.all(20),
              child: Container(
                  child: StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('products').snapshots(),
                builder: (context, snapshots) {
                  if (snapshots.connectionState == ConnectionState.waiting ||
                      !snapshots.hasData) {
                    return CircularProgressIndicator.adaptive();
                  } else {
                    List<Product> newProductList = [];
                    for (var product in snapshots.data.docs) {
                      var data = product.data() as Map<String, dynamic>;
                      final productId = data['id'];
                      final productDeliveryNote = data['delivery_note'];
                      final productDescription = data['description'];
                      final productPrice = data['price'];
                      final productName = data['product_name'];
                      final productReturnPolicy = data['return_policy'];
                      final shopName = data['shop_name'];
                      Product newProduct = Product(
                          deliveryNote: productDeliveryNote,
                          id: productId,
                          returnPolicy: productReturnPolicy,
                          productDescription: productDescription,
                          productPrice: productPrice,
                          productName: productName,
                          shopName: shopName);
                      newProductList.add(newProduct);
                    }
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        print(index);
                        return Container(
                            alignment: Alignment.bottomLeft,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: colours.green50,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('${newProductList[index].productName}'),
                                Text(
                                  '${newProductList[index].productPrice}',
                                  textAlign: TextAlign.left,
                                )
                              ],
                            ));
                      },
                    );
                  }
                },
              )),
            ),
          );
        }
      },
    );
  }
}
