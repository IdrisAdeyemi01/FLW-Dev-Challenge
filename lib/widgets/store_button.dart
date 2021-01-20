import 'package:flutter/material.dart';
import 'package:jumga_flutterwave_project/components/colors.dart' as colours;

class StoreButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  StoreButton({
    this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          padding: EdgeInsets.all(20),
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            color: colours.green30,
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: Text(
            label,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 16,
              color: colours.green100,
            ),
          ),
        ),
      ),
    );
  }
}