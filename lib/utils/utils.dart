import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class Utils {
  static showSnackBarError(String error) {
    // retrn
  }

  static showFlushBarErrorMessage(String message, BuildContext context) {
    Flushbar(
      icon: Icon(
        Icons.error,
        color: Colors.white,
      ),
      message: message,
      flushbarPosition: FlushbarPosition.TOP,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 25, horizontal: 50),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 3),
      borderRadius: BorderRadius.circular(15),
      maxWidth: MediaQuery.of(context).size.width * 0.5,
    ).show(context);
  }

  static void flushBarSuccessMessage(String message, BuildContext context) {
    Flushbar(
      icon: Icon(
        Icons.celebration,
        color: Colors.white,
      ),
      message: message,
      flushbarPosition: FlushbarPosition.TOP,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 25, horizontal: 50),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 3),
      borderRadius: BorderRadius.circular(15),
      maxWidth: MediaQuery.of(context).size.width * 0.4,
    ).show(context);
  }

  static void changeFocus(
      BuildContext context, FocusNode currentNode, FocusNode nextNode) {
    currentNode.unfocus();
    FocusScope.of(context).requestFocus(nextNode);
  }
}
