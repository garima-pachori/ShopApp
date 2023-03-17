import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Providers/cart.dart';
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
    final cart=Provider.of<Cart>(context, listen: false);


    //if we write (context, listen: false), so that it doesnt rebuilt everytime
    //but will only rebuilt certain part that are listening to changes through
    //wrapping around by consumer & it always listens to changes to the
    //nearest instance.


    // if we dont want the whole app to build when something changes, but only
    //a specific part of it, then dont use provider with ofcontext
    //instead wrap the widget with consumer<product> and provide it with 
    //ctx, product, child


    


    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(

    //child is the part that you dont want to change when any other thing
    //in it changes i.e the widget that you dont want to be rebuild

            builder: (ctx, product, _) => IconButton(
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
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            onPressed: (){
              cart.addItem(
                product.id,
                product.price, 
                product.title
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Added Item to cart!',
                      textAlign: TextAlign.center,
                    ),
                    duration: Duration(seconds: 2),
                  ),
      
                );
            }, 
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