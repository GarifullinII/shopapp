import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/cart.dart';
import 'package:shopapp/providers/orders.dart';
import 'package:shopapp/providers/products_provider.dart';
import 'package:shopapp/screens/cart_screen.dart';
import 'package:shopapp/screens/orders_screen.dart';
import 'package:shopapp/screens/product_detail_screen.dart';
import 'package:shopapp/screens/products_overview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.deepOrange,
          primaryColor: Colors.redAccent,
          fontFamily: 'Lato',
          textTheme: const TextTheme(
            bodyLarge: TextStyle(
              color: Colors.deepOrangeAccent,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
            bodyMedium: TextStyle(
              color: Colors.deepOrangeAccent,
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
            bodySmall: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 10,
            ),
          ),
        ),
        routes: {
          '/': (context) => const ProductsOverviewScreen(),
          ProductDetailScreen.routeName: (context) =>
              const ProductDetailScreen(),
          CartScreen.routeName: (context) => const CartScreen(),
          OrdersScreen.routeName: (context) =>
          const OrdersScreen(),
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(
              builder: (ctx) => const ProductsOverviewScreen());
        },
      ),
    );
  }
}
