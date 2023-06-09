import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToastMessage(String title) {
  return Fluttertoast.showToast(
      backgroundColor: Colors.white.withOpacity(0.6),
      msg: "$title",
      timeInSecForIosWeb: 1,
      gravity: ToastGravity.SNACKBAR,
      textColor: Colors.black,
      fontSize: 16.0);
}