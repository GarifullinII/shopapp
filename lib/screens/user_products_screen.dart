import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/products_provider.dart';
import 'package:shopapp/widgets/app_drawer_widget.dart';
import 'package:shopapp/widgets/user_product_item_widget.dart';
import 'package:shopapp/screens/edit_product_screen.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user_products';
  const UserProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context);

    Future<void> refreshProducts(BuildContext context) async {
      await Provider.of<ProductsProvider>(context, listen: false).fetchAndSetProducts();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your products',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                EditProductScreen.routeName,
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      drawer: const AppDrawerWidget(),
      body: RefreshIndicator(
        onRefresh: () => refreshProducts(context),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
              itemCount: productsData.items.length,
              itemBuilder: (_, index) {
                return Column(
                  children: [
                    UserProductItemWidget(
                      id: productsData.items[index].id ?? '',
                      title: productsData.items[index].title ?? 'No title',
                      imageUrl: productsData.items[index].imageUrl ?? 'No image',
                    ),
                    const Divider(),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
