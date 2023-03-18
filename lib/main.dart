import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Providers/orders.dart';
import 'package:shop_app/screens/User_Products.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/screens/edit_product.dart';
import 'package:shop_app/screens/orders_screen.dart';
import 'package:shop_app/screens/product_detail_screen.dart';
import 'package:shop_app/screens/product_overview_screen.dart';
import './Providers/Products.dart';
import './Providers/cart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {

    return MultiProvider(

      //MultiProvider is a Flutter widget that allows you to wrap multiple Provider widgets together 
      //into a single widget tree. This is useful when you need to provide 
      //multiple dependencies to your widget tree, such as providing data from multiple models or services.
      
      providers: [
        ChangeNotifierProvider
        (
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider
        (
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider
        (
          create: (ctx) => Orders(),
        )
    ], 
      //The ChangeNotifierProvider widget is part of the provider package, 
      //which is a state management solution that provides a convenient 
      //way to share data between widgets in a Flutter app

      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: const Color.fromARGB(255, 225, 228, 39),
          fontFamily: 'Lato',
        ),
        home:  ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.RouteName: (ctx) => CartScreen(),
          UserProductScreen.routeName: (ctx) => UserProductScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
          ProductOverviewScreen.routeName: (ctx) => ProductDetailScreen(),
          EditProductScreen.routeName: (ctx) => EditProductScreen()
        },
      ),
    );
  }
}

