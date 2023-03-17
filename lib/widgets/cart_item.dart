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
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).colorScheme.error,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
          margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4
        ),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
          ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        
      },
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            tileColor: const Color.fromARGB(255, 171, 241, 118),
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
      ),
    );
  }
}