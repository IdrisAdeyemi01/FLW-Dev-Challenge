import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jumga_flutterwave_project/components/colors.dart' as colours;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:jumga_flutterwave_project/models/product_data.dart';
import 'package:jumga_flutterwave_project/custom_widgets/images_carousel.dart';
import 'package:jumga_flutterwave_project/custom_widgets/dark_green_button.dart';
import 'package:provider/provider.dart';

class ProductBox extends StatefulWidget {
  ProductBox({this.screenSize, this.ctx, this.index});
  final Size screenSize;
  final BuildContext ctx;
  final int index;

  @override
  _ProductBoxState createState() => _ProductBoxState();
}

class _ProductBoxState extends State<ProductBox> {
  CarouselController buttonCarouselController = CarouselController();

  // List<DropdownMenuItem<String>> getDropdown() {
  //   List<DropdownMenuItem<String>> dropdownItems = [];
  //   for (var i in Provider.of<Productdata>(context)
  //       .productsList[widget.index]
  //       .selections) {
  //     dropdownItems.add(
  //       DropdownMenuItem(child: Text(i), value: i),
  //     );
  //   }
  //   return dropdownItems;
  // }

  var dropdownItem;

  ScrollController scrollController = ScrollController();

  @override
  Widget build(ctx) {
    // int valueCount = Provider.of<Productdata>(ctx).productsList[widget.index].howMany;
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Container(
        // height: screenSize.height * 0.50,
        height: 350,
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding:
                    EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
                decoration: BoxDecoration(
                  color: colours.green30,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                child: Provider.of<Productdata>(context)
                            .productsList[widget.index]
                            .pictureProducts !=
                        null
                    ? Row(
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
                              child: Icon(Icons.chevron_left,
                                  size: 20, color: Colors.white),
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
                                items: Provider.of<Productdata>(context)
                                    .productsList[widget.index]
                                    .pictureProducts,
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
                              child: Icon(Icons.chevron_right,
                                  size: 20, color: Colors.white),
                            ),
                          ),
                        ],
                      )
                    : Container(color: colours.green40),
              ),
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: ctx,
                  builder: (context) => bottomSheet(),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
                padding: EdgeInsets.only(left: 20, top: 20),
                height: 90,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${Provider.of<Productdata>(context).productsList[widget.index].productName}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '${Provider.of<Productdata>(context).productsList[widget.index].productPrice}',
                      style: TextStyle(
                          color: colours.green90,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container bottomSheet() {
    return Container(
      color: colours.bottomSheetBackground,
      child: Container(
        decoration: BoxDecoration(
          color: colours.green10,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        height: widget.screenSize.height * 0.8,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: InkWell(
                onTap: () {
                  scrollController.animateTo(
                    5000,
                    duration: Duration(seconds: 1),
                    curve: Curves.linear,
                  );
                },
                child: Row(
                  children: [
                    Text(
                      'Buy',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(width: 5),
                    SvgPicture.asset('images/arrow_down.svg')
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Provider.of<Productdata>(context)
                                      .productsList[widget.index]
                                      .pictureProducts !=
                                  null
                              ? ImagesCarousel(index: widget.index)
                              : Container(),
                          SizedBox(height: 20),
                          Text(
                            '${Provider.of<Productdata>(context).productsList[widget.index].productName}',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'by ${Provider.of<Productdata>(context).productsList[widget.index].shopName}',
                            style: TextStyle(
                              color: colours.green90,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            '${Provider.of<Productdata>(context).productsList[widget.index].productDescription}',
                            style: TextStyle(
                              color: colours.appGrey,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'DELIVERY NOTES',
                            style: TextStyle(
                                color: colours.appGrey,
                                fontWeight: FontWeight.w700,
                                fontSize: 18),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${Provider.of<Productdata>(context).productsList[widget.index].deliveryNote}',
                            style: TextStyle(
                              color: colours.appGrey,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'RETURN POLICY',
                            style: TextStyle(
                                color: colours.appGrey,
                                fontWeight: FontWeight.w700,
                                fontSize: 18),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${Provider.of<Productdata>(context).productsList[widget.index].returnPolicy}',
                            style: TextStyle(
                              color: colours.appGrey,
                            ),
                          ),
                          SizedBox(height: 20),
                          // Text(
                          //   'Selection',
                          //   style: TextStyle(
                          //       fontSize: 18,
                          //       fontWeight: FontWeight.w700,
                          //       color: colours.appGrey),
                          // ),
                          SizedBox(height: 20),
                          // Container(
                          //   height: 40,
                          //   width: 130,
                          //   padding: EdgeInsets.only(
                          //       left: 15, right: 15, top: 10, bottom: 10),
                          //   decoration: BoxDecoration(
                          //       border: Border.all(
                          //         color: colours.appGrey,
                          //       ),
                          //       borderRadius: BorderRadius.circular(20),
                          //       color: Colors.transparent),
                          //   child: DropdownButtonHideUnderline(
                          //     child: DropdownButton(
                          //       hint: Text('Choose'),
                          //       value: dropdownItem,
                          //       isExpanded: true,
                          //       icon: Icon(Icons.expand_more),
                          //       items: getDropdown(),
                          //       onChanged: (val) {
                          //         // setState(() {
                          //         //   dropdownItem = val;
                          //         // });
                          //       },
                          //     ),
                          //   ),
                          // ),
                          // SizedBox(height: 20),
                          // Text(
                          //   'How Many',
                          //   style: TextStyle(
                          //       fontSize: 18,
                          //       fontWeight: FontWeight.w700,
                          //       color: colours.appGrey),
                          // ),
                          // SizedBox(height: 20),
                          // ItemCounter(
                          //   valueCount: Provider.of<Productdata>(context)
                          //       .productsInBag[widget.index]
                          //       .howMany,
                          //   onIncrease: () {
                          //     Provider.of<Productdata>(context, listen: false)
                          //         .increaseCounter(widget.index);
                          //   },
                          //   onDecrease: () {
                          //     Provider.of<Productdata>(context, listen: false)
                          //         .decreaseCounter(widget.index);
                          //   },
                          // ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Price',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: colours.appGrey),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'NGN ${Provider.of<Productdata>(context).productsList[widget.index].productPrice}',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: colours.appGrey),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          DarkGreenButton(
                            label: 'Add to Bag',
                            onPressed: () {
                              if (!Provider.of<Productdata>(context,
                                      listen: false)
                                  .productsInBag
                                  .contains(Provider.of<Productdata>(context,
                                          listen: false)
                                      .productsList[widget.index])) {
                                Provider.of<Productdata>(context, listen: false)
                                    .addToBag(Provider.of<Productdata>(context,
                                            listen: false)
                                        .productsList[widget.index]);
                              }
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
