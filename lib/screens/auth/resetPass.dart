import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/keyF.dart';
import 'package:flutter_application_1/screens/auth/auth.dart';

import 'emailPwd.dart';

class resetPass extends StatefulWidget {
  const resetPass({Key? key}) : super(key: key);

  @override
  State<resetPass> createState() => _resetPassState();
}

class _resetPassState extends State<resetPass> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(children: [
          Stack(
        children: <Widget>[
          Container(
            width: w,
            height: h * 0.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/loginimg.png"), fit: BoxFit.cover),
            )),
        Positioned(
            top: 55,
            left: 10,
            child:
          Container(
            child:
              Image.asset("assets/61022.png",
                height: 60,
                width: 40,)
            ,
          )
        ),
          ]),
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
                        style: TextStyle(
                            fontSize: 70, fontWeight: FontWeight.bold)),
                    Text(
                      "Sign in to your Account",
                      style: TextStyle(fontSize: 20, color: Colors.grey),
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
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.deepOrangeAccent,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.0, color: Colors.white)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    ),
                  ])),
          SizedBox(
            height: 70,
          ),
          GestureDetector(
              onTap: (){
                resetPass();
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
              "Reset Password",
              style:
              TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white)
              , )),
          )),
        ]));

  }
  Future resetPass() async{
    showDialog(context: context,
      barrierDismissible: false,
      builder: (context)=> Center(child: CircularProgressIndicator()),
    );
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      keyF.snackbar("Password Reset Email Sent");
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>  EmailPasswordSignup(),));

    }on FirebaseAuthException catch(e){
      print(e.message);
      keyF.snackbar(e.message);
      Navigator.of(context).pop();
    }
  }
}
