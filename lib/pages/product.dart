import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_course/widgets/ui_elements/text_oswald_grey.dart';
import 'package:flutter_course/widgets/ui_elements/title_default.dart';

import 'package:scoped_model/scoped_model.dart';

import '../models/product.dart';
import '../scoped-models/product.dart';

class ProductPage extends StatelessWidget {
  final int productIndex;

  ProductPage(this.productIndex);

  Widget _buildAddressAndPriceRow(double price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextOswaldGrey("Union Square, San Fransisco", 20.0),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
          child: TextOswaldGrey("|", 20.0),
        ),
        TextOswaldGrey('\$${price.toString()}', 20.0),
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
      child: ScopedModelDescendant<ProductsModel>(
          builder: (BuildContext context, Widget child, ProductsModel model) {
        final Product product = model.products[productIndex];
        return Scaffold(
          appBar: AppBar(
            title: Text(product.title),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(product.image),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 0.0),
                margin: EdgeInsets.symmetric(horizontal: 2.0, vertical: 10.0),
                child: TitleDefault(product.title),
              ),
              _buildAddressAndPriceRow(product.price),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  product.description,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

//Center(child: Text('Details of the product'),),
