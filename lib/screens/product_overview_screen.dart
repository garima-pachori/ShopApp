import 'package:flutter/material.dart';
import 'package:shop_app/Providers/product.dart';
import '../widgets/ProductsGrid.dart';

class ProductOverviewScreen extends StatelessWidget {

  ProductOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (int SelectedValue) {
              print(SelectedValue);
            },
            icon: Icon(Icons.more_vert,),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favourites'),
                value: 0,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: 1,
              ),
            ],
           )
        ],
      ),
      body: ProductsGrid(),
    );
  }
}

