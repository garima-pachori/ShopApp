import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Providers/orders.dart' show Orders;
import '../widgets/app_drawer.dart';
import '../widgets/Order_item.dart';

class OrdersScreen extends StatelessWidget {

  static const routeName='/order';

  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderData=Provider.of<Orders>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Orders!'),
        ),
        drawer: Appdrawer(),
        body: ListView.builder(
          itemCount: orderData.orders.length,
          itemBuilder: (ctx, i) => 
          OrderItem(orderData.orders[i]),
        ),
    );
  }
}