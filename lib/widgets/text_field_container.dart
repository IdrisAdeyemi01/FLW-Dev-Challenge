import 'package:flutter/material.dart';
import 'package:jumga_flutterwave_project/components/colors.dart' as colours;

class TextFieldContainer extends StatelessWidget {
  TextFieldContainer({
    @required this.hintText,
    this.textfieldWidth,
    this.onChanged,
    this.keyboardType,
    this.obscureText
  });

  final String hintText;
  final double textfieldWidth;
  final Function onChanged;
  final TextInputType keyboardType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Container(
        padding: EdgeInsets.only(left: 15),
        height: 50,
        width: textfieldWidth ?? MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border.all(
              color: colours.lightGrey,
            ),
            borderRadius: BorderRadius.all(Radius.circular(4)),
            color: Colors.white),
        child: TextField(
          obscureText: obscureText??false,
          cursorColor: colours.green90,
          keyboardType: keyboardType ?? null,
          onChanged: onChanged,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
          ),
        ),
      ),
    );
  }
}
