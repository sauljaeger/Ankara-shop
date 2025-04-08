import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/models/shop.dart';
import 'package:untitled/pages/cart_page.dart';
import 'package:untitled/pages/intropage.dart';
import 'package:untitled/pages/shop_page.dart';
import 'package:untitled/themes/light_mode.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Shop(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      theme: lightmode,
      routes: {
        '/intro_page': (context) => const IntroPage(),
        '/shop_page': (context) => const ShopPage(),
        '/cart_page': (context) => const CartPage(),
      },
    );
  }
}
