import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutterwave/models/responses/charge_response.dart';
import 'package:jumga_flutterwave_project/components/colors.dart' as colours;
import 'package:jumga_flutterwave_project/models/buyers.dart';
import 'package:jumga_flutterwave_project/models/product_data.dart';
import 'package:jumga_flutterwave_project/widgets/dark_green_button.dart';
import 'package:jumga_flutterwave_project/widgets/text_field_container.dart';
// import 'package:flutterwave/flutterwave.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart';
class PayWithCard extends StatefulWidget {
  @override
  _PayWithCardState createState() => _PayWithCardState();
}

class _PayWithCardState extends State<PayWithCard> {
  String cardNumber;
  String cvv;
  String expMonth;
  String expYear;
  String currency = 'NGN';
  String txRef = 'ABCXYZ';

  
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    int amount = Provider.of<Productdata>(context).finalAmount();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Pay with Card',
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
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
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              // height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              child: SvgPicture.asset('images/mastercard.svg'),
            ),
            SizedBox(height: 30),
            Text(
              'Card Number',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextFieldContainer(
              hintText: '9893 9893 9893 9893',
              keyboardType: TextInputType.number,
              onChanged: (value) {
                cardNumber = value;
              },
            ),
            SizedBox(height: 30),
            Text(
              'CVV',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextFieldContainer(
              hintText: '123',
              keyboardType: TextInputType.number,
              textfieldWidth: screenSize.width * 0.4,
              onChanged: (value) {
                cvv = value;
              },
            ),
            SizedBox(height: 30),
            Text(
              'Expiry Month',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextFieldContainer(
              hintText: '01',
              keyboardType: TextInputType.number,
              textfieldWidth: screenSize.width * 0.4,
              onChanged: (value) {
                expMonth = value;
              },
            ),
            SizedBox(height: 30),
            Text(
              'Expiry Year',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextFieldContainer(
              hintText: '21',
              keyboardType: TextInputType.number,
              textfieldWidth: screenSize.width * 0.4,
              onChanged: (value) {
                expYear = value;
              },
            ),
            SizedBox(height: 50),
            DarkGreenButton(
              label: 'PAY',
              onPressed: () {
                print(Provider.of<Buyer>(context, listen: false).fullName);

                // beginPayment();
              },
            )
          ]),
        ),
      ),
    );
  }
}

// beginPayment() async {
//                   final Flutterwave flutterwave = Flutterwave.forUIPayment(
//                       context: context,
//                       encryptionKey:
//                           "FLWSECK_TEST-dd7f955d307d16ebcba01844304357d1-X",
//                       publicKey:
//                           "FLWPUBK_TEST-f99195baa1c0aa669c90291a3a62d395-X",
//                       currency: currency,
//                       amount: '$amount',
//                       email: "idrisade.eedris@gmail.com",
//                       fullName: "${Provider.of<Buyer>(context).fullName}",
//                       txRef: txRef,
//                       isDebugMode: true,
//                       phoneNumber: "08135469842",
//                       acceptCardPayment: true,
//                       acceptUSSDPayment: false,
//                       acceptAccountPayment: false,
//                       acceptFrancophoneMobileMoney: false,
//                       acceptGhanaPayment: false,
//                       acceptMpesaPayment: false,
//                       acceptRwandaMoneyPayment: true,
//                       acceptUgandaPayment: false,
//                       acceptZambiaPayment: false);

//                   try {
//                     final ChargeResponse response =
//                         await flutterwave.initializeForUiPayments();
//                     if (response == null) {
//                       // user didn't complete the transaction. Payment wasn't successful.
//                       print('Payment not successful');
//                     } else {
//                       bool checkPaymentIsSuccessful(
//                           final ChargeResponse response) {
//                         return response.data.status ==
//                                 FlutterwaveConstants.SUCCESSFUL &&
//                             response.data.currency == currency &&
//                             response.data.amount == '$amount' &&
//                             response.data.txRef == txRef;
//                       }

//                       final isSuccessful = checkPaymentIsSuccessful(response);
//                       if (isSuccessful) {
//                         // provide value to customer
//                       } else {
//                         // check message
//                         print(response.message);

//                         // check status
//                         print(response.status);

//                         // check processor error
//                         print(response.data.processorResponse);
//                       }
//                     }
//                   } catch (error, stacktrace) {
//                     // handleError(error);
//                     print(stacktrace);
//                   }
//                 }
