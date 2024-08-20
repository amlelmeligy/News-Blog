import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget drawerComponent({
  required IconData icon,
  required String name,
  required VoidCallback onTap,
}) =>
    ListTile(
        leading: Icon(
          icon,
          size: 30,
          color: Color.fromARGB(255, 32, 65, 91),
        ),
        title: Text(
          name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        onTap: onTap);
