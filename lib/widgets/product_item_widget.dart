import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/cart.dart';
import '../providers/product.dart';
import '../screens/product_detail_screen.dart';

class ProductItemWidget extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  const ProductItemWidget({
    // required this.id,
    // required this.title,
    // required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(
      context,
    );
    final cart = Provider.of<Cart>(
      context,
      listen: false,
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
              builder: (BuildContext context, Product product, Widget? _) {
            return IconButton(
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
              ),
              onPressed: () {
                product.toggleFavoriteStatus();
              },
            );
          }),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.shopping_cart),
            color: Theme.of(context).primaryColor,
            onPressed: () {
              cart.addItem(product.id, product.price, product.title);
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Theme.of(context).primaryColor,
                  duration: const Duration(seconds: 2),
                  action: SnackBarAction(
                    label: 'UNDO',
                    onPressed: () {
                      cart.removeSingleItem(product.id);
                    },
                  ),
                  content: Text(
                    'Added item to cart!',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              );
            },
          ),
        ),
        child: GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(
            ProductDetailScreen.routeName,
            arguments: product.id,
          ),
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
