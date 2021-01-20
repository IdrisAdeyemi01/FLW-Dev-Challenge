import 'package:flutter/cupertino.dart';

class Buyer extends ChangeNotifier {
  String fullName;
  String city;
  String state;
  String country;
  String deliveryNote;
  String deliveryAddress;

  Buyer({
    this.city,
    this.deliveryAddress,
    this.deliveryNote,
    this.fullName,
    this.state,
    this.country,
  });

  void setBuyersName(String name) {
    fullName = name;
    notifyListeners();
  }

  void setBuyersCity(String cit) {
    city = cit;
    notifyListeners();
  }

  void setBuyersState(String sta) {
    state = state;
    notifyListeners();
  }

  void setBuyersCountry(String coun) {
    country = coun;
    notifyListeners();
  }

  void setBuyersDeliveryAddress(String addr) {
    deliveryAddress = addr;
    notifyListeners();
  }

  void setBuyersDeliveryNote(String note) {
    deliveryNote = note;
    notifyListeners();
  }
}
