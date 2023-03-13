import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class LoginDisplay extends StatelessWidget {
  final  res;


  const LoginDisplay({
    Key? key,
    required this.res,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: Column(
        children: <Widget>[
          Text(
            res.toString(),
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          ),
          // Expanded(
          //   child: Center(
          //     child: SingleChildScrollView(
          //       child: Text(
          //         numberTrivia.text,
          //         style: TextStyle(fontSize: 25),
          //         textAlign: TextAlign.center,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}