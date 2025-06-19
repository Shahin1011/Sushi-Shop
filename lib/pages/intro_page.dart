import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushishop/components/button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 138, 60, 55),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 25,),

            //Shop name
            Text(
              "SUSHI MAN",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 28,
                color: Colors.white
              ),
            ),

            SizedBox(height: 25,),

            //icon
            Padding(
              padding: EdgeInsets.all(50),
              child: Image.asset('assets/Images/slamon_eggs.png'),
            ),

            SizedBox(height: 25,),

            //title
            Text(
              "THE TASTE OF JAPANESE FOOD",
              style: GoogleFonts.dmSerifDisplay(
                  fontSize: 44,
                  color: Colors.white
              ),
            ),

            SizedBox(height: 10,),

            //subtitle
            Text(
              "Feel the taste of the most popular Japanese food from anywhere and anytime",
              style: TextStyle(
                color: Colors.grey[300],
                height: 2
              ),
            ),

            SizedBox(height: 25,),

            //get started button
            MyButton(text: "Get Started")
          ],
        ),
      )
    );
  }
}