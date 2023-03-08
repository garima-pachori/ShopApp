import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/ProductsGrid.dart';
import '../Providers/Products.dart';

enum FilterOptions{
  Favourites,
  All,
}

class ProductOverviewScreen extends StatefulWidget {

  const ProductOverviewScreen({super.key});

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showFavouritesOnly=false;
  
  @override
  Widget build(BuildContext context) {
    final productsContainer=Provider.of<Products>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions SelectedValue) {
              setState(() {
                if(SelectedValue==FilterOptions.Favourites){
                _showFavouritesOnly=true;
              }
              else{
                _showFavouritesOnly=false;
              }
              });
            },
            icon: const Icon(Icons.more_vert,),
            itemBuilder: (_) => [
              const PopupMenuItem(
                child: Text('Only Favourites'),
                value: FilterOptions.Favourites,
              ),
              const PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.All,
              ),
            ],
           ),
           Badge(
            child:  IconButton(
              icon: const Icon(
                Icons.shopping_cart
                ), 
              onPressed: () {},
            ),
           )
        ],
      ),
      body: ProductsGrid(_showFavouritesOnly),
    );
  }
}

