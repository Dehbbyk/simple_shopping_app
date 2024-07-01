import 'package:flutter/material.dart';
import 'package:simple_shopping_app/models.dart';

class ProductsScreen extends StatelessWidget {
  final List<Product> products = [
    Product(id: '1', name: 'Long Dress', price: 10.0),
    Product(id: '2', name: 'Nike Sneakers', price: 20.0),
    Product(id: '3', name: 'A pair of socks', price: 30.0),
    Product(id: '4', name: 'Shoe Rack', price: 60.0),
  ];

  final Function(Product) addItem;

  ProductsScreen({required this.addItem});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (ctx, index) {
        return ListTile(
          title: Text(products[index].name),
          subtitle: Text('\$${products[index].price}'),
          trailing: IconButton(
            icon: Icon(Icons.add),
            onPressed: () => addItem(products[index]),
          ),
        );
      },
    );
  }
}