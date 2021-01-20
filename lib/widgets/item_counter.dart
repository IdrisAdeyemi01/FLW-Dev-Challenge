import 'package:flutter/material.dart';
import 'package:jumga_flutterwave_project/components/colors.dart' as colours;


class ItemCounter extends StatelessWidget {
  const ItemCounter(
      {Key key, @required this.valueCount, this.onDecrease, this.onIncrease,})
      : super(key: key);

  final int valueCount;

  final Function onIncrease;
  final Function onDecrease;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 120,
      padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      decoration: BoxDecoration(
          border: Border.all(
            color: colours.appGrey,
          ),
          borderRadius: BorderRadius.circular(20),
          color: Colors.transparent),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
              onTap: onDecrease,
              child: Icon(
                Icons.remove,
                size: 20,
                color: colours.appGrey,
              )),
          Text('$valueCount',
              style: TextStyle(color: colours.appGrey, fontSize: 18)),
          InkWell(
              onTap: onIncrease,
              child: Icon(
                Icons.add,
                size: 20,
                color: colours.appGrey,
              )),
        ],
      ),
    );
  }
}
