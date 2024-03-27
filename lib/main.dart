import 'package:flutter/material.dart';
import 'package:shopapp/screens/product_detail_screen.dart';
import 'package:shopapp/screens/products_overview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        primaryColor: Colors.deepOrangeAccent,
        fontFamily: 'Lato',
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => ProductsOverviewScreen(),
        ProductDetailScreen.routeName: (context) => const ProductDetailScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => ProductsOverviewScreen());
      },
    );
  }
}

