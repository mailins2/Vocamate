import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class Ranks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        title: ShaderMask(
          shaderCallback: (rect) {
            return LinearGradient(
              colors: [themecolor_pink, themecolor_blue, themecolor_mint],
            ).createShader(rect);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Vocamate",
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                "Leading Board",
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [themecolor_pink, themecolor_blue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 15, left: 15),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Weekly"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: themecolor_purple,
                      foregroundColor: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(onPressed: () {}, child: Text("All time")),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      "assets/images/lexi_default_avatar.png",
                    ),
                    radius: 100,
                  ),
                  Text("Lexi",style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold
                  ),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("12,4K",style: TextStyle(
                        color: Colors.white
                      ),),
                      Image.asset("assets/images/fire.png",width: 20,),
                      SizedBox(width: 10,),
                      Text("10K Words",style: TextStyle(
                        color: Colors.white
                      ),)
                    ],
                  ),
                  SizedBox(height: 30),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Row(
                              children: [
                                Text(
                                  (index + 2).toString(),
                                  style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 10),
                                CircleAvatar(
                                  backgroundImage: AssetImage(
                                    "assets/images/lexi_default_avatar.png",
                                  ),
                                  radius: 25,
                                ),
                                SizedBox(width: 10,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "User" + (index + 1).toString(),
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 10,),
                                        Text("Level "+ (index +1).toString())
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("12,4K"),
                                        Image.asset("assets/images/fire.png",width: 20,),
                                        SizedBox(width: 10,),
                                        Text("10K Words")
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),

                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
