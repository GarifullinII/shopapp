import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/cart.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Consumer<Cart>(
                    builder: (BuildContext context, Cart cart, Widget? widget) {
                      return Chip(
                          label: Text(
                            '\$${cart.totalAmount}',
                          ),
                          backgroundColor: Colors.white);
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('ORDER NOW'),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
