import 'dart:convert';
import 'package:flutter/material.dart';
import 'product.dart';
import 'package:http/http.dart' as http;

class ProductsProvider with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://media.istockphoto.com/id/183866576/photo/female-portrait.webp?b=1&s=170667a&w=0&k=20&c=ZRV-tczqSs3e4HVPO6hA1wLv1qaxG7PI4_qR2WZgCVE=',
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
    return _items.firstWhere(
      (product) => product.id == id,
    );
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

  Future<void> addProduct(Product product) async {
    final url = Uri.https(
        'shop-3e940-default-rtdb.asia-southeast1.firebasedatabase.app', '/');
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'title': product.title,
            'description': product.description,
            'price': product.price,
            'imageUrl': product.imageUrl,
            'isFavorite': product.isFavorite,
          },
        ),
      );
      final newProduct = Product(
        id: json.decode(response.body)['name'],
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
      );
      _items.add(newProduct);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  void updateProduct(String id, Product newProduct) {
    final productIndex = _items.indexWhere((prod) => prod.id == id);
    if (productIndex >= 0) {
      _items[productIndex] = newProduct;
      notifyListeners();
    } else {
      print('...');
    }
  }

  void deleteProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }
}
