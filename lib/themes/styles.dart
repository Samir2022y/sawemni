import 'package:flutter/material.dart';

const addProductStyle = TextStyle(
  fontSize: 18, 
  fontWeight: FontWeight.bold,
  color: Colors.black,
  decoration: TextDecoration.none
  
);

ButtonStyle butttonDecoration =  ButtonStyle(
  foregroundColor:MaterialStateProperty.all<Color>(Colors.white),
  backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
  elevation:  MaterialStateProperty.all<double>(3),
  shadowColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 104, 103, 103)),

);
InputDecoration myInputDecoration(String hintText, IconData icon) {
  return InputDecoration(
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.orange, width: 3.0),
    ),
    hintText: hintText,  // Use the passed hintText
    prefixIcon: Icon(
      icon,
      color: Colors.black,
    ),
    contentPadding: EdgeInsets.all(10.0),
  );
}
