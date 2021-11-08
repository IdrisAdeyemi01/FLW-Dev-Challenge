import 'dart:convert';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:jumga_flutterwave_project/components/colors.dart' as colours;
import 'package:jumga_flutterwave_project/models/product_data.dart';
import 'package:jumga_flutterwave_project/custom_widgets/dark_green_button.dart';
import 'package:jumga_flutterwave_project/custom_widgets/text_field_container.dart';
import 'package:jumga_flutterwave_project/components/all_banks.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class UseBankAccount extends StatefulWidget {
  @override
  _UseBankAccountState createState() => _UseBankAccountState();
}

class _UseBankAccountState extends State<UseBankAccount> {
  List<DropdownMenuItem> getDropdownList() {
    print(fetchBanksList());
    List<DropdownMenuItem> listOfDropdown = [];
    for (var i in fetchBanksList()) {
      listOfDropdown.add(
        DropdownMenuItem(
          child: Text(i),
          value: fetchBanksCodes().elementAt(fetchBanksList().indexOf(i)),
        ),
      );
    }
    return listOfDropdown;
  }

  String url = 'https://api.flutterwave.com/v3/charges?type=debit_ng_account';
  Future payWithBank() async {
    http.Response response = await http.post(
      Uri(path: url),
      body: jsonEncode({
        "tx_ref": "JMG - 001",
        "amount":
            "${Provider.of<Productdata>(context, listen: false).shoppingAmount}",
        "account_bank": bankCode,
        "account_number": accountNumber,
        "currency": "USD",
        "email": "idrisade.eedris@gmail.com",
        "phone_number": '08135469842', //"${Provider.of<Buyer>(context).}",
        "fullname": accountName,
      }),
      headers: {
        'Authorization':
            'Bearer FLWSECK_TEST-dd7f955d307d16ebcba01844304357d1-X',
        'Content-Type': 'application/json'
      },
    );
    if (response.statusCode == 200) {}
    print(response.body);
    print(response.statusCode);
  }

  bool _isloading = false;

  String bankCode;
  String accountNumber;
  String accountName;
  String dropdownValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text('Pay with Bank Account',
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
                      padding: EdgeInsets.only(
                          top: 5, bottom: 5, right: 20, left: 20),
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
        body: ModalProgressHUD(
          inAsyncCall: _isloading,
          child: Container(
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bank Name',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: colours.lightGrey,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          color: Colors.white),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          // value: dropdownValue,
                          items: getDropdownList(),
                          onChanged: (value) {
                            dropdownValue = fetchBanksList()
                                .elementAt(fetchBanksCodes().indexOf(value));
                            bankCode = value;
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Account Number',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextFieldContainer(
                      hintText: '0011223344',
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        accountNumber = value;
                      },
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Account Name',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextFieldContainer(
                      hintText: 'Pragmatics Hello',
                      keyboardType: TextInputType.name,
                      onChanged: (value) {
                        accountName = value;
                      },
                    ),
                    SizedBox(height: 30),
                    SizedBox(height: 50),
                    DarkGreenButton(
                      label: 'Pay',
                      onPressed: () {
                        setState(() {
                          _isloading = true;
                        });

                        payWithBank();
                        setState(() {
                          _isloading = false;
                        });
                      },
                    )
                  ],
                ),
              )),
        ));
  }
}
