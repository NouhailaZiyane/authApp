
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/auth/auth.dart';

import '../../services/auth.dart';

class EmailPasswordSignup extends StatefulWidget {
  static String routeName = '/signup-email-password';
  const EmailPasswordSignup({Key? key}) : super(key: key);

  @override
  _EmailPasswordSignupState createState() => _EmailPasswordSignupState();
}

class _EmailPasswordSignupState extends State<EmailPasswordSignup> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future signUpUser() async {
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch(e){
      print(e);
    }

  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: w,
            height: h * 0.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/loginimg.png"), fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: w,
            margin: const EdgeInsets.only(right: 20, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hello",
                    style:
                        TextStyle(fontSize: 70, fontWeight: FontWeight.bold)),
                Text(
                  "Sign in to your Account",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 7,
                            offset: Offset(1, 1),
                            color: Colors.grey.withOpacity(0.2))
                      ]),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        hintText: "Email",
                        prefixIcon: Icon(Icons.email, color: Colors.deepOrangeAccent,),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1.0, color: Colors.white)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 7,
                            offset: Offset(1, 1),
                            color: Colors.grey.withOpacity(0.2))
                      ]),
                  child: TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: Icon(Icons.password, color: Colors.deepOrangeAccent,),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1.0, color: Colors.white)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(child: Container()),
                    Text(
                      "Forgot your password?",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 70,
          ),
      GestureDetector(
        onTap: (){
          signUpUser();
        },child:
          Container(
            width: w*0.5,
            height: h * 0.08,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(
                  image: AssetImage("assets/loginbtn.png"), fit: BoxFit.cover),
               // recognizer: TapGestureRecognizer()..onTap=()=>
            ),
            child:
                Center( child:
            Text(
                "Sign in",
                style:
                TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white)
            , )),
          )),
          SizedBox(
            height: h*0.1,
          ),
            RichText( text: TextSpan(
              text: "You don't have an Account? ",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[500]
              ),children: [
                TextSpan(
                text: "Create",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  fontWeight: FontWeight.bold
                ), recognizer: TapGestureRecognizer()..onTap=()=>{
                  Get.to(()=>signUp())
                }
                ),
            ]
            )
            ),
        ],
      ),
    );
  }
}
