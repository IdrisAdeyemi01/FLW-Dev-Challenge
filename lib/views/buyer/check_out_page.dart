import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jumga_flutterwave_project/components/colors.dart' as colours;
import 'package:jumga_flutterwave_project/models/buyers.dart';
import 'package:jumga_flutterwave_project/models/product_data.dart';
import 'package:jumga_flutterwave_project/views/payment_screens/payment_method.dart';
import 'package:jumga_flutterwave_project/custom_widgets/dark_green_button.dart';
import 'package:jumga_flutterwave_project/custom_widgets/text_field_container.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class CheckOutPage extends StatefulWidget {
  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  var f = NumberFormat('#,###,###', 'en_us');
  String fullName;
  String city;
  String state;
  String country;
  String address;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
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
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.only(right: 20, left: 20, top: 30, bottom: 20),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Delivery Details',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFieldContainer(
                          hintText: 'Full Name',
                          onChanged: (value) {
                            Provider.of<Buyer>(context, listen: false)
                                .setBuyersName(value);
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextFieldContainer(
                              hintText: 'City',
                              textfieldWidth:
                                  MediaQuery.of(context).size.width * 0.40,
                              onChanged: (value) {
                                Provider.of<Buyer>(context, listen: false)
                                    .setBuyersCity(value);
                              },
                            ),
                            // SizedBox(width: 20),
                            TextFieldContainer(
                              hintText: 'State',
                              textfieldWidth:
                                  MediaQuery.of(context).size.width * 0.40,
                              onChanged: (value) {
                                Provider.of<Buyer>(context, listen: false)
                                    .setBuyersState(value);
                              },
                            ),
                          ],
                        ),
                        TextFieldContainer(
                          hintText: 'Country',
                          onChanged: (value) {
                            Provider.of<Buyer>(context, listen: false)
                                .setBuyersCountry(value);
                          },
                        ),
                        SizedBox(height: 40),
                        Text(
                          'Delivery Address',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextFieldContainer(
                          hintText: 'Address',
                          onChanged: (value) {
                            Provider.of<Buyer>(context, listen: false)
                                .setBuyersDeliveryAddress(value);
                          },
                        ),
                        SizedBox(height: 40),
                        Text(
                          'Delivery Notes',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextFieldContainer(
                          hintText: 'Optional',
                          onChanged: (value) {
                            Provider.of<Buyer>(context, listen: false)
                                .setBuyersDeliveryNote(value);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
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
                        Text(
                          'NGN ${f.format(Provider.of<Productdata>(context).finalAmount())}',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: colours.appGrey),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    DarkGreenButton(
                      label: 'Continue to Pay',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PaymentMethod()));
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
