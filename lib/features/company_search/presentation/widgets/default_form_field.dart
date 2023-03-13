import 'package:flutter/material.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  var onSubmit,
  var onChange,
  var onTap,
  bool isPassword=false,
  var showPasswordFunction,
  required var validate,
  required String label,
  required IconData prefix,
  bool isClickable=true,
  IconData? suffix,
})=> TextFormField(
  controller: controller,
  keyboardType: type,
  onFieldSubmitted:onSubmit,
  onChanged: onChange,
  onTap: onTap,
  validator: validate,
  obscureText: isPassword,
  enabled: isClickable,
  decoration: InputDecoration(
    labelText: label,
    prefixIcon: Icon(prefix),
    suffixIcon:IconButton(icon: Icon(suffix),
      onPressed: (showPasswordFunction),) ,
    border: OutlineInputBorder(),

  ),
);