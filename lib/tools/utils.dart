import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast(String msg, {Color backgroundColor}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor != null ? backgroundColor : Colors.green,
      textColor: Colors.white,
      fontSize: 16.0);
}

bool emailValidator(value) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value);
}

bool passValidator(value) {
  return RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$').hasMatch(value);
}


