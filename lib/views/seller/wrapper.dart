import 'package:flutter/material.dart';
import 'package:jumga_flutterwave_project/models/shop_owner.dart';
import 'package:jumga_flutterwave_project/views/seller/be_a_seller.dart';
import 'package:jumga_flutterwave_project/views/seller/profile_page.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ShopOwner>(context);
    return user.uid != null ? ProfilePage() : BeASeller();
  }
}
