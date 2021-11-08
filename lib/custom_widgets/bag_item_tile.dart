import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jumga_flutterwave_project/models/product_data.dart';
import 'package:jumga_flutterwave_project/custom_widgets/item_counter.dart';
import 'package:jumga_flutterwave_project/components/colors.dart' as colours;
import 'package:provider/provider.dart';

class BagItemTile extends StatelessWidget {
  BagItemTile({this.valueCount, this.bagIndex});

  final int valueCount;
  final int bagIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: ListTile(
        dense: true,
        leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
            color: colours.green30,
          ),
        ),
        title: Text(
          '${Provider.of<Productdata>(context).productsInBag[bagIndex].productName}',
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        subtitle: Text(
            '''NGN ${Provider.of<Productdata>(context).productsInBag[Provider.of<Productdata>(context).productsList.indexOf(Provider.of<Productdata>(context).productsList[bagIndex])].productPrice}''',
            style: TextStyle(color: colours.appGrey, fontSize: 14)),
        trailing: FittedBox(
          child: Row(
            children: [
              Container(
                width: 100,
                child: ItemCounter(
                  valueCount: valueCount,
                  // productIndex: bagIndex,
                  onIncrease: () {
                    Provider.of<Productdata>(context, listen: false)
                        .increaseCounter(bagIndex);
                  },
                  onDecrease: () {
                    Provider.of<Productdata>(context, listen: false)
                        .decreaseCounter(bagIndex);
                  },
                ),
              ),
              SizedBox(width: 20),
              InkWell(
                  onTap: () {
                    Provider.of<Productdata>(context, listen: false)
                        .removeFromBag(
                            Provider.of<Productdata>(context, listen: false)
                                .productsInBag[bagIndex]);
                  },
                  child: SvgPicture.asset('images/delete_item.svg')),
            ],
          ),
        ),
      ),
    );
  }
}
