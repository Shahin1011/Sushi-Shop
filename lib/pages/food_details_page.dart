import 'package:flutter/material.dart';
import 'package:sushishop/models/food.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushishop/theme/colors.dart';
import 'package:sushishop/components/button.dart';


class FoodDetailsPage extends StatefulWidget {
  final Food food;
  const FoodDetailsPage({super.key, required this.food});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {

  // quantity
  int quantityCount = 0;

  // decrement quantity
  void decrementQuantity(){
    setState(() {
      if(quantityCount > 0){
        quantityCount--;
      }
    });
  }

  // increment quantity
  void incrementQuantity(){
    setState(() {
      quantityCount++;
    });
  }

  // add to cart
  void addToCart(){

  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],

      ),
      body: Column(
        children: [
          //listview of food details
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView(
                children: [
                  //image
                  Image.asset(
                    widget.food.imagePath,
                    height: 150,
                  ),
                  SizedBox(height: 25),

                  //rating
                  Row(
                    children: [
                      //star icon
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),

                      SizedBox(width: 5,),

                      //rating number
                      Text(
                        widget.food.rating,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  
                  //food name
                  Text(
                    widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                  ),

                  SizedBox(height: 25,),

                  //description
                  Text(
                    "Description",
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),

                  SizedBox(height: 10,),
                
                  Text(
                    "Sushi originated as a way of preserving fish in fermented rice over a thousand years ago in Southeast Asia. The modern version — using vinegar to season the rice and serving it fresh  developed in Japan during the Edo period. Sushi chefs in Japan train for years, especially to master knife skills and rice preparation.In traditional sushi etiquette, you can eat nigiri with your hands!",
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 15,
                      height: 2
                    ),
                  ),
                ],
              ),
            ),
          ),

          //price + quantity + add to cart button
          Container(
            color: primaryColor,
            padding: EdgeInsets.all(25),
            child: Column(
              children: [
                // price + quantity
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //price
                    Text(
                      "\$" + widget.food.price,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    //quantity
                    Row(
                      children: [
                        // minus button
                        Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: decrementQuantity,
                            icon: Icon(Icons.remove),
                            color: Colors.white,
                          ),
                        ),

                        //quantity count
                        SizedBox(
                          width: 30,
                          child: Center(
                            child: Text(
                              quantityCount.toString(),
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),


                        //add button
                        Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: incrementQuantity,
                            icon: Icon(Icons.add),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 20,),

                //add to cart button
                MyButton(text: "Add To Cart", onTap: addToCart),

              ],
            ),
          ),

        ],
      ),
    );
  }
}