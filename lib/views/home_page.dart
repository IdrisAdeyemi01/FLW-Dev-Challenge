import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jumga_flutterwave_project/components/colors.dart' as colours;
import 'package:jumga_flutterwave_project/models/product.dart';
import 'package:jumga_flutterwave_project/models/product_data.dart';
// import 'package:jumga_flutterwave_project/views/seller/be_a_seller.dart';
import 'package:jumga_flutterwave_project/custom_widgets/product_box.dart';
import 'package:jumga_flutterwave_project/views/buyer/bag_page.dart';
import 'package:jumga_flutterwave_project/views/seller/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _firestore = FirebaseFirestore.instance;

  Future<List<Product>> getProductsFromFirebase() async {
    List<Product> newProductList = [];
    await for (var snapshots in _firestore.collection('products').snapshots()) {
      print(snapshots);
      for (var product in snapshots.docs) {
        final productId = product.data()['id'];
        print(productId);
        final productDeliveryNote = product.data()['delivery_note'];
        final productDescription = product.data()['description'];
        final productPrice = product.data()['price'];
        final productName = product.data()['product_name'];
        final productReturnPolicy = product.data()['return_policy'];
        final shopName = product.data()['shop_name'];
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
    }
    return newProductList;
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: colours.green100,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 20),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Wrapper()));
            },
            child: SvgPicture.asset('images/user_profile.svg',
                height: 20, width: 20),
          ),
        ),
        title: Center(
          child: Text(
            'JUMGA',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20, top: 10),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BagPage(),
                  ),
                );
              },
              child: Column(
                children: [
                  SvgPicture.asset(
                    'images/cart_bag.svg',
                    height: 25,
                    width: 20,
                  ),
                  SizedBox(height: 3),
                  Provider.of<Productdata>(context).bagLength >= 1
                      ? CircleAvatar(
                          radius: 5,
                          backgroundColor: Colors.yellow,
                        )
                      : Container()
                ],
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: StreamBuilder<QuerySnapshot>(
            stream: _firestore.collection('products').snapshots(),
            builder: (context, snapshots) {
              if (!snapshots.hasData ||
                  snapshots.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                Provider.of<Productdata>(context).productsList = [];
                // final productStreams = snapshots.data.docs;
                // for (var product in productStreams) {
                //   var data = product.data() as Map<String, dynamic>;
                //   final productId = data['id'];
                //   final productDeliveryNote = data['delivery_note'];
                //   final productDescription = data['description'];
                //   final productPrice = data['price'];
                //   final productName = data['product_name'];
                //   final productReturnPolicy = data['return_policy'];
                //   final shopName = data['shop_name'];
                //   Product newProduct = Product(
                //       deliveryNote: productDeliveryNote,
                //       id: productId,
                //       returnPolicy: productReturnPolicy,
                //       productDescription: productDescription,
                //       productPrice: productPrice,
                //       productName: productName,
                //       howMany: 1,
                //       shopName: shopName);
                //   Provider.of<Productdata>(context, listen: false)
                //       .addToProductList(newProduct);
                // }
                getProductsFromFirebase();
                print(Provider.of<Productdata>(context).productsList.length);
                return ListView.builder(
                  addAutomaticKeepAlives: false,
                  shrinkWrap: true,
                  itemCount: Provider.of<Productdata>(context, listen: false)
                      .productsList
                      .length,
                  itemBuilder: (context, index) => ProductBox(
                    index: index,
                    screenSize: screenSize,
                    ctx: context,
                  ),
                );
              }
            }),
      ),
    );
  }
}
