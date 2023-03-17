import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {

  final String id;
  final double price;
  final int quantity;
  final String title;

  CartItem(
    this.id,
    this.price,
    this.quantity,
    this.title
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 4
      ),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListTile(
          tileColor: Color.fromARGB(255, 171, 241, 118),
          leading: CircleAvatar(
            radius: 50.0,
            child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: FittedBox(child: Text('\$$price')),
          )),
          title: Text(title),
          subtitle: Text('Total: \$${(price*quantity)}'),
          trailing: CircleAvatar(
            child: Text('$quantity x')
          ),
        ),
        ),
    );
  }
}