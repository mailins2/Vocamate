import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vocamate/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vocamate/models/lessonsModel.dart';
import 'package:vocamate/screens/cards.dart';
import 'package:vocamate/services/lessonAPI.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Home();
  }
}

class Home extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
                borderRadius: BorderRadius.circular(25),
                gradient: LinearGradient(
                  colors: [themecolor_blue, themecolor_pink],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  transform: GradientRotation(0.7),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          "assets/images/lexi_default_avatar.png",
                        ),
                        radius: 25,
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Lexi",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.settings_outlined,
                                      size: 25,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Level 1",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 10),
                              Center(
                                child: Icon(
                                  FontAwesomeIcons.solidCircle,
                                  size: 5,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 10),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "100",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(width: 5),
                                  Image.asset(
                                    "assets/images/coin.png",
                                    width: 15,
                                    height: 15,
                                    fit: BoxFit.contain,
                                  ),
                                ],
                              ),
                              SizedBox(width: 10),
                              Center(
                                child: Icon(
                                  FontAwesomeIcons.solidCircle,
                                  size: 5,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 10),
                              Baseline(
                                baseline: 16,
                                baselineType: TextBaseline.alphabetic,
                                child: Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Text(
                                      "100",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(width: 3),
                                    Image.asset(
                                      "assets/images/fire.png",
                                      height: 15,
                                      fit: BoxFit.contain,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 10, left: 10),
                    margin: EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 5, bottom: 5),
                          width: 24,
                          height: 16,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/images/english_flag.png",
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Text(
                          "English",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        Text(
                          "→",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 5, bottom: 5),
                          width: 24,
                          height: 16,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              image: AssetImage("assets/images/korea_flag.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Text(
                          "Korea",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> CardsPage()));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.44,
                      height: MediaQuery.of(context).size.width * 0.3,
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(18),
                        gradient: LinearGradient(
                          colors: [themecolor_blue, themecolor_pink],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          transform: GradientRotation(0.7),
                        ),
                      ),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/flashcard_icon.png",
                              width: 40,
                              height: 40,
                            ),
                            SizedBox(
                              height:
                              MediaQuery.of(context).size.height * 0.005,
                            ),
                            Text(
                              "Flash Cards",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.44,
                      height: MediaQuery.of(context).size.width * 0.30,
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(18),
                        gradient: LinearGradient(
                          colors: [themecolor_pink, themecolor_mint],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.bolt, color: Colors.orange, size: 40),
                            SizedBox(
                              height:
                              MediaQuery.of(context).size.height * 0.005,
                            ),
                            Text(
                              "Quick Quiz",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.trophy,
                            color: themecolor_purple,
                            size: 17,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          ShaderMask(
                            shaderCallback: (rect) {
                              return LinearGradient(
                                colors: [themecolor_purple, themecolor_pink],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ).createShader(rect);
                            },
                            child: Text(
                              "Achivements",
                              style: GoogleFonts.roboto(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "3/10",
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  SizedBox(
                    height: 70,
                    child: ListView(
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              padding: EdgeInsets.all(13),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                gradient: LinearGradient(
                                  colors: [themecolor_pink, themecolor_mint],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  transform: GradientRotation(0.7),
                                ),
                              ),
                              child: Image.asset(
                                "assets/images/goal_badge.png",
                              ),
                            ),
                            Text(
                              "Sharp",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              padding: EdgeInsets.all(13),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                gradient: LinearGradient(
                                  colors: [themecolor_blue, themecolor_pink],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  transform: GradientRotation(0.7),
                                ),
                              ),
                              child: Image.asset(
                                "assets/images/1st_win_badge.png",
                              ),
                            ),
                            Text(
                              "First Win",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              padding: EdgeInsets.all(13),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                gradient: LinearGradient(
                                  colors: [themecolor_pink, themecolor_mint],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  transform: GradientRotation(0.7),
                                ),
                              ),
                              child: Image.asset(
                                "assets/images/goal_badge.png",
                              ),
                            ),
                            Text(
                              "Sharp",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              padding: EdgeInsets.all(13),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                gradient: LinearGradient(
                                  colors: [themecolor_mint, themecolor_blue],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  transform: GradientRotation(0.7),
                                ),
                              ),
                              child: Image.asset(
                                "assets/images/star_rise_badge.png",
                              ),
                            ),
                            Text(
                              "Rising",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              padding: EdgeInsets.all(13),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.grey.withOpacity(0.5),
                              ),
                              child: Image.asset(
                                "assets/images/lock_badge.png",
                              ),
                            ),
                            Text(
                              "Locked",
                              style: TextStyle(
                                color: Colors.grey.withOpacity(0.5),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.gamepad,
                        color: themecolor_purple,
                        size: 23,
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                      ShaderMask(
                        shaderCallback: (rect) {
                          return LinearGradient(
                            colors: [themecolor_purple, themecolor_pink],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ).createShader(rect);
                        },
                        child: Text(
                          "Game Levels",
                          style: GoogleFonts.roboto(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Image.asset(
                        'assets/images/fire.png',
                        width: 20,
                        height: 20,
                      ),
                      SizedBox(width: 5),
                      Text(
                        '0 day streak',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Column(
              children: [
                Container(
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    gradient: LinearGradient(
                                      colors: [
                                        themecolor_blue,
                                        themecolor_pink,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.waving_hand,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                  MediaQuery.of(context).size.width * 0.03,
                                  height:
                                  MediaQuery.of(context).size.height * 0.03,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        ShaderMask(
                                          shaderCallback: (rect) {
                                            return LinearGradient(
                                              colors: [
                                                themecolor_purple,
                                                themecolor_pink,
                                              ],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                            ).createShader(rect);
                                          },
                                          child: Text(
                                            // lessonlst![0].title,
                                            "Basic greeting",
                                            style: GoogleFonts.roboto(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                            left: 6,
                                            right: 6,
                                          ),
                                          margin: EdgeInsets.only(left: 10),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              40,
                                            ),
                                            color: Color.fromRGBO(
                                              243,
                                              233,
                                              254,
                                              1.0,
                                            ),
                                          ),
                                          child: Text(
                                            "Level 1",
                                            style: TextStyle(
                                              color: Color.fromRGBO(
                                                159,
                                                73,
                                                236,
                                                1.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "2 changllenges await",
                                      style: TextStyle(
                                        color: Colors.grey.shade700,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star_rounded,
                                  color: Colors.yellow.shade600,
                                  size: 30,
                                ),
                                Text(
                                  "1/5",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(color: Colors.grey.withOpacity(0.2)),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                ShaderMask(
                                  shaderCallback: (rect) {
                                    return LinearGradient(
                                      colors: [
                                        themecolor_blue,
                                        themecolor_pink,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ).createShader(rect);
                                  },
                                  child: Icon(
                                    Icons.circle,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                                Icon(
                                  Icons.circle,
                                  color: Colors.grey.withOpacity(0.4),
                                  size: 20,
                                ),
                                Icon(
                                  Icons.circle,
                                  color: Colors.grey.withOpacity(0.4),
                                  size: 20,
                                ),
                                Icon(
                                  Icons.circle,
                                  color: Colors.grey.withOpacity(0.4),
                                  size: 20,
                                ),
                                Icon(
                                  Icons.circle,
                                  color: Colors.grey.withOpacity(0.4),
                                  size: 20,
                                ),
                                SizedBox(
                                  width:
                                  MediaQuery.of(context).size.width * 0.01,
                                ),
                                Text(
                                  "25% Complete",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "+20XP",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                  MediaQuery.of(context).size.width * 0.02,
                                ),
                                Container(
                                  width: 65,
                                  height: 33,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    gradient: LinearGradient(
                                      colors: [
                                        themecolor_green,
                                        themecolor_blue,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      print("tapped");
                                    },
                                    child: Text(
                                      "PLAY",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    gradient: LinearGradient(
                                      colors: [
                                        themecolor_blue,
                                        themecolor_pink,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.dining_outlined,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                  MediaQuery.of(context).size.width * 0.03,
                                  height:
                                  MediaQuery.of(context).size.height * 0.03,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        ShaderMask(
                                          shaderCallback: (rect) {
                                            return LinearGradient(
                                              colors: [
                                                themecolor_purple,
                                                themecolor_pink,
                                              ],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                            ).createShader(rect);
                                          },
                                          child: Text(
                                            "Food and Dinning",
                                            style: GoogleFonts.roboto(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                            left: 6,
                                            right: 6,
                                          ),
                                          margin: EdgeInsets.only(left: 10),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              40,
                                            ),
                                            color: Color.fromRGBO(
                                              243,
                                              233,
                                              254,
                                              1.0,
                                            ),
                                          ),
                                          child: Text(
                                            "Level 2",
                                            style: TextStyle(
                                              color: Color.fromRGBO(
                                                159,
                                                73,
                                                236,
                                                1.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "2 changllenges await",
                                      style: TextStyle(
                                        color: Colors.grey.shade700,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star_rounded,
                                  color: Colors.yellow.shade600,
                                  size: 30,
                                ),
                                Text(
                                  "0/5",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(color: Colors.grey.withOpacity(0.2)),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: Colors.grey.withOpacity(0.4),
                                  size: 20,
                                ),
                                Icon(
                                  Icons.circle,
                                  color: Colors.grey.withOpacity(0.4),
                                  size: 20,
                                ),
                                Icon(
                                  Icons.circle,
                                  color: Colors.grey.withOpacity(0.4),
                                  size: 20,
                                ),
                                Icon(
                                  Icons.circle,
                                  color: Colors.grey.withOpacity(0.4),
                                  size: 20,
                                ),
                                Icon(
                                  Icons.circle,
                                  color: Colors.grey.withOpacity(0.4),
                                  size: 20,
                                ),
                                SizedBox(
                                  width:
                                  MediaQuery.of(context).size.width * 0.01,
                                ),
                                Text(
                                  "0% Complete",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "+20XP",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                  MediaQuery.of(context).size.width * 0.01,
                                ),
                                Container(
                                  width: 65,
                                  height: 33,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    gradient: LinearGradient(
                                      colors: [
                                        themecolor_green,
                                        themecolor_blue,
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      print("tapped");
                                    },
                                    child: Text(
                                      "PLAY",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Opacity(
              opacity: 0.5,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    padding: EdgeInsets.all(13),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        color: Colors.grey
                                    ),
                                    child: Image.asset(
                                      "assets/images/lock_badge.png",
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                    MediaQuery.of(context).size.width *
                                        0.03,
                                    height:
                                    MediaQuery.of(context).size.height *
                                        0.03,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context).size.width *0.37,
                                            child: Text(
                                              "Travel & Transportation",
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: false,
                                              style: GoogleFonts.roboto(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey.shade700,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                              left: 6,
                                              right: 6,
                                            ),
                                            margin: EdgeInsets.only(left: 10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(40),
                                              color: Color.fromRGBO(
                                                243,
                                                233,
                                                254,
                                                1.0,
                                              ),
                                            ),
                                            child: Text(
                                              "Level 2",
                                              style: TextStyle(
                                                color: Color.fromRGBO(
                                                  159,
                                                  73,
                                                  236,
                                                  1.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "2 changllenges await",
                                        style: TextStyle(
                                          color: Colors.grey.shade700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star_rounded,
                                    color: Colors.yellow.shade600,
                                    size: 30,
                                  ),
                                  Text(
                                    "0/5",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(color: Colors.grey.withOpacity(0.2)),
                        Container(
                          padding: EdgeInsets.all(15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: Colors.grey.withOpacity(0.4),
                                    size: 20,
                                  ),
                                  Icon(
                                    Icons.circle,
                                    color: Colors.grey.withOpacity(0.4),
                                    size: 20,
                                  ),
                                  Icon(
                                    Icons.circle,
                                    color: Colors.grey.withOpacity(0.4),
                                    size: 20,
                                  ),
                                  Icon(
                                    Icons.circle,
                                    color: Colors.grey.withOpacity(0.4),
                                    size: 20,
                                  ),
                                  Icon(
                                    Icons.circle,
                                    color: Colors.grey.withOpacity(0.4),
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width:
                                    MediaQuery.of(context).size.width *
                                        0.01,
                                  ),
                                  Text(
                                    "0% Complete",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "+20XP",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                    MediaQuery.of(context).size.width *
                                        0.01,
                                  ),
                                  Container(
                                    width: 65,
                                    height: 33,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      gradient: LinearGradient(
                                        colors: [
                                          themecolor_green,
                                          themecolor_blue,
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        print("tapped");
                                      },
                                      child: Text(
                                        "PLAY",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),//lesson is locked
          ],
        ),
      ),
    );
  }
}
