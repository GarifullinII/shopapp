import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product_detail';

  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String? productId = ModalRoute.of(context)?.settings.arguments as String?;
    final loadedProduct = Provider.of<ProductsProvider>(
      context,
      listen: false,
    ).fineById(productId ?? '');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          loadedProduct.title ?? 'No title',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                loadedProduct.imageUrl ?? 'No image',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Price \$${loadedProduct.price}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                loadedProduct.description ?? 'No description',
                textAlign: TextAlign.center,
                softWrap: true,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            )
          ],
        ),
      ),
    );
  }
}
