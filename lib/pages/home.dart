
import 'package:flutter/material.dart';
import 'package:new_food_main/model/category_model.dart';
import 'package:new_food_main/model/maincourse_model.dart';
import 'package:new_food_main/model/starter_model.dart';
import 'package:new_food_main/pages/detail_page.dart';
import 'package:new_food_main/service/category_data.dart';
import 'package:new_food_main/service/maincourse_data.dart';
import 'package:new_food_main/service/starter_data.dart';
import 'package:new_food_main/service/bread_data.dart';
import 'package:new_food_main/model/bread_model.dart';
import 'package:new_food_main/service/widget_support.dart';
import 'package:new_food_main/service/dessert_data.dart';
import 'package:new_food_main/model/dessert_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<StarterModel> starter = [];
  List<MaincourseModel> maincourse = [];
  List<BreadModel> bread = [];
  List<DessertModel> dessert = [];
  String track = "0";
  TextEditingController searchController = TextEditingController();
  String searchQuery = "";


  @override
  void initState() {
    categories = getCategories();
    starter = getStarter();
    maincourse = getMaincourse();
    bread = getBread();
    dessert = getDessert();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 10.0, top: 20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "images/logo2.png",
                      height: 100,
                      width: 100,
                      fit: BoxFit.contain,
                    ),
                    Text(
                      "Order Your Favourite FOOD!",
                      style: AppWidget.semiBoldTextFieldStyle(),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "images/person.png",
                      height: 60.0,
                      width: 60.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 10.0),
                    margin: EdgeInsets.only(right: 20.0),
                    decoration: BoxDecoration(
                      color: Color(0xFFececf8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: searchController,
                      onChanged: (value) {
                        setState(() {
                          searchQuery = value;
                        });
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search...",
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10.0),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Color(0xffef2b39),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.search, color: Colors.white, size: 35.0),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Container(
              height: 70,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return categoryTile(
                    categories[index].name!,
                    categories[index].image!,
                    index.toString(),
                  );
                },
              ),
            ),
           SizedBox(height: 10.0,),
          track=="0"? Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 10.0),
              child: Builder(
                builder: (context) {
                  var filteredStarter = starter
                      .where((item) => item.name!
                      .toLowerCase()
                      .contains(searchQuery.toLowerCase()))
                      .toList();

                  return GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.6,
                      mainAxisSpacing: 20.0,
                      crossAxisSpacing: 10.0,
                    ),
                    itemCount: filteredStarter.length,
                    itemBuilder: (context, index) {
                      return FoodTile(
                        filteredStarter[index].name!,
                        filteredStarter[index].image!,
                        filteredStarter[index].price!,
                      );
                    },
                  );
                },
              ),
            ),
          ): track=="1"? Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 10.0),
              child: Builder(
                builder: (context) {
                  var filteredMaincourse = maincourse
                      .where((item) => item.name!
                      .toLowerCase()
                      .contains(searchQuery.toLowerCase()))
                      .toList();

                  return GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.55,
                      mainAxisSpacing: 20.0,
                      crossAxisSpacing: 10.0,
                    ),
                    itemCount: filteredMaincourse.length,
                    itemBuilder: (context, index) {
                      return FoodTile(
                        filteredMaincourse[index].name!,
                        filteredMaincourse[index].image!,
                        filteredMaincourse[index].price!,
                      );
                    },
                  );
                },
              ),
            ),
          ):track=="2"? Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 10.0),
              child: Builder(
                builder: (context) {
                  var filteredBread = bread
                      .where((item) => item.name!
                      .toLowerCase()
                      .contains(searchQuery.toLowerCase()))
                      .toList();

                  return GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.6,
                      mainAxisSpacing: 20.0,
                      crossAxisSpacing: 10.0,
                    ),
                    itemCount: filteredBread.length,
                    itemBuilder: (context, index) {
                      return FoodTile(
                        filteredBread[index].name!,
                        filteredBread[index].image!,
                        filteredBread[index].price!,
                      );
                    },
                  );
                },
              ),
            ),
          ):track=="3"? Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 10.0),
              child: Builder(
                builder: (context) {
                  var filteredDessert = dessert
                      .where((item) => item.name!
                      .toLowerCase()
                      .contains(searchQuery.toLowerCase()))
                      .toList();

                  return GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.55,
                      mainAxisSpacing: 20.0,
                      crossAxisSpacing: 10.0,
                    ),
                    itemCount: filteredDessert.length,
                    itemBuilder: (context, index) {
                      return FoodTile(
                        filteredDessert[index].name!,
                        filteredDessert[index].image!,
                        filteredDessert[index].price!,
                      );
                    },
                  );
                },
              ),
            ),
          ):Container(),
          ],
        ),
      ),
    );
  }

  Widget FoodTile(String name, String image, String price) {
    return Container(
      margin: EdgeInsets.only(right: 8.0),
      padding: EdgeInsets.only(left: 10.0, top: 10.0),
      decoration: BoxDecoration(border: Border.all(color: Colors.black54), borderRadius: BorderRadius.circular(20),),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              image,
              height: 150,
              width: 150,
              fit: BoxFit.contain,
            ),
          ),
          Text(name, style: AppWidget.boldTextFeildStyle(),),
          Text("₹" + price, style: AppWidget.priceTextFieldStyle()),

        Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage(image: image, price: price, name: name),),);
                },
                child: Container(
                  height: 40,
                  width: 80,
                  decoration: BoxDecoration(color: Color(0xffef2b39),borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), bottomRight: Radius.circular(20),),),
                  child: Icon(Icons.arrow_forward, color: Colors.white,size: 30.0,),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget categoryTile(String name, String image, String categoryindex) {
    return GestureDetector(
      onTap: () {
        track = categoryindex.toString();
        setState(() {});
      },
      child:
          track == categoryindex
              ? Container(
                margin: EdgeInsets.only(right: 20.0, bottom: 5.0),
                child: Material(
                  elevation: 3.0,
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),

                    decoration: BoxDecoration(
                      color: Color(0xffef2b39),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          image,
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 10.0),
                        Text(name, style: AppWidget.whiteTextFieldStyle()),
                      ],
                    ),
                  ),
                ),
              )
              : Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                margin: EdgeInsets.only(right: 20.0, bottom: 5.0),
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      image,
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 10.0),
                    Text(name, style: AppWidget.semiBoldTextFieldStyle()),
                  ],
                ),
              ),
    );
  }
}
