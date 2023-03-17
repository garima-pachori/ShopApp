import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Providers/orders.dart';
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
              margin: const EdgeInsets.all(15),
              child: Padding(
                padding: const EdgeInsets.all(8),
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
                        style: const TextStyle(
                          color: Colors.white
                        ),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    ElevatedButton(
                      onPressed: (){
                        Provider.of<Orders>(context, listen: false).addOrder(
                          cart.items.values.toList(), 
                          cart.totalAmount
                        );
                        cart.Clear();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 0, 119, 16)
                      ), 
                      child: const Text(
                        'Order Now!',
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                    )
                  ]
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Expanded(child: ListView.builder(
              itemCount: cart.itemCount,
              itemBuilder: (context, i) => 
              CartItem(
                cart.items.values.toList()[i].id,
                cart.items.keys.toList()[i],
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