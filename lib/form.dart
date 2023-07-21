import 'package:flutter/material.dart';
import 'package:nishan/forget_password.dart';
import 'package:nishan/login.dart';

void main() => runApp(const apps());

class apps extends StatelessWidget {
  const apps({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromRGBO(38, 50, 56, 1),
        body: LoginScreen(post: rul),
      ),
    );
  }
}
