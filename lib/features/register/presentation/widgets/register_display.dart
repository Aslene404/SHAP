

import 'package:flutter/material.dart';

class RegisterDisplay extends StatelessWidget {
  final Map<String,dynamic>? res;


  const RegisterDisplay({
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
            res!["token"]!=null?res!["token"]:res!["message"],
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