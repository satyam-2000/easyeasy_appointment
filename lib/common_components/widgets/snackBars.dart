import 'package:flutter/material.dart';

abstract class SnackBars{
  static void success({required String message,required BuildContext context}){
    final snackbar = SnackBar(
      content: Text(message,style: TextStyle(color: Colors.white),),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.green,// How long the Snackbar is displayed
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  static void error({required String error,required BuildContext context}){
    final snackbar = SnackBar(
      content: Text(error,style: TextStyle(color: Colors.white),),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.red,// How long the Snackbar is displayed
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}