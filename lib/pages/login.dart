// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:new_food_main/pages/bottomnav.dart';
// import 'package:new_food_main/pages/signup.dart';
// import 'package:new_food_main/service/widget_support.dart';
//
// class LogIn extends StatefulWidget {
//   const LogIn({super.key});
//
//   @override
//   State<LogIn> createState() => _LogInState();
// }
//
// class _LogInState extends State<LogIn> {
//   String email = "", password = "", name = "";
//   TextEditingController namecontroller = new TextEditingController();
//   TextEditingController passwordcontroller = new TextEditingController();
//   TextEditingController mailcontroller = new TextEditingController();
//
//   userLogin() async {
//     try {
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: email!,
//         password: password!,
//       );
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => BottomNav()),
//       );
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(
//               "No use Found for that Email",
//               style: TextStyle(fontSize: 18.0, color: Colors.black),
//             ),
//           ),
//         );
//       } else if (e.code == 'wrong-password') {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(
//               "Wrong Password provided by the user",
//               style: TextStyle(fontSize: 18.0, color: Colors.black),
//             ),
//           ),
//         );
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Stack(
//           children: [
//             Container(
//               height: MediaQuery.of(context).size.height / 2.4,
//               padding: EdgeInsets.only(top: 20.0),
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                 color: Color(0xFFE5DCC5),
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(40),
//                   bottomRight: Radius.circular(40),
//                 ),
//               ),
//               child: Column(
//                 children: [
//                   Image.asset(
//                     "images/screen1.png",
//                     height: 150,
//                     fit: BoxFit.contain,
//                     width: 200,
//                   ),
//                   Image.asset(
//                     "images/logo2.png",
//                     width: 150,
//                     height: 100,
//                     fit: BoxFit.cover,
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.only(
//                 top: MediaQuery.of(context).size.height / 2.9,
//                 left: 20.0,
//                 right: 20.0,
//               ),
//               child: Material(
//                 elevation: 5.0,
//                 borderRadius: BorderRadius.circular(20),
//                 child: Container(
//                   padding: EdgeInsets.only(left: 20.0, right: 20.0),
//                   width: MediaQuery.of(context).size.width,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   height: MediaQuery.of(context).size.height / 1.6,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(height: 20.0),
//                       Center(
//                         child: Text(
//                           "LogIn",
//                           style: AppWidget.headlineTextFieldStyle(),
//                         ),
//                       ),
//                       SizedBox(height: 30.0),
//                       Text("Email", style: AppWidget.priceTextFieldStyle()),
//                       SizedBox(height: 5.0),
//                       Container(
//                         decoration: BoxDecoration(
//                           color: Color(0xFFececf8),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: TextField(
//                           controller: mailcontroller,
//                           decoration: InputDecoration(
//                             border: InputBorder.none,
//                             hintText: "Enter Email",
//                             prefixIcon: Icon(Icons.mail_outline),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 20.0),
//                       Text("Password", style: AppWidget.priceTextFieldStyle()),
//                       SizedBox(height: 5.0),
//                       Container(
//                         decoration: BoxDecoration(
//                           color: Color(0xFFececf8),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: TextField(
//                           controller: passwordcontroller,
//                           decoration: InputDecoration(
//                             border: InputBorder.none,
//                             hintText: "Enter Password",
//                             prefixIcon: Icon(Icons.password_outlined),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 20.0),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Text(
//                             "Forgot Password ?",
//                             style: AppWidget.priceTextFieldStyle(),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 30.0),
//                       GestureDetector(
//                         onTap: () {
//                           if (mailcontroller.text != "" &&
//                               passwordcontroller.text != "") {
//                             setState(() {
//                               email = mailcontroller.text;
//                               password = passwordcontroller.text;
//                             });
//                             userLogin();
//                           }
//                         },
//                         child: Center(
//                           child: Container(
//                             width: 200,
//                             height: 60,
//                             decoration: BoxDecoration(
//                               color: Color(0xffef2b39),
//                               borderRadius: BorderRadius.circular(30),
//                             ),
//                             child: Center(
//                               child: Text(
//                                 "Log In",
//                                 style: AppWidget.boldwhiteTextFieldStyle(),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 25.0),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             "Don't have an Account ?",
//                             style: AppWidget.lightTextFieldStyle(),
//                           ),
//                           SizedBox(width: 10.0),
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => SignUp(),
//                                 ),
//                               );
//                             },
//                             child: Text(
//                               "SignUp",
//                               style: AppWidget.boldTextFeildStyle(),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_food_main/pages/bottomnav.dart';
import 'package:new_food_main/pages/signup.dart';
import 'package:new_food_main/service/widget_support.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  String email = "", password = "", name = "";
  TextEditingController namecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController mailcontroller = TextEditingController();

  userLogin() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BottomNav()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "No user Found for that Email",
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Wrong Password provided by the user",
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // ensures body resizes when keyboard shows
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2.4,
              padding: EdgeInsets.only(top: 20.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xFFE5DCC5),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  Image.asset(
                    "images/screen1.png",
                    height: 150,
                    fit: BoxFit.contain,
                    width: 200,
                  ),
                  Image.asset(
                    "images/logo2.png",
                    width: 150,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 2.9,
                left: 20.0,
                right: 20.0,
              ),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  // 👇 Use SingleChildScrollView here
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.0),
                        Center(
                          child: Text(
                            "LogIn",
                            style: AppWidget.headlineTextFieldStyle(),
                          ),
                        ),
                        SizedBox(height: 30.0),
                        Text("Email", style: AppWidget.priceTextFieldStyle()),
                        SizedBox(height: 5.0),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFececf8),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            controller: mailcontroller,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter Email",
                              prefixIcon: Icon(Icons.mail_outline),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Text("Password", style: AppWidget.priceTextFieldStyle()),
                        SizedBox(height: 5.0),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFececf8),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            controller: passwordcontroller,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter Password",
                              prefixIcon: Icon(Icons.password_outlined),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Forgot Password ?",
                              style: AppWidget.priceTextFieldStyle(),
                            ),
                          ],
                        ),
                        SizedBox(height: 30.0),
                        GestureDetector(
                          onTap: () {
                            if (mailcontroller.text != "" &&
                                passwordcontroller.text != "") {
                              setState(() {
                                email = mailcontroller.text;
                                password = passwordcontroller.text;
                              });
                              userLogin();
                            }
                          },
                          child: Center(
                            child: Container(
                              width: 200,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Color(0xffef2b39),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Text(
                                  "Log In",
                                  style: AppWidget.boldwhiteTextFieldStyle(),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 25.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an Account ?",
                              style: AppWidget.lightTextFieldStyle(),
                            ),
                            SizedBox(width: 10.0),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUp(),
                                  ),
                                );
                              },
                              child: Text(
                                "SignUp",
                                style: AppWidget.boldTextFeildStyle(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

