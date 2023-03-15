import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/ProductsGrid.dart';
import '../Providers/Products.dart';
import '../Providers/cart.dart';
import '../widgets/badge.dart';

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

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'My Shop',
          ),
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
                  value: FilterOptions.Favourites,
                  child: Text('Only Favourites'),
                ),
                const PopupMenuItem(
                  value: FilterOptions.All,
                  child: Text('Show All'),
                ),
              ],
             ),
              Consumer<Cart>(
                builder: (_, cart , ch) => BadgeWidget(
                  value: cart.itemCount.toString(),
                  color: Theme.of(context).colorScheme.secondary,
                  child:  ch!
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.shopping_cart
                      ), 
                    onPressed: () {  }, 
                ),
              ),
          ],
        ),
        body: ProductsGrid(_showFavouritesOnly),
      ),
    );
  }
}

