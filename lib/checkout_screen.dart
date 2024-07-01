import 'package:flutter/material.dart';
import 'package:simple_shopping_app/models.dart';
import 'order_successful_screen.dart';

class CheckoutScreen extends StatelessWidget {
  final List<Product> checkoutItems;
  final Function(String) removeItem;

  CheckoutScreen({required this.checkoutItems, required this.removeItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: checkoutItems.length,
            itemBuilder: (ctx, index) {
              return ListTile(
                title: Text(checkoutItems[index].name),
                subtitle: Text('\$${checkoutItems[index].price}'),
                trailing: IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () => removeItem(checkoutItems[index].id),
                ),
              );
            },
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => OrderSuccessfulScreen(),
              ),
            );
          },
          child: Text('Place Order'),
        ),
      ],
    );
  }
}