import 'package:flutter/material.dart';
import 'package:jumga_flutterwave_project/models/product.dart';

List<Image> imagesList = [
  Image.asset(
    'images/durag1.jpg',
    fit: BoxFit.fill,
  ),
  Image.asset(
    'images/durag2.jpg',
    fit: BoxFit.fill,
  ),
  Image.asset(
    'images/durag3.jpg',
    fit: BoxFit.fill,
  ),
  Image.asset(
    'images/durag4.jpg',
    fit: BoxFit.fill,
  ),
];

class Productdata extends ChangeNotifier {
  int shoppingAmount = 0;
  List<Product> productsList = [
    Product(
        id: 1,
        deliveryNote: 'I go bring am come your house',
        howMany: 1,
        pictureProducts: imagesList,
        productDescription: 'E fine na, buy am',
        productName: 'Confirm Head cover',
        productPrice: 5000,
        returnPolicy: 'If you don carry am go, na bye bye be dat',
        selections: ['M', 'L', 'XL'],
        shopName: 'Mama Tee',
        totalAmount: 5000),
    Product(
        id: 2,
        deliveryNote: 'I go bring am come your house with bikeman',
        howMany: 1,
        pictureProducts: imagesList.sublist(1),
        productDescription: 'You go like am',
        productName: 'Cover your head',
        productPrice: 10000,
        returnPolicy: 'No return am oo',
        selections: ['M', 'L', 'XL', 'Any'],
        shopName: 'Idris Idris',
        totalAmount: 10000),
  ];

  void addToProductList(Product product) {
    productsList.add(product);
  }

  int productId(x) {
    return productsList[x].id;
  }

  Product getProductFromId(int idNum) {
    Product p;
    for (Product product in productsList) {
      if (product.id == idNum) {
        p = product;
      }
    }
    return p;
  }

  void increaseCounter(x) {
    // productsInBag[x];
    notifyListeners();
  }

  void decreaseCounter(x) {
    // productsInBag[x]
    notifyListeners();
  }

  int finalAmount() {
    shoppingAmount = 0;
    for (Product products in productsInBag) {
      int pAmount = products.totalAmount;
      shoppingAmount += pAmount;
    }

    return shoppingAmount;
  }

  List<Product> productsInBag = [];

  int get bagLength {
    return productsInBag.length;
  }

  void addToBag(Product product) {
    productsInBag.add(product);
    notifyListeners();
  }

  void removeFromBag(Product product) {
    productsInBag.remove(product);
    notifyListeners();
  }
}
