import 'package:flutter/material.dart';

void showSnackBarMessage(
    {required String msg, required BuildContext context}) async {
  var snackBar = SnackBar(content: Text(msg, style: const TextStyle(color: Colors.white),));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
