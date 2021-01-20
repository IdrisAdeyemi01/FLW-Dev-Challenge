import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jumga_flutterwave_project/screens/create_a_store01.dart';
import 'package:jumga_flutterwave_project/components/colors.dart' as colours;
import 'package:jumga_flutterwave_project/screens/create_a_store_intro.dart';
import 'package:jumga_flutterwave_project/screens/my_store.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    user = _auth.currentUser;
    super.initState();
  }

  var user;

  @override
  Widget build(BuildContext context) {
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
        body: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 150, //MediaQuery.of(context).size.height * 0.2,
                color: colours.green100,
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          CircleAvatar(
                              radius: 20, backgroundColor: colours.green30),
                          SizedBox(width: 30),
                          Expanded(
                            child: Text('${user.displayName}',
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
                      PersonalTab(user: user),
                      AccountTab(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
  PersonalTab({this.user});
  final User user;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 30),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 150,
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
                    '${user.displayName.split(' ')[0]}',
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
                  width: 150,
                  child: Text(
                    'Last Name',
                    style: TextStyle(
                        color: colours.green100,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Expanded(
                  child: Text(
                    '${user.displayName.split(' ')[2]}',
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
                  width: 150,
                  child: Text(
                    'Dispatch Key',
                    style: TextStyle(
                        color: colours.green100,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Expanded(
                  child: Text(
                    '${user.uid.substring(1, 6)}',
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
            SizedBox(height: 30)
          ],
        ));
  }
}
