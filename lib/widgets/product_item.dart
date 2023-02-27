import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageURL;

  const ProductItem(
    this.id, 
    this.title, 
    this.imageURL,
    
  );

  @override
  Widget build(BuildContext context) {
    return GridTile(
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        leading: IconButton(
          icon: const Icon(
            Icons.favorite
          ), onPressed: () {  },
        ),
        title: Text(
          title,
          textAlign: TextAlign.center,
        ),
        trailing: IconButton(
          onPressed: (){}, 
          icon: const Icon(
            Icons.shopping_cart
          )),
      ),
      child: Image.network(
        imageURL,
        fit: BoxFit.cover,
      ),
    );
  }
}