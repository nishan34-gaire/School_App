import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class send {
  void toastcomment(String coment) {
    Fluttertoast.showToast(
      msg: coment,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 10,
    );
  }

  void success() {
    Fluttertoast.showToast(
      msg: 'Success',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: const Color.fromARGB(255, 96, 239, 101),
      textColor: Colors.white,
      fontSize: 20,
    );
  }

  void succesed() {
    Fluttertoast.showToast(
      msg: 'we have send you recover email , please check',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: const Color.fromARGB(255, 96, 239, 101),
      textColor: Colors.white,
      fontSize: 20,
    );
  }
}
