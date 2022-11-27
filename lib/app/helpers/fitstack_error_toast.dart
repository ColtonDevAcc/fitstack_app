import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FitStackErrorToast {
  Future<void> show(String message) async {
    await Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
