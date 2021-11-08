import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jumga_flutterwave_project/components/colors.dart' as colours;
import 'package:jumga_flutterwave_project/views/payment_screens/pay_with_card.dart';
import 'package:jumga_flutterwave_project/views/payment_screens/use_bank_account.dart';

class PaymentMethod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Choose Payment Method',
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
        padding: EdgeInsets.all(20),
        child: Column(children: [
          PaymentCards(
            cardPicture: 'pay_with_card',
            title: 'Pay with Card',
            text:
                'You can pay with your debit card or virtual card created with us',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PayWithCard(),
                ),
              );
            },
          ),
          PaymentCards(
            cardPicture: 'ussd',
            title: 'USSD Code',
            text: 'You can pay using USSD code',
          ),
          PaymentCards(
              cardPicture: 'mobile_wallet',
              title: 'Use Mobile Wallet',
              text: 'You can pay using your preferred mobile wallet'),
          PaymentCards(
            cardPicture: 'bank_account',
            title: 'Use Bank Account',
            text: 'You can pay using your bank account details',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UseBankAccount(),
                ),
              );
            },
          ),
          SizedBox(height: 40),
          Text('powered with flutterwave')
        ]),
      ),
    );
  }
}

class PaymentCards extends StatelessWidget {
  final String cardPicture;
  final String title;
  final String text;
  final Function onPressed;

  PaymentCards({
    this.cardPicture,
    this.text,
    this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: InkWell(
        onTap: onPressed,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Container(
                  height: 100,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: colours.green90),
                  child: Center(
                    child: Container(
                        height: 30,
                        width: 50,
                        child: SvgPicture.asset('images/$cardPicture.svg')),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        text,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
