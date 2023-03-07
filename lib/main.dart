import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/User_Products.dart';
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
      providers: [
        ChangeNotifierProvider
        (
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider
        (
          create: (ctx) => Cart(),
        ),
    ], 
      //The ChangeNotifierProvider widget is part of the provider package, 
      //which is a state management solution that provides a convenient 
      //way to share data between widgets in a Flutter app

      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home:  ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          
          UserProductScreen.routeName: (ctx) => UserProductScreen(),
        },
      ),
    );
  }
}

