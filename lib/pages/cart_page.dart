import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/componenets/my_button.dart';
import 'package:untitled/componenets/product_tile.dart';
import 'package:untitled/models/shop.dart';

import '../models/product.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: const Text("Remove this Item to your Cart?"),
              actions: [
                //cancel button
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),

                //yes button
                MaterialButton(
                  onPressed: () {
                    //pop dialog box
                    Navigator.pop(context);

                    //add to cart

                    context.read<Shop>().removeItemFromCart(product);
                  },
                  child: const Text('Yes'),
                ),
              ],
            ));
  }

  //user pressed pay button
  void payButtonPressed(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              content: Text(
                  "User wants to pay! Connect this app to your Payment Backend"),
            ));
  }

  @override
  Widget build(BuildContext context) {
    //gain access to cart
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Cart'),
      ),

      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          //cart list
          Expanded(
              child: cart.isEmpty
                  ? Center(
                      child: Text(
                      'Your Cart is empty..',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ))
                  : ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        //get individual item in cart
                        final item = cart[index];

                        //return as a cart tile UI
                        return ListTile(
                          //leading: Image.asset(product.image),
                          title: Text(item.name),
                          subtitle: Text(item.price.toStringAsFixed(2)),
                          trailing: IconButton(
                              onPressed: () =>
                                  removeItemFromCart(context, item),
                              icon: Icon(Icons.remove)),
                        );
                      })),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(
                onTap: () => payButtonPressed(context), child: Text("PAY NOW")),
          )
        ],
      ),
    );
  }
}
