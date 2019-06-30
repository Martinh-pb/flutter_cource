import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;

  ProductCreatePage(this.addProduct);

  @override
  State<StatefulWidget> createState() {
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String _titleValue = "";
  String _descriptionValue = "";
  double _priceValue = 0.0;

  Widget _buildProductTitleTextField() {
    return TextField(
        decoration: InputDecoration(labelText: 'Product title'),
        onChanged: (String value) {
          setState(() {
            _titleValue = value;
          });
        });
  }

  Widget _buildDescriptionTextField() {
    return TextField(
        decoration: InputDecoration(labelText: 'Product description'),
        maxLines: 4,
        onChanged: (String value) {
          setState(() {
            _descriptionValue = value;
          });
        });
  }

  Widget _buildPriceTextField() {
    return TextField(
        decoration: InputDecoration(labelText: 'Product price'),
        keyboardType: TextInputType.number,
        onChanged: (String value) {
          setState(() {
            _priceValue = double.parse(value);
          });
        });
  }

  void submitForm() {
    Map<String, dynamic> product = {
      'title': _titleValue,
      'description': _descriptionValue,
      'image': 'assets/food.jpg',
      'price': _priceValue
    };

    widget.addProduct(product);
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 768.0 ? 700.0 : deviceWidth * 0.95;
    final double paddingWidth = deviceWidth - targetWidth;

    return Container(
      margin: EdgeInsets.all(10.0),
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: paddingWidth / 2),
        children: <Widget>[
          _buildProductTitleTextField(),
          _buildDescriptionTextField(),
          _buildPriceTextField(),
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(   
            textColor: Colors.white,         
            child: Text("SAVE"),
            onPressed: submitForm,
          )
        ],
      ),
    );
  }
}
