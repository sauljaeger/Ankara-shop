import 'package:flutter/material.dart';
import 'package:untitled/componenets/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              //drawer logo or header
              const DrawerHeader(
                  child: Center(
                child: Icon(
                  Icons.shopping_bag_rounded,
                  size: 50,
                  color: Colors.black,
                ),
              )),

              MyListTile(
                text: "SHOP",
                icon: Icons.home_filled,
                onTap: () => Navigator.pop(context),
              ),

              MyListTile(
                  text: "CART",
                  icon: Icons.shopping_cart,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/cart_page');
                  }),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(
              text: "EXIT",
              icon: Icons.logout,
              onTap: () => Navigator.pushNamedAndRemoveUntil(//doesn't cause loop
                  context, '/intro_page', (route) => false),
            ),
          ),

          //shop tile

          //cart tile

          //exit tile
        ],
      ),
    );
  }
}
