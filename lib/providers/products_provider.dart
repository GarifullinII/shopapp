import 'package:flutter/material.dart';
import 'product.dart';

class ProductsProvider with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://media.istockphoto.com/id/651223788/ru/%D1%84%D0%BE%D1%82%D0%BE/%D1%81%D1%87%D0%B0%D1%81%D1%82%D0%BB%D0%B8%D0%B2%D1%8B%D0%B9-%D1%81%D0%BF%D0%BE%D1%80%D1%82%D1%81%D0%BC%D0%B5%D0%BD.jpg?s=1024x1024&w=is&k=20&c=P_JNLD_Nj-BSu3FXDNsHzgMBEnH5EreBM1sGFTYvvMY=',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://godwincharli.com/cdn/shop/files/126_96ab3c87-9574-40f8-aac7-5689c4154f6d_400x.jpg?v=1696666350',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://www.accessorize.com/dw/image/v2/BDLV_PRD/on/demandware.static/-/Sites-accessorize-master-catalog/default/dwe5079c44/images/large/21_38701198_1.jpg?sw=663&sh=848&sm=cut',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://www.thoughtco.com/thmb/A6XX-6SesR8eWPgDUg7ECtWEYG8=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/skillet-frying-pan-on-white-background-131919734-57e41d555f9b586c35918f3f.jpg',
    ),
  ];

  // late bool _showFavoritesOnly = false;

  List<Product> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((productItem) => productItem.isFavorite).toList();
    // }
    return [..._items];
  }

  List<Product>? get favoritesItem {
    return _items.where((element) => element.isFavorite).toList();
  }

  Product fineById(String id) {
    return _items.firstWhere((product) => product.id == id);
  }

  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }
  //
  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  void addProduct() {
    // _items.add(Product);
    notifyListeners();
  }
}
