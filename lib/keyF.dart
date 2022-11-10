import 'package:flutter/material.dart';

class keyF{
  static final messenger= GlobalKey<ScaffoldMessengerState>();

  // snackbar
  static snackbar(String? text){
    if(text ==null) return;
    final snackBar= SnackBar(content: Text(text), backgroundColor: Colors.deepOrange);
    messenger.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}