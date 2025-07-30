import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vocamate/screens/signIn.dart';

import '../constants.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                height: 280,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [themecolor_pink, themecolor_purple],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              Center(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    CircleAvatar(
                      backgroundImage: currentUser['avatar'] != null
                          ? AssetImage(currentUser['avatar'].toString())
                          : AssetImage("assets/images/default_avatar.png"),
                      radius: 50,
                    ),
                    SizedBox(height: 10),
                    Text(
                      currentUser['username'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      currentUser['email'] != null ? currentUser['email'].toString() : "",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              currentUser['level'].toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                            Text(
                              'Level',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 10),
                        Column(
                          children: [
                            Text(
                              currentUser['coin'].toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Coins',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 10),
                        Column(
                          children: [
                            Text(
                              currentUser['streak'].toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Day streak',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
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
          Container(
            padding: EdgeInsets.all(10),
            child: TextButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.storefront_outlined,
                        color: themecolor_blue,
                        size: 25,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Shop",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios, color: Colors.grey),
                ],
              ),
              style: TextButton.styleFrom(
                side: BorderSide(color: Colors.grey.withOpacity(0.2)),
                shape: RoundedSuperellipseBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: TextButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.settings_outlined,
                        color: Colors.grey.shade700,
                        size: 25,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Setting",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios, color: Colors.grey),
                ],
              ),
              style: TextButton.styleFrom(
                side: BorderSide(color: Colors.grey.withOpacity(0.2)),
                shape: RoundedSuperellipseBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: TextButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.language_outlined,
                        color: themecolor_blue,
                        size: 25,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Change language",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios, color: Colors.grey),
                ],
              ),
              style: TextButton.styleFrom(
                side: BorderSide(color: Colors.grey.withOpacity(0.2)),
                shape: RoundedSuperellipseBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: TextButton(
              onPressed: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      title: Text("Sign out"),
                      content: Text("Are you sure you want to sign out of your account?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("No"),
                        ),
                        TextButton(
                          onPressed: () {
                            FirebaseAuth.instance.signOut();
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignIn()),
                            );
                          },
                          child: Text("Yes"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.arrowRightFromBracket,
                    color: Colors.red,
                    size: 23,
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Sign out",
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  ),
                ],
              ),
              style: TextButton.styleFrom(
                side: BorderSide(color: Colors.grey.withOpacity(0.2)),
                shape: RoundedSuperellipseBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
