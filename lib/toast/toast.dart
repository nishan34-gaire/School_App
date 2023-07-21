import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class utils {
  void toastmessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 10,
    );
  }

  void toastsuccessmessage() {
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
}
