import 'package:flutter/material.dart';

class Product {
  List<Image> pictureProducts;
  String productName;
  int productPrice;
  String shopName;
  String productDescription;
  String deliveryNote;
  String returnPolicy;
  List selections;
  int howMany;
  int totalAmount;
  int id;

  Product({
    this.id,
    this.deliveryNote,
    this.howMany = 1,
    this.pictureProducts,
    this.productDescription,
    this.productName,
    this.productPrice,
    this.returnPolicy,
    this.selections,
    this.shopName,
    this.totalAmount=1,
  });

  

  void increaseNumber() {
    howMany++;
    totalAmount = productPrice * howMany;
    print('How many: ' + howMany.toString());
    print('Total Amount: ' + totalAmount.toString());
  }

  void decreaseNumber() {
    if (howMany >= 2) {
      howMany--;
      totalAmount = productPrice * howMany;
      print(howMany);
      print('Total Amount: ' + totalAmount.toString());
    }
  }
}
