import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  //custom method
  final String text;
  final IconData icon;
  void Function()? onTap;
  MyListTile({super.key, required this.text, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:25.0),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.black,
        ),
        title: Text(text),
        onTap: onTap,
      ),
    );
  }
}
