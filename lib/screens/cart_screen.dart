import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/cart.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {

  static const RouteName='/cart';

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart=Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart!'),
      ),
      body: Column(
        children: <Widget>[
            Card(
              margin: EdgeInsets.all(15),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 20
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Chip(
                      label: Text(
                        '\$${cart.totalAmount}',
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    ElevatedButton(
                      onPressed: (){}, 
                      child: const Text(
                        'Order Now!',
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 0, 119, 16)
                      ),
                    )
                  ]
                ),
              ),
            ),
            SizedBox(height: 10,),
            Expanded(child: ListView.builder(
              itemCount: cart.itemCount,
              itemBuilder: (context, i) => 
              CartItem(
                cart.items.values.toList()[i].id,
                cart.items.values.toList()[i].price,
                cart.items.values.toList()[i].quantity,
                cart.items.values.toList()[i].title
                ),
            ))
        ],
      ),
    );
  }
}