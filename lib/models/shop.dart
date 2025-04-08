import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:untitled/models/product.dart';

class Shop extends ChangeNotifier {
  //list of products for sale
  final List<Product> _shop = [
    Product(
        name: 'Ocean Wreck Ankara',
        price: 150.0,
        description:
            'Depths of ocean, rust of the wreckage',
        imagePath: 'assets/fab_1.jfif'),
    Product(
        name: "Gold's of Egypt",
        price: 200.0,
        description:
            'Gold of Pharaoh, blue of structures',
        imagePath: 'assets/fab_2.jfif'),
    Product(
        name: 'Purple Neon',
        price: 110.0,
        description: 'The purple of cyberpunk',
        imagePath: 'assets/fab_3.jfif'),
    Product(
        name: 'Gold Pink-Eye',
        price: 300.0,
        description: 'Pink pieces of flesh on gold ensemble ',
        imagePath: 'assets/fab_4.jfif')
  ];

  //user cart
  List<Product> _cart = [];

  //get product list
  List<Product> get shop => _shop;

  //get user cart
  List<Product> get cart => _cart;

  //add item to cart
  void addItemToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  //remove item from cart
  void removeItemFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
