import 'package:flutter/material.dart';
import 'package:shop_app/Providers/Products.dart';
import 'package:shop_app/Providers/cart.dart';
import 'package:shop_app/widgets/cart_item.dart';

class OrderItem{
  final String id;
  final double amount;
  final List<CartItems> products;
  final DateTime dateTime;

  OrderItem({
    required this.id,
    required this.amount,
    required this.products,
    required this.dateTime
  });
}

class Orders with ChangeNotifier{
    List<OrderItem> _order=[];

    List<OrderItem> get orders{
      return [..._order];
    }

    void addOrder(List<CartItems> cartProducts, double total){
      _order.insert(0, OrderItem(
        id: DateTime.now().toString(), 
        amount: total, 
        products: cartProducts, 
        dateTime: DateTime.now()
      ));
      notifyListeners();
    }
}