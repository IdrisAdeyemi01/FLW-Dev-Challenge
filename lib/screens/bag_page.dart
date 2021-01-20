import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jumga_flutterwave_project/components/colors.dart' as colours;
import 'package:jumga_flutterwave_project/models/product_data.dart';
import 'package:jumga_flutterwave_project/screens/check_out_page.dart';
import 'package:jumga_flutterwave_project/widgets/dark_green_button.dart';
import 'package:jumga_flutterwave_project/widgets/bag_item_tile.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class BagPage extends StatelessWidget {
  BagPage({this.productList, this.bagBuilder});
  final productList;
  final bagBuilder;

  @override
  Widget build(BuildContext context) {
    var f = NumberFormat('#,###,###', 'en_us');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 20),
          child: FittedBox(
            child: Row(
              children: [
                SvgPicture.asset('images/cart_bag.svg',
                    color: colours.green100),
                SizedBox(width: 3),
                Text(
                  '${Provider.of<Productdata>(context).productsInBag.length}',
                  style: TextStyle(
                      color: colours.green100,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )
              ],
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
                        'Keep Shopping',
                        style: TextStyle(
                          color: colours.green100,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              )),
        ],
      ),
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    child: ListView.builder(
                      itemCount: Provider.of<Productdata>(context).bagLength,
                      itemBuilder: (context, bagIndex) => BagItemTile(
                        valueCount: Provider.of<Productdata>(context)
                            .getProductFromId(Provider.of<Productdata>(context)
                                .productsInBag[bagIndex]
                                .id)
                            .howMany,
                        bagIndex: bagIndex,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'NGN ${f.format(Provider.of<Productdata>(context).finalAmount())}',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          letterSpacing: 2,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: colours.appGrey),
                    ),
                    SizedBox(height: 40),
                    DarkGreenButton(
                      label: 'Check Out',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CheckOutPage(),
                          ),
                        );
                      },
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}
