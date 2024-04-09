import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/widgets/app_drawer_widget.dart';
import 'package:shopapp/widgets/custom_badge_widget.dart';
import '../providers/cart.dart';
import '../widgets/products_grid_widget.dart';
import 'cart_screen.dart';

enum FilterOption { favorite, all }

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({super.key});

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool _showFavoritesOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'VC Shop',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOption selectedValue) {
              if (selectedValue == FilterOption.favorite) {
                _showFavoritesOnly = true;
              } else {
                _showFavoritesOnly = false;
              }
              setState(() {});
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: FilterOption.favorite,
                child: Text('Only favorite'),
              ),
              const PopupMenuItem(
                value: FilterOption.all,
                child: Text('Show all'),
              ),
            ],
            shadowColor: Theme.of(context).primaryColor,
          ),
          Consumer<Cart>(
            builder: (BuildContext context, Cart cart, Widget? widget) {
              return CustomBadge(
                value: cart.itemCount.toString(),
                child: widget!,
              );
            },
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      drawer: const AppDrawerWidget(),
      body: ProductsGrid(showFavorites: _showFavoritesOnly),
    );
  }
}
