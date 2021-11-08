import 'package:flutter/material.dart';
import 'package:jumga_flutterwave_project/components/colors.dart' as colours;

class DarkGreenButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  final Color containerColor;
  final Color textColor;

  DarkGreenButton({
    @required this.label,
    @required this.onPressed,
    this.containerColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
            color: containerColor ?? colours.green100),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
