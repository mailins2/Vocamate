import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vocamate/constants.dart';

class CardsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Cards();
  }
}

class Cards extends State<CardsPage> {
  final List<Color> ColorPalete = [
    themecolor_blue,
    themecolor_pink,
    themecolor_mint,
    themecolor_purple,
    themecolor_green,
  ];
  final List<Alignment> AlignmentList = [
    Alignment.center,
    Alignment.centerLeft,
    Alignment.centerRight,
    Alignment.topRight,
    Alignment.topCenter,
    Alignment.topLeft,
    Alignment.bottomLeft,
    Alignment.bottomCenter,
    Alignment.bottomRight,
  ];
  final random = Random();

  @override
  Widget build(BuildContext context) {
    Color Color1 = ColorPalete[random.nextInt(ColorPalete.length)].withOpacity(
      0.5,
    );
    Color Color2 = ColorPalete[random.nextInt(ColorPalete.length)].withOpacity(
      0.5,
    );
    final bg = Color.lerp(Color1, Color2, 0.5)!;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        centerTitle: true,
        title: Text(
          'VOCAMATE',
          style: GoogleFonts.poppins(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [themecolor_pink, themecolor_blue, themecolor_mint],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              transform: GradientRotation(0.7),
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          // gradient: LinearGradient(
          //   colors: [
          //     themecolor_blue.withOpacity(0.3),
          //     themecolor_pink.withOpacity(0.3),
          //   ],
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomRight,
          // ),
        ),
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                  colors: [themecolor_purple, themecolor_pink],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  //stops: [0.3,0.2,0.5],
                  //transform: GradientRotation(1)
                ).createShader(rect);
              },
              child: Text(
                "FLASHCARD HUB !",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              "Build your brain power today",
              style: TextStyle(color: Colors.grey.shade700),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 9,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: MediaQuery.of(context).size.width * 0.05,
                mainAxisSpacing: MediaQuery.of(context).size.width * 0.05,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          ColorPalete[random.nextInt(ColorPalete.length)],
                          ColorPalete[random.nextInt(ColorPalete.length)],
                          ColorPalete[random.nextInt(ColorPalete.length)],
                          ColorPalete[random.nextInt(ColorPalete.length)],
                        ],
                        begin:
                            AlignmentList[random.nextInt(AlignmentList.length)],
                        end:
                            AlignmentList[random.nextInt(AlignmentList.length)],
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //Icon(Icons.),
                          Image.asset(
                            "assets/images/fruit.png",
                            width: 40,
                            height: 40,
                          ),
                          Text(
                            "Fruit",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "20 words",
                            style: TextStyle(fontSize: 13, height: 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [themecolor_green, themecolor_blue, themecolor_pink],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                offset: Offset(0, 2),
                spreadRadius: 2,
                blurRadius: 20,
              ),
            ],
          ),
          child: Icon(Icons.add_rounded, color: Colors.white, size: 30),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
