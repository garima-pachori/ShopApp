import 'package:flutter/material.dart';
import '../Providers/orders.dart' as ord;
import 'package:intl/intl.dart';
import 'dart:math';
class OrderItem extends StatefulWidget {
  final ord.OrderItem order;

    OrderItem(this.order);

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded=false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              '\$${widget.order.amount}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.green
              ),
            ),
            subtitle: Text(
              DateFormat('dd MM yyyy hh:mm').format(widget.order.dateTime),
              style: const TextStyle(
                color: Colors.black
              ),
            ),
            trailing: IconButton(
              icon: Icon(_expanded? Icons.expand_less : Icons.expand_more),
              onPressed: (){
                setState(() {
                  _expanded=!_expanded;
                });
              },
            ),
          ),
          if(_expanded)  Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
            height: min(widget.order.products.length * 20 + 10, 150),
            child: ListView(
              children: widget.order.products
              .map(
                (prod) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      prod.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const Divider(),
                     Text(
                      '${prod.quantity}x   \$${prod.price}',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.grey
                      ),
                     )
                  ],
                )
              )
              .toList(),
            ),
          )
        ],
      ),
    );
  }
}