import 'package:flutter/material.dart';

Widget defaultButton({
  double width=double.infinity,
  Color background=Colors.blue,
  bool isUpperCase=true,

  required VoidCallback  function,
  required String text,
})=>Container(
  padding: EdgeInsets.all(10),
  width: width,
  color: background,
  child: MaterialButton(
    onPressed: function,
    child: Text(isUpperCase ? text.toUpperCase():text,
      style: TextStyle(color: Colors.white),
    ),
  ),

);