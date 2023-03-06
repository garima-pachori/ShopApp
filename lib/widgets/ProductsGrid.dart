import 'package:flutter/material.dart';
import '../Providers/product.dart';
import './product_item.dart';
import 'package:provider/provider.dart';
import '../Providers/Products.dart';

class ProductsGrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final productsData=Provider.of<Products>(context); 
    final products=productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx,i) => ChangeNotifierProvider(
        create: (c) => products[i],
        child: 
        ProductItem(
          // products[i].id,
          // products[i].title,
          // products[i].imageURL
        ),
      )
      ,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3/2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}