import 'package:flutter/material.dart';

class onlineclass extends StatefulWidget {
  const onlineclass({super.key});

  @override
  State<onlineclass> createState() => _onlineclassState();
}

class _onlineclassState extends State<onlineclass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Online Class Here',
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
    );
  }
}
