import 'package:flutter/material.dart';

class RadarPage extends StatefulWidget {
  RadarPage({Key? key}) : super(key: key);

  @override
  State<RadarPage> createState() => _RadarPageState();
}

class _RadarPageState extends State<RadarPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: const Text(
        "Radar",
        style: TextStyle(fontSize: 30),
      ),
      color: Colors.red,
    ));
  }
}
