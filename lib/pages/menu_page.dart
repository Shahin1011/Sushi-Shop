import 'package:flutter/material.dart';
import 'package:sushishop/components/button.dart';
import 'package:sushishop/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushishop/components/food_tile.dart';
import 'package:sushishop/models/food.dart';




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
        price: "20.00",
        imagePath: "assets/Images/many_shusi.png",
        rating: "4.9"
    ),

    //tuna
    Food(
        name: "Salmon Eggs",
        price: "30.00",
        imagePath: "assets/Images/slamon_eggs.png",
        rating: "4.8"
    ),

  ];

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
                )
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
                ),
              ),
          ),


        ],

      ),

    );
  }
}