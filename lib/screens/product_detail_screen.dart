import 'package:flutter/material.dart';
import '../Providers/Products.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {

  // final String title;
  // final double price;

  // ProductDetailScreen(this.title,this.price);
  static const routeName='/product-detail';

  @override
  Widget build(BuildContext context) {
    final ProductId = ModalRoute.of(context)?.settings.arguments as String;
    final LoadedProduct=Provider.of<Products>(
        context, 
        listen: false
        //when i dont want to make changes to the ui or rebuilt the app
        //when any sort of changes again
        //then we set listen to false
      ).findById(ProductId);
    return Scaffold(
      appBar: AppBar(
        title: Text(LoadedProduct.title),
      ),
    );
  }
}