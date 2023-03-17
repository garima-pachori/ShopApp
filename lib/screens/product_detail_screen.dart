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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  LoadedProduct.imageURL,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10,),
            CircleAvatar(
              radius: 50,
              child: Text(
                '\$${LoadedProduct.price}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10
              ),
              width: double.infinity,
              child: Text(
                LoadedProduct.description,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}