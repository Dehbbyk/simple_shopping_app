import 'package:flutter/material.dart';

class OrderSuccessfulScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Successful'),
      ),
      body: Center(
        child: Text('Your order was placed successfully!'),
      ),
    );
  }
}