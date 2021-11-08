// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jumga_flutterwave_project/auth/auth.dart';
import 'package:jumga_flutterwave_project/components/colors.dart' as colours;
import 'package:jumga_flutterwave_project/custom_widgets/dark_green_button.dart';
import 'package:jumga_flutterwave_project/models/shop_owner.dart';
import 'package:jumga_flutterwave_project/models/shop_owner_data.dart';
import 'package:jumga_flutterwave_project/views/home_page.dart';
import 'package:jumga_flutterwave_project/views/seller/my_store.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _auth = AuthService();

  @override
  void initState() {
    user = _auth.auth.currentUser;
    super.initState();
  }

  User user;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ShopOwnerData>(
        stream: ShopOwnerDataBase(user.uid).shopOwnerDocument,
        builder: (context, snapshot) {
          ShopOwnerData _shopOwner = snapshot.data;
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              backgroundColor: colours.green10,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: colours.green100,
                title: Text(
                  'Profile',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                actions: [
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyStore(),
                          ),
                        );
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => CreateStoreIntro(),
                        //   ),
                        // );
                      },
                      child: SvgPicture.asset('images/store.svg'),
                    ),
                  ),
                ],
              ),
              body: _shopOwner == null
                  ? Center(child: CircularProgressIndicator())
                  : Container(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            height:
                                150, //MediaQuery.of(context).size.height * 0.2,
                            color: colours.green100,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: colours.lightGrey,
                                        backgroundImage:
                                            _shopOwner.picture == null
                                                ? null
                                                : NetworkImage(
                                                    '${_shopOwner.picture}'),
                                        child: _shopOwner.picture == null
                                            ? Icon(
                                                Icons.person,
                                                size: 30,
                                                color: colours.appGrey,
                                              )
                                            : null,
                                        radius: 30,
                                      ),
                                      SizedBox(width: 30),
                                      Expanded(
                                        child: Text(
                                            '${_shopOwner.firstName} ${_shopOwner.lastName}',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 24,
                                                fontWeight: FontWeight.w600)),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 60,
                                  child: TabBar(
                                    indicatorColor: colours.green60,
                                    indicatorWeight: 5,
                                    tabs: [
                                      Tab(
                                        text: 'PERSONAL',
                                      ),
                                      Tab(
                                        text: 'ACCOUNT',
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: colours.green10,
                              // height: MediaQuery.of(context).size.height * 0.7,
                              child: TabBarView(
                                children: [
                                  PersonalTab(
                                    shopOwnerData: _shopOwner,
                                  ),
                                  AccountTab(),
                                ],
                              ),
                            ),
                          ),
                          DarkGreenButton(
                            label: 'Sign Out',
                            onPressed: () async {
                              await _auth.auth.signOut().whenComplete(() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(),
                                  ),
                                );
                              });
                            },
                          )
                        ],
                      ),
                    ),
            ),
          );
        });
  }
}

class AccountTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Currently not available'),
      ),
    );
  }
}

class PersonalTab extends StatelessWidget {
  PersonalTab({this.shopOwnerData});

  final ShopOwnerData shopOwnerData;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 30),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Text(
                  'First Name',
                  style: TextStyle(
                      color: colours.green100,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Expanded(
                child: Text(
                  '${shopOwnerData.firstName}',
                  style: TextStyle(
                    color: colours.green100,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Text(
                  'Last Name',
                  style: TextStyle(
                    color: colours.green100,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  '${shopOwnerData.lastName}',
                  style: TextStyle(
                      color: colours.green100,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Text(
                  'Address',
                  style: TextStyle(
                      color: colours.green100,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Expanded(
                child: Text(
                  '${shopOwnerData.city}, ${shopOwnerData.state}, ${shopOwnerData.country}',
                  style: TextStyle(
                      color: colours.green100,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          // SizedBox(height: 30),
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Container(
          //       width: 150,
          //       child: Text(
          //         'Address',
          //         style: TextStyle(
          //             color: colours.green100,
          //             fontSize: 16,
          //             fontWeight: FontWeight.w400),
          //       ),
          //     ),
          //     Expanded(
          //       child: Text(
          //         '10, Ogunjobi Street, Dopemu, Agege, Lagos',
          //         maxLines: 2,
          //         style: TextStyle(
          //             color: colours.green100,
          //             fontSize: 18,
          //             fontWeight: FontWeight.w700),
          //       ),
          //     ),
          //   ],
          // ),
          SizedBox(height: 30),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Text(
                  'Email',
                  style: TextStyle(
                      color: colours.green100,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Expanded(
                child: Text(
                  '${shopOwnerData.emailAddress}',
                  style: TextStyle(
                      color: colours.green100,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
