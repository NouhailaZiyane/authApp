import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/auth/auth.dart';
import 'package:flutter_application_1/screens/auth/emailPwd.dart';
import 'package:flutter_application_1/screens/home/home.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EmailPasswordSignup()
    );
  }
}

