import 'package:flutter/material.dart';
import 'package:sushishop/components/button.dart';
import 'package:sushishop/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushishop/components/food_tile.dart';
import 'package:sushishop/models/food.dart';
import 'package:sushishop/pages/food_details_page.dart';




class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  //food menu
  List foodMenu = [
    //salmon sushi
    Food(
        name: "Salmon Sushi",
        price: "20.00",
        imagePath: "assets/Images/salmon_shusi.png",
        rating: "4.9"
    ),

    //tuna
    Food(
        name: "Tuna",
        price: "30.00",
        imagePath: "assets/Images/tuna.png",
        rating: "4.8"
    ),

    Food(
        name: "Many Sushi",
        price: "40.00",
        imagePath: "assets/Images/many_shusi.png",
        rating: "4.5"
    ),

    //tuna
    Food(
        name: "Salmon Eggs",
        price: "50.00",
        imagePath: "assets/Images/slamon_eggs.png",
        rating: "4.3"
    ),

  ];

  //navigate to food item details page
  void navigateToFoodDetails(int index){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailsPage(
          food: foodMenu[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.grey[900],
        ),
        title: Text(
          'Tokyo',
          style: TextStyle(color: Colors.grey[900]),
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //promo banner
          Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.symmetric(horizontal: 25),
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Promo message
                    Text(
                      'Get 32% Promo',
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 20,
                        color: Colors.white
                      ),
                    ),

                    SizedBox(height: 20,),
                    //redeem button
                    MyButton(
                        text: "Redeem",
                        onTap: (){},
                    ),
                  ],
                ),
                //image
                Image.asset(
                  'assets/Images/many_shusi.png',
                  height: 100,
                ),
              ],
            ),
          ),

          SizedBox(height: 25,),

          //search bar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child:  TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: "Search here..",
              ),
            ),
          ),

          SizedBox(height: 25,),

          //menu list
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "Food Menu",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                  fontSize: 18,
              ),
            ),
          ),

          SizedBox(height: 10,),

          Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: foodMenu.length,
                itemBuilder: (context, index) => FoodTile(
                  food: foodMenu[index],
                  onTap: () => navigateToFoodDetails(index),
                ),
              ),
          ),

          SizedBox(height: 25,),

          //popular food
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    //image
                    Image.asset(
                      'assets/Images/slamon_eggs.png',
                      height: 100,
                    ),

                    SizedBox(width: 20,),

                    //name & price
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //name
                        Text(
                          "Salmon Eggs",
                          style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                        ),

                        //price
                        Text(
                          '\$50.00',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),

                //heart
                Icon(
                  Icons.favorite_outline,
                  color: Colors.grey,
                  size: 28,
                )
              ],
            ),
          ),
        ],
      ),

    );
  }
}