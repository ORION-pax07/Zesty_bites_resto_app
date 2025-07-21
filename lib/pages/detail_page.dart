import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:new_food_main/pages/bottomnav.dart';

import 'package:new_food_main/service/database.dart';
import 'package:new_food_main/service/shared_pref.dart';
import 'package:new_food_main/service/widget_support.dart';
import 'package:new_food_main/service/constant.dart';

import 'package:random_string/random_string.dart';

class DetailPage extends StatefulWidget {
  String image;
  String name;
  String price;

  DetailPage({required this.image, required this.price, required this.name});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int quantity = 1, totalprice = 0;

  @override
  void initState() {
    totalprice = int.parse(widget.price);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50.0, left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Color(0xffef2b39),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Icon(Icons.arrow_back, size: 40.0, color: Colors.white),
              ),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Image.asset(
                widget.image,
                height: MediaQuery.of(context).size.height / 3,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 20.0),
            Text(widget.name, style: AppWidget.headlineTextFieldStyle()),
            Text("\₹" + widget.price, style: AppWidget.priceTextFieldStyle()),
            SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Text(
                "Crafted with care, bursting with flavor, and made to satisfy—every bite is a celebration of taste..",
                style: AppWidget.lightTextFieldStyle(),
              ),
            ),
            SizedBox(height: 30.0),
            Text("Quantity", style: AppWidget.semiBoldTextFieldStyle()),
            SizedBox(height: 10.0),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    quantity = quantity + 1;
                    totalprice = totalprice + int.parse(widget.price);
                    setState(() {});
                  },
                  child: Material(
                    elevation: 3.0,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Color(0xffef2b39),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(Icons.add, color: Colors.white, size: 30.0),
                    ),
                  ),
                ),
                SizedBox(width: 20.0),
                Text(
                  quantity.toString(),
                  style: AppWidget.headlineTextFieldStyle(),
                ),
                SizedBox(width: 20.0),
                GestureDetector(
                  onTap: () {
                    if (quantity > 1) {
                      quantity = quantity - 1;
                      totalprice = totalprice - int.parse(widget.price);
                      setState(() {});
                    }
                  },
                  child: Material(
                    elevation: 3.0,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Color(0xffef2b39),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Material(
                  elevation: 3.0,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 70,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Color(0xffef2b39),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "\₹" + totalprice.toString(),
                        style: AppWidget.boldwhiteTextFieldStyle(),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20.0),
                Material(
                  elevation: 3.0,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 70,
                    width: 180,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Ordered Successfully!",
                              style: TextStyle(fontSize: 16.0),
                            ),
                            backgroundColor: Colors.green,
                            duration: Duration(seconds: 2),
                          ),
                        );

                        // Delay a bit to let snackbar show before navigating
                        Future.delayed(Duration(milliseconds: 500), () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => BottomNav()),
                          );
                        });
                      },
                      child: Material(
                        elevation: 3.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: 70,
                          width: 180,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              "ORDER NOW",
                              style: AppWidget.whiteTextFieldStyle(),
                            ),
                          ),
                        ),
                      ),
                    )

                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
