import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_course/widgets/ui_elements/text_oswald_grey.dart';
import 'package:flutter_course/widgets/ui_elements/title_default.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final double price;

  ProductPage(this.title, this.description, this.price, this.imageUrl);

  Widget _buildAddressAndPriceRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextOswaldGrey("Union Square, San Fransisco", 20.0),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
          child: TextOswaldGrey("|", 20.0),
        ),
        TextOswaldGrey(
          '\$${price.toString()}', 20.0
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(imageUrl),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 0.0),
              margin: EdgeInsets.symmetric(horizontal: 2.0, vertical: 10.0),
              child: TitleDefault(title),
            ),
            _buildAddressAndPriceRow(),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                description,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Center(child: Text('Details of the product'),),
