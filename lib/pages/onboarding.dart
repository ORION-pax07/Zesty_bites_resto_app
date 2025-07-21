import 'package:flutter/material.dart';
import 'package:new_food_main/pages/login.dart';
import 'package:new_food_main/service/widget_support.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Container(
        margin: EdgeInsets.only(top: 100.0),
        child: Column(
          children: [
            Image.asset("images/screen1.png"),
            SizedBox(height: 20.0),
            Text(
              "The Fastest\nFood Delivery",
              textAlign: TextAlign.center,
              style: AppWidget.headlineTextFieldStyle(),
            ),
            SizedBox(height: 20.0),
            Text(
              "Craving solved—your favorite food,\n delivered fast and fresh!",
              textAlign: TextAlign.center,
              style: AppWidget.lightTextFieldStyle(),
            ),
            SizedBox(height: 30.0,),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LogIn()),
                );
              },
              child: Material(
                borderRadius: BorderRadius.circular(20),
                elevation: 3.0,
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(color: Color(0xff4caf50), borderRadius: BorderRadius.circular(20)
                  ),
                  child: Center(
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
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
