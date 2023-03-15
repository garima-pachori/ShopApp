import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/Products.dart';
import '../widgets/user_product_item.dart';

class UserProductScreen extends StatelessWidget {

  static const routeName='/user-products';
  const UserProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsData=Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                
              },
            )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: productsData.items.length,
          itemBuilder: (_,i) => UserProductItem
          (
            productsData.items[i].title, 
            productsData.items[i].imageURL
          ),
        ),
      ),
    );
  }
}