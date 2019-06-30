import 'package:flutter/material.dart';

class ProductListPage extends StatelessWidget {
  final Function deleteProduct;
  final List<Map<String, dynamic>> products;
  
  ProductListPage(this.deleteProduct, this.products);
  
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('List of my products'),);
  }
}