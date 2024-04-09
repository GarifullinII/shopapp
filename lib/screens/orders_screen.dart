import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/orders.dart';
import '../widgets/app_drawer_widget.dart';
import '../widgets/order_item_widget.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';

  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your orders'),
      ),
      drawer: const AppDrawerWidget(),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (context, index) {
          return Consumer(
            builder: (BuildContext context, value, Widget? child) {
              return OrderItemWidget(order: orderData.orders[index]);
            },
          );
        },
      ),
    );
  }
}
