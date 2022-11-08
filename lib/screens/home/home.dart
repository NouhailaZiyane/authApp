import 'package:flutter/material.dart';
class home extends StatelessWidget {
  const home ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
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
            height: 100,
          ),
          Text("Weclome",
          style:
          TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black54,
            fontSize: 36
          )),
          SizedBox(height: 20,),
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
                  "Sign out",
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
          ),
        ],
      ),
    );

  }
}
