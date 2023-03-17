import 'package:flutter/material.dart';
import '../Providers/orders.dart' as ord;
import 'package:intl/intl.dart';

class OrderItem extends StatelessWidget {
  final ord.OrderItem order;

    OrderItem(this.order);


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              '\$${order.amount}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.green
              ),
            ),
            subtitle: Text(
              DateFormat('dd MM yyyy hh:mm').format(order.dateTime),
              style: const TextStyle(
                color: Colors.black
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.expand_more),
              onPressed: (){},
            ),
          )
        ],
      ),
    );
  }
}