import 'package:flutter/material.dart';
import 'package:simple_shopping_app/checkout_screen.dart';
import 'package:simple_shopping_app/models.dart';
import 'package:simple_shopping_app/product_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Shopping App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  List<Product> _checkoutItems = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _addItemToCheckout(Product product) {
    setState(() {
      _checkoutItems.add(product);
    });
  }

  void _removeItemFromCheckout(String productId) {
    setState(() {
      _checkoutItems.removeWhere((product) => product.id == productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Shopping App'),
      ),
      body: _selectedIndex == 0
          ? ProductsScreen(addItem: _addItemToCheckout)
          : CheckoutScreen(
        checkoutItems: _checkoutItems,
        removeItem: _removeItemFromCheckout,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_outlined),
            label: 'Checkout',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}