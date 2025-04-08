import 'package:flutter/material.dart';
import 'package:untitled/componenets/my_button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).colorScheme.surface, //takes data from theme
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.shopping_bag_rounded,
              size: 50,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(
              height: 20,
            ),

            //title
            Text(
              'Material Shop',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            //subtitle
            Text(
              'Catering to your needs ',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),

            //button to enter
            MyButton(
                onTap: () => Navigator.pushNamed(context, '/shop_page'),
                child: Icon(Icons.forward))
          ],
        ),
      ),
    );
  }
}
