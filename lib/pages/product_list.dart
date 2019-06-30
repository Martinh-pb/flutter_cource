import 'package:flutter/material.dart';
import 'package:flutter_course/pages/product_edit.dart';

class ProductListPage extends StatelessWidget {
  final Function deleteProduct;
  final Function updateProduct;
  final List<Map<String, dynamic>> products;

  ProductListPage({this.updateProduct, this.deleteProduct, this.products});

  Widget _buildEditButton(BuildContext context, int index) {
    return IconButton(
        icon: Icon(Icons.edit),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => ProductEditPage(
                        updateProduct: this.updateProduct,
                        product: products[index],
                        productIndex: index,
                      )));
        });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: Key(products[index]['title']),
          background: Container(color: Colors.red),
          onDismissed: (DismissDirection direction) {
            if (direction == DismissDirection.endToStart) {
              deleteProduct(index);
            }
          },
          child: Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(products[index]['image']),
                ),
                title: Text(products[index]['title']),
                subtitle: Text('\$${products[index]['price'].toString()}'),
                trailing: _buildEditButton(context, index),
              ),
              Divider(),
            ],
          ),
        );
      },
      itemCount: products.length,
    );
  }
}
