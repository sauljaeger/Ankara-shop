import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/componenets/my_drawer.dart';
import 'package:untitled/componenets/product_tile.dart';
import 'package:untitled/main.dart';
import 'package:untitled/models/shop.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;
    return Scaffold(
      appBar: AppBar(
        title: Text('Ankara Store'),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, '/cart_page'),
              icon: const Icon(Icons.shopping_cart_outlined))
        ],
      ),
      drawer: Drawer(child: MyDrawer()),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: ListView(
        children: [
          const SizedBox(
            height: 25,
          ),
          Center(
              child: Text(
            "Pick from Our Range of Selected Fabrics",
            style:
                TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
          )),
          SizedBox(
            height: 550,
            child: ListView.builder(
                itemCount: products.length,
                padding: const EdgeInsets.all(15),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  //get each individual product from shop
                  final product = products[index];

                  //return as a product tile UI
                  return MyProductTile(product: product);
                }),
          )
        ],
      ),
    );
  }
}
