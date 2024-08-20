import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

Widget defaultTextField({
  required String labelText,
  required String hintText,
  required TextInputType type,
  String? Function(String?)? onchange,
  bool obscureText = false,
  bool isPassword = false,
  suffixpressed, //العين
  IconData? suffix,
}) =>
    TextFormField(
      obscureText: isPassword,
      onChanged: onchange,
      cursorColor: Colors.white,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter some text';
        } else {
          return null;
        }
      },
      keyboardType: type,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          //العين
          icon: Icon(
            suffix,
            color: Colors.white,
          ),
          onPressed: suffixpressed, //العين
        ),
        hoverColor: Colors.white,
        focusColor: Colors.white,
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 1, color: Colors.white),
        ),
      ),
    );

///////////////////////////////
Widget defaultButton(
        {required double width,
        required Color background,
        double raduis = 10,
        required onpressed,
        required String text,
        required Color textcolor}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(raduis),
        color: background,
      ),
      width: width,
      child: MaterialButton(
        onPressed: onpressed,
        child: Text(
          text,
          style: TextStyle(
            color: textcolor,
            fontSize: 18,
          ),
        ),
      ),
    );
