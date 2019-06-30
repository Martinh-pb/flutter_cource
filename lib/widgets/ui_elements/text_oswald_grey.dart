import 'package:flutter/material.dart';

class TextOswaldGrey extends StatelessWidget {
  final String text;
  final double fontSize;

  TextOswaldGrey(this.text, this.fontSize);

  @override
  Widget build(BuildContext context) {
    return Text(
          text,
          style: TextStyle(
              fontFamily: 'Oswald', fontSize: fontSize, color: Colors.grey),
        );
  }
}