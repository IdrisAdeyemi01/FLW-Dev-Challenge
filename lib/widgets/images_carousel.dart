import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:jumga_flutterwave_project/components/colors.dart' as colours;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:jumga_flutterwave_project/models/product_data.dart';
import 'package:provider/provider.dart';

CarouselController buttonCarouselController = CarouselController();
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

class ImagesCarousel extends StatelessWidget {
  final int index;
  ImagesCarousel({this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
      decoration: BoxDecoration(
        color: colours.green30,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              return buttonCarouselController.previousPage(
                curve: Curves.linear,
              );
            },
            child: CircleAvatar(
              backgroundColor: colours.green70,
              radius: 15,
              child: Icon(Icons.chevron_left, size: 20, color: Colors.white),
            ),
          ),
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: colours.green90),
            child: CarouselSlider(
                carouselController: buttonCarouselController,
                items: Provider.of<Productdata>(context).productsList[index].pictureProducts,
                options: CarouselOptions(
                  autoPlay: false,
                  viewportFraction: 1,
                  pageSnapping: true,
                )),
          ),
          InkWell(
            onTap: () {
              return buttonCarouselController.nextPage(
                curve: Curves.linear,
              );
            },
            child: CircleAvatar(
              backgroundColor: colours.green70,
              radius: 15,
              child: Icon(Icons.chevron_right, size: 20, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
