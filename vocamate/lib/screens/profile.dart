import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class Profile extends StatelessWidget {
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
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 270,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white,
                      Colors.black.withOpacity(0.3),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              Center(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    CircleAvatar(
                      backgroundImage: AssetImage(
                        "assets/images/lexi_default_avatar.png",
                      ),
                      radius: 50,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Lexi",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "lexi-repesentative@vocamate.com",
                      style: TextStyle(color: Colors.white,fontSize: 17),
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              '1',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                            Text(
                              'Level',
                              style: TextStyle(color: Colors.white,fontSize: 17),
                            ),
                          ],
                        ),
                        SizedBox(width: 10),
                        Column(
                          children: [
                            Text('100', style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold)),
                            Text('Coins', style: TextStyle(color: Colors.white,fontSize: 17)),
                          ],
                        ),
                        SizedBox(width: 10),
                        Column(
                          children: [
                            Text('0', style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold)),
                            Text(
                              'Day streak',
                              style: TextStyle(color: Colors.white,fontSize: 17),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
