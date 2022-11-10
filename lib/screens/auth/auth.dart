
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../main.dart';
import 'package:flutter_application_1/keyF.dart';

class signUp extends StatefulWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordController1 = TextEditingController();
  final key= GlobalKey<FormState>();

  Future signUpUser() async {
    final tmp= key.currentState!.validate();
    if(!tmp) return;

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()),
      );
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
      } on FirebaseAuthException catch (e) {
        print(e);
        keyF.snackbar(e.message);
      }


    navigatorKey.currentState!.popUntil((route)=> route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: key,
        child:Column(
          children: [
            Container(
              width: w,
              height: h * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/signup.png"), fit: BoxFit.cover),
              ),
              child: Column(
                children: [
                  SizedBox(height: h * 0.16),
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white70,
                    backgroundImage: AssetImage("assets/profile1.png"),
                  )
                ],
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
                  SizedBox(
                    height: 80,
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
                    child: TextFormField(
                      controller: emailController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (email)=>
                      email!=null && !EmailValidator.validate(email)? 'Enter a valid email' : null,
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
                    child: TextFormField(
                      controller: passwordController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value)=>
                      value!=null && value.length<6 ? 'Enter min 6 characters' : null,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: Icon(Icons.password, color: Colors.deepOrangeAccent,),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(width: 1.0, color: Colors.white)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ),SizedBox(
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
                      controller: passwordController1,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                          hintText: "Confirm Password",
                          prefixIcon: Icon(Icons.password, color: Colors.deepOrangeAccent,),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(width: 1.0, color: Colors.white)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
        GestureDetector(
          onTap: (){
            signUpUser();
          },child:
            Container(
              width: w * 0.5,
              height: h * 0.08,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image: DecorationImage(
                    image: AssetImage("assets/loginbtn.png"), fit: BoxFit.cover),
              ),
              child: Center(
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
            )),
            SizedBox(
              height: h * 0.04,
            ),
            RichText(
                text: TextSpan(
                  text: "Signing up using the following methods",
                  style: TextStyle(fontSize: 20, color: Colors.grey[500]),
                )),
            SizedBox(
              height: h * 0.03,
              width: w * 0.15,
            ),
            Center(
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.center, //Center Column contents vertically,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/f.png"),
                      radius: 25,
                    ),
                    SizedBox(width: 10),
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/g.png"),
                      radius: 25,
                    ),
                    SizedBox(width: 10),
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/t.png"),
                      radius: 25,
                    ),
                  ],
                )),
            SizedBox(height: h*0.02),
            RichText(
              text: TextSpan(
                  text: "You have an Account ",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[500],
                  ), children: [
                TextSpan(text:  "Sign in",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ), recognizer: TapGestureRecognizer()..onTap=()=>{
                      Get.back()
                    })
              ]
              ),
            )
          ],
        ) ,
      )

    );
  }
}
