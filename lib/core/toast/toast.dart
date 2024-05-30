import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toast {
  static errorMessage({required String message}) => Fluttertoast.showToast(
      msg: message, backgroundColor: Colors.red, textColor: Colors.white);

  static successMessage({required String message}) => Fluttertoast.showToast(
      msg: message, backgroundColor: Colors.black, textColor: Colors.white);
}
