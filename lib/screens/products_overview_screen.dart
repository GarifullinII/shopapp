import 'package:flutter/material.dart';
import '../widgets/products_grid.dart';

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
        title: const Text('VC Shop'),
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
          ),
        ],
      ),
      body: ProductsGrid(showFavorites: _showFavoritesOnly),
    );
  }
}
