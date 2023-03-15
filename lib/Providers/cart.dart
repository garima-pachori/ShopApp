import 'package:flutter/foundation.dart';

class CartItems{
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItems({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price
  });
}

class Cart with ChangeNotifier{
    final Map<String,CartItems> _items={};

    Map<String, CartItems> get items{
      return {..._items};
    }

    int get itemCount{
      return  _items.length;
    }

    double get totalAmount{
      var total=0.0;
      _items.forEach((key, CartItem) {
          total += CartItem.price*CartItem.quantity;
      });
      return total;
    }

    void addItem(
      String productId,
      double price,
      String title
    )
    {
        if(_items.containsKey(productId)){
            _items.update(
              productId,
              (existingCartitem) => CartItems(
                id: existingCartitem.id, 
                title: existingCartitem.title, 
                quantity: existingCartitem.quantity, 
                price: existingCartitem.quantity+1
                )
            );
        }
        else{
            _items.putIfAbsent(
              productId,
              () =>CartItems(
                id: DateTime.now().toString(), 
                title: title, 
                quantity: 1, 
                price: price
            )
          );
        }
        notifyListeners();
    }
}