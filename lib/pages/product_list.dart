import 'package:flutter/material.dart';

class ProductListPage extends StatelessWidget {
  final Function deleteProduct;

  ProductListPage(this.deleteProduct);
  
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('List of my products'),);
  }
}