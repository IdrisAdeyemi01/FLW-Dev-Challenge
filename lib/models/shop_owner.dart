class ShopOwner {
  final String uid;

  ShopOwner({this.uid});
}

class ShopOwnerData {
  final String firstName;
  final String lastName;
  final String emailAddress;
  final String phoneNumber;
  final String picture;
  final String address;
  final String city;
  final String state;
  final String country;

  ShopOwnerData(
      {this.emailAddress,
      this.firstName,
      this.lastName,
      this.phoneNumber,
      this.picture,
      this.address,
      this.city,
      this.country,
      this.state});
}
