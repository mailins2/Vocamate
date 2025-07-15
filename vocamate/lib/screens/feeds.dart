import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class FeedsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Feeds();
  }
}

class Feeds extends State<FeedsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              Text("Community Feed",style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),)
            ],
          )
        ),
        actions: [
          GestureDetector(
            onTap: (){},
            child: Container(
              margin: EdgeInsets.only(right: 10),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [themecolor_pink, themecolor_blue, themecolor_mint],
                ),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                children: [
                  Icon(Icons.add_rounded, color: Colors.white,size: 25,),
                  Text("Write",style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),),
                ],
              ),
            ),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              themecolor_blue.withOpacity(0.1),
              themecolor_pink.withOpacity(0.1),
              themecolor_mint.withOpacity(0.1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.1, 0.3, 0.7],
          ),
        ),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(
                              "assets/images/lexi_default_avatar.png",
                            ),
                            radius: 25,
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Lexi",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text("15 minutes"),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 70,
                            height: 30,
                            decoration: BoxDecoration(
                              color: themecolor_mint.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(40),
                              border: BoxBorder.all(
                                color: Colors.greenAccent,
                                width: 1,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "So So",
                                style: TextStyle(
                                  color: Colors.greenAccent.shade400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      "Write a sentence or paragraph contained these words : 바나나(n), 사과 (n), 사다 (v)",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  Text(
                    "어제 슈퍼마켓에서 사과 2개 샀어요.",
                    style: TextStyle(fontSize: 20, color: themecolor_blue),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(FontAwesomeIcons.heart),
                      ),
                      Text("+1XP"),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(FontAwesomeIcons.penToSquare),
                      ),
                      Text("+10XP"),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(FontAwesomeIcons.bookmark, size: 20),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
