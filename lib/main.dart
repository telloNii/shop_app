import 'package:design/models/cart.dart';
import 'package:design/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/homepage.dart';

void main(List<String> args) {
  runApp(Shopper());
}

class Shopper extends StatefulWidget {
  @override
  _ShopperState createState() => _ShopperState();
}

class _ShopperState extends State<Shopper> {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (BuildContext context) {
        return CartItems();
      },
      child: MaterialApp(
        // theme: ThemeData.dark(),
        // themeMode: ThemeMode.system,
        home: HomePage(),
        routes: {
          HomePage.id: (context) => HomePage(),
          CartScreen.id: (context) => CartScreen(),
        },
      ),
    );
  }
}
