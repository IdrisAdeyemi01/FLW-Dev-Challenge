import 'package:flutter/material.dart';

class ShopOwner {
  final String firstName;
  final String lastName;
  final String emailAddress;
  final String phoneNumber;
  final dynamic password;
  final Image picture;

  ShopOwner({
    this.emailAddress,
    this.firstName,
    this.lastName,
    this.password,
    this.phoneNumber,
    this.picture,
  });
}
