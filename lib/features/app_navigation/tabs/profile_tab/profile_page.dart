import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: const Text(
          "NOTIFICATIONS",
          style: TextStyle(fontSize: 30),
        ),
        color: Colors.red,
      ),
    );
  }
}
