import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';
import '../widgets/ProductsGrid.dart';

class ProductOverviewScreen extends StatelessWidget {

  ProductOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shop'),
      ),
      body: ProductsGrid(),
    );
  }
}

