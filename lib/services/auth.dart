import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class AuthService{
  final FirebaseAuth _auth;
  AuthService(this._auth);
// Email sign up
Future <void> signUpWithEmail({
  required String email,
  required String password,
  required BuildContext context,
})async{
  try{
    await _auth.createUserWithEmailAndPassword(email: email, password: password);
  }on FirebaseAuthException catch(e){
    showSnackBar(context, e.message!);
  }
}
void showSnackBar(BuildContext c, String text){
  ScaffoldMessenger.of(c).showSnackBar(SnackBar(
    content: Text(text),
  ));
}
}
