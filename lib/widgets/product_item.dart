import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Providers/product.dart';
import 'package:shop_app/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageURL;

  // const ProductItem(
  //   this.id, 
  //   this.title, 
  //   this.imageURL,
    
  // );

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            icon: Icon(
              product.isFavorite?
              Icons.favorite:
              Icons.favorite_border
            ), 
            onPressed: () {
              product.toggleFavouriteStatus();
            },
            color: Theme.of(context).accentColor,
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            onPressed: (){}, 
            icon: const Icon(
              Icons.shopping_cart
            ),
            color: Theme.of(context).accentColor,
            ),
        ),
        child: GestureDetector(
          onTap: (){
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageURL,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}