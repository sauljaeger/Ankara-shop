import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/main.dart';
import 'package:untitled/models/product.dart';
import 'package:untitled/models/shop.dart';

class MyProductTile extends StatelessWidget {
  final Product product;
  const MyProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    void addItemToCart(BuildContext context) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: const Text("Add this Item to your Cart?"),
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

                      context.read<Shop>().addItemToCart(product);
                    },
                    child: const Text('Yes'),
                  ),
                ],
              ));
    }

    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.all(10),
      padding: EdgeInsets.all(25),
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //product image
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1, // square
                child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(12)),
                    padding: EdgeInsets.all(25),
                    width: double.infinity,
                    child: Image.asset(product.imagePath)
                ),
              ),
              const SizedBox(
                height: 25,
              ),

              //product name
              Text(
                product.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 25,
              ),

              //description
              Text(
                product.description,
                style: TextStyle(
                    fontSize: 15,
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),

          // price and + to cart
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$' + product.price.toStringAsFixed(2),
                style: TextStyle(fontSize: 15),
              ),
              Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(12)),
                  child: IconButton(
                      onPressed: () => addItemToCart(context),
                      icon: Icon(Icons.add)))
            ],
          )
        ],
      ),
    );
  }
}
