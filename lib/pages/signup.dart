// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:new_food_main/pages/bottomnav.dart';
// import 'package:new_food_main/pages/login.dart';
// import 'package:new_food_main/service/database.dart';
// import 'package:new_food_main/service/shared_pref.dart';
// import 'package:new_food_main/service/widget_support.dart';
// import 'package:random_string/random_string.dart';
//
// class SignUp extends StatefulWidget {
//   const SignUp({super.key});
//
//   @override
//   State<SignUp> createState() => _SignUpState();
// }
//
// class _SignUpState extends State<SignUp> {
//   String email = "", password = "", name = "";
//   TextEditingController namecontroller = new TextEditingController();
//   TextEditingController passwordcontroller = new TextEditingController();
//   TextEditingController mailcontroller = new TextEditingController();
//
//   registration() async {
//     String name = namecontroller.text.trim();
//     String email = mailcontroller.text.trim();
//     String password = passwordcontroller.text;
//
//     if (name.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
//       try {
//         UserCredential userCredential = await FirebaseAuth.instance
//             .createUserWithEmailAndPassword(email: email, password: password);
//
//         String Id = randomAlphaNumeric(10);
//
//         Map<String, dynamic> userInfoMap = {
//           "Name": name,
//           "Email": email,
//           "Id": Id,
//         };
//
//         await SharedPreferenceHelper().saveUserEmail(email);
//         await SharedPreferenceHelper().saveUserName(name);
//         await DatabaseMethods().addUserDetails(userInfoMap, Id);
//
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             backgroundColor: Colors.green,
//             content: Text(
//               "Registered Successfully",
//               style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//             ),
//           ),
//         );
//
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => BottomNav()),
//         );
//       } on FirebaseAuthException catch (e) {
//         if (e.code == 'weak-password') {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               backgroundColor: Colors.orangeAccent,
//               content: Text(
//                 "Password Provided is too weak",
//                 style: TextStyle(fontSize: 18.0),
//               ),
//             ),
//           );
//         } else if (e.code == 'email-already-in-use') {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               backgroundColor: Colors.orangeAccent,
//               content: Text(
//                 "Account Already Exist",
//                 style: TextStyle(fontSize: 18.0),
//               ),
//             ),
//           );
//         } else {
//           // Show any other error
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               backgroundColor: Colors.redAccent,
//               content: Text(
//                 "Error: ${e.message}",
//                 style: TextStyle(fontSize: 18.0),
//               ),
//             ),
//           );
//         }
//       }
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           backgroundColor: Colors.red,
//           content: Text(
//             "Please fill all the fields",
//             style: TextStyle(fontSize: 18.0),
//           ),
//         ),
//       );
//     }
//   }
//
//
//
//
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
//                           "SignUP",
//                           style: AppWidget.headlineTextFieldStyle(),
//                         ),
//                       ),
//                       SizedBox(height: 30.0),
//                       Text("Name", style: AppWidget.priceTextFieldStyle()),
//                       SizedBox(height: 5.0),
//                       Container(
//                         decoration: BoxDecoration(
//                           color: Color(0xFFececf8),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: TextField(
//                           controller: namecontroller,
//                           decoration: InputDecoration(
//                             border: InputBorder.none,
//                             hintText: "Enter Name",
//                             prefixIcon: Icon(Icons.person_outline),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 20.0),
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
//                       GestureDetector(
//                         onTap: () {
//                           registration();
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
//                                 "Sign Up",
//                                 style: AppWidget.boldwhiteTextFieldStyle(),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//
//                       SizedBox(height: 15.0),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             "Already have an Account ?",
//                             style: AppWidget.lightTextFieldStyle(),
//                           ),
//                           SizedBox(width: 10.0),
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => LogIn(),
//                                 ),
//                               );
//                             },
//                             child: Text(
//                               "LogIn",
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
import 'package:flutter/material.dart';
import 'package:new_food_main/pages/bottomnav.dart';
import 'package:new_food_main/pages/login.dart';
import 'package:new_food_main/service/database.dart';
import 'package:new_food_main/service/shared_pref.dart';
import 'package:new_food_main/service/widget_support.dart';
import 'package:random_string/random_string.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  registration() async {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text;

    if (name.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        String id = randomAlphaNumeric(10);

        Map<String, dynamic> userInfoMap = {
          "Name": name,
          "Email": email,
          "Id": id,
        };

        await SharedPreferenceHelper().saveUserEmail(email);
        await SharedPreferenceHelper().saveUserName(name);
        await DatabaseMethods().addUserDetails(userInfoMap, id);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              "Registered Successfully",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const BottomNav()),
        );
      } on FirebaseAuthException catch (e) {
        String message;
        if (e.code == 'weak-password') {
          message = "Password provided is too weak.";
        } else if (e.code == 'email-already-in-use') {
          message = "An account already exists for that email.";
        } else {
          message = "Error: ${e.message}";
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              message,
              style: const TextStyle(fontSize: 18.0),
            ),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            "Please fill all the fields.",
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2.4,
            padding: const EdgeInsets.only(top: 20.0),
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Color(0xFFE5DCC5),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Column(
              children: [
                Image.asset("images/screen1.png",
                    height: 150, fit: BoxFit.contain, width: 200),
                Image.asset("images/logo2.png",
                    width: 150, height: 100, fit: BoxFit.cover),
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
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                height: MediaQuery.of(context).size.height / 1.6,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20.0),
                      Center(
                        child: Text("SignUP",
                            style: AppWidget.headlineTextFieldStyle()),
                      ),
                      const SizedBox(height: 30.0),
                      Text("Name", style: AppWidget.priceTextFieldStyle()),
                      const SizedBox(height: 5.0),
                      _buildTextField(
                          controller: nameController,
                          hintText: "Enter Name",
                          icon: Icons.person_outline),
                      const SizedBox(height: 20.0),
                      Text("Email", style: AppWidget.priceTextFieldStyle()),
                      const SizedBox(height: 5.0),
                      _buildTextField(
                          controller: emailController,
                          hintText: "Enter Email",
                          icon: Icons.mail_outline),
                      const SizedBox(height: 20.0),
                      Text("Password", style: AppWidget.priceTextFieldStyle()),
                      const SizedBox(height: 5.0),
                      _buildTextField(
                        controller: passwordController,
                        hintText: "Enter Password",
                        icon: Icons.password_outlined,
                        isPassword: true,
                      ),
                      const SizedBox(height: 30.0),
                      GestureDetector(
                        onTap: registration,
                        child: Center(
                          child: Container(
                            width: 200,
                            height: 60,
                            decoration: BoxDecoration(
                              color: const Color(0xffef2b39),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Text("Sign Up",
                                  style: AppWidget.boldwhiteTextFieldStyle()),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an Account ?",
                              style: AppWidget.lightTextFieldStyle()),
                          const SizedBox(width: 10.0),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LogIn()),
                              );
                            },
                            child: Text("LogIn",
                                style: AppWidget.boldTextFeildStyle()),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool isPassword = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFececf8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }
}

