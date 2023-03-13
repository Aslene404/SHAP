import 'package:flutter/material.dart';

class DocumentPage extends StatefulWidget {
  DocumentPage({Key? key}) : super(key: key);

  @override
  State<DocumentPage> createState() => _DocumentPageState();
}

class _DocumentPageState extends State<DocumentPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: const Text(
          "Document",
          style: TextStyle(fontSize: 30),
        ),
        color: Colors.red,
      ),
    );
  }
}
