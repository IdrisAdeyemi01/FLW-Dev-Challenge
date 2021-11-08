import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jumga_flutterwave_project/auth/auth.dart';
import 'package:jumga_flutterwave_project/models/buyers.dart';
import 'package:jumga_flutterwave_project/models/product_data.dart';
import 'package:jumga_flutterwave_project/models/shop_owner.dart';
import 'package:jumga_flutterwave_project/views/seller/be_a_seller.dart';
import 'views/home_page.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    user = _auth.currentUser;
    super.initState();
  }

  User user;
  @override
  Widget build(BuildContext context) {
    print(user);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Productdata(),
        ),
        ChangeNotifierProvider(
          create: (context) => Buyer(),
        ),
        Provider(
          create: (context) => ShopOwner(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'GraphikRegular',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
      ),
    );
  }
}
