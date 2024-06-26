import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/products_provider.dart';
import 'package:shopapp/widgets/product_item_widget.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavorites;

  const ProductsGrid({
    required this.showFavorites,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context);
    final product =
        showFavorites ? productsData.favoritesItem : productsData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: product?.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 3 / 2,
      ),
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: product?[index],
        child: const ProductItemWidget(
            // id: product[index].id,
            // title: product[index].title,
            // imageUrl: product[index].imageUrl,
            ),
      ),
    );
  }
}
