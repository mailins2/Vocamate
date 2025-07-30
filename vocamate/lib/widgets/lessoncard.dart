import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vocamate/models/lessonsModel.dart';
import 'package:vocamate/models/vocabularyModel.dart';
import 'package:vocamate/services/lessonAPI.dart';

import '../constants.dart';
import '../screens/cards.dart';

class LessonCard extends StatelessWidget{
  final List<Lessons> lessonlst;
  final int index;
  final int progress;
  LessonCard({
    required this.lessonlst,
    required this.index,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
                              colors: [themecolor_blue, themecolor_pink],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Center(
                            child: SvgPicture.network(
                              'https://cdn.jsdelivr.net/npm/feather-icons/dist/icons/${lessonlst![index].icon}.svg',
                              color: Colors.white,
                              width: 30,
                              height: 30,
                              placeholderBuilder: (context) =>
                                  CircularProgressIndicator(strokeWidth: 1),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.03,
                          height: MediaQuery.of(context).size.height * 0.03,
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
                                    lessonlst![index].title,
                                    //"Basic greeting",
                                    style: GoogleFonts.roboto(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 6, right: 6),
                                  margin: EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: Color.fromRGBO(243, 233, 254, 1.0),
                                  ),
                                  child: Text(
                                    "Level " +
                                        lessonlst[index].level.toString(),
                                    style: TextStyle(
                                      color: Color.fromRGBO(159, 73, 236, 1.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "2 changllenges await",
                              style: TextStyle(color: Colors.grey.shade700),
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
                        progress >= 20
                            ? ShaderMask(
                          shaderCallback: (rect) {
                            return LinearGradient(
                              colors: [themecolor_blue, themecolor_pink],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ).createShader(rect);
                          },
                          child: Icon(
                            Icons.circle,
                            color: Colors.white,
                            size: 20,
                          ),
                        )
                            : Icon(
                          Icons.circle,
                          color: Colors.grey.withOpacity(0.4),
                          size: 20,
                        ),
                        progress >= 40
                            ? ShaderMask(
                          shaderCallback: (rect) {
                            return LinearGradient(
                              colors: [themecolor_blue, themecolor_pink],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ).createShader(rect);
                          },
                          child: Icon(
                            Icons.circle,
                            color: Colors.white,
                            size: 20,
                          ),
                        )
                            : Icon(
                          Icons.circle,
                          color: Colors.grey.withOpacity(0.4),
                          size: 20,
                        ),
                        progress >= 60
                            ? ShaderMask(
                          shaderCallback: (rect) {
                            return LinearGradient(
                              colors: [themecolor_blue, themecolor_pink],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ).createShader(rect);
                          },
                          child: Icon(
                            Icons.circle,
                            color: Colors.white,
                            size: 20,
                          ),
                        )
                            : Icon(
                          Icons.circle,
                          color: Colors.grey.withOpacity(0.4),
                          size: 20,
                        ),
                        progress >= 80
                            ? ShaderMask(
                          shaderCallback: (rect) {
                            return LinearGradient(
                              colors: [themecolor_blue, themecolor_pink],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ).createShader(rect);
                          },
                          child: Icon(
                            Icons.circle,
                            color: Colors.white,
                            size: 20,
                          ),
                        )
                            : Icon(
                          Icons.circle,
                          color: Colors.grey.withOpacity(0.4),
                          size: 20,
                        ),
                        progress >= 100
                            ? ShaderMask(
                          shaderCallback: (rect) {
                            return LinearGradient(
                              colors: [themecolor_blue, themecolor_pink],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ).createShader(rect);
                          },
                          child: Icon(
                            Icons.circle,
                            color: Colors.white,
                            size: 20,
                          ),
                        )
                            : Icon(
                          Icons.circle,
                          color: Colors.grey.withOpacity(0.4),
                          size: 20,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.01,
                        ),
                        Text(
                          progress.toString() + "% Complete",
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
                          "+" + lessonlst[index].reward.toString() + "XP",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        Container(
                          width: 65,
                          height: 33,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            gradient: LinearGradient(
                              colors: [themecolor_green, themecolor_blue],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: TextButton(
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CardPage(
                                    lessonId: lessonlst[index].id,
                                    targetlang: lessonlst[index].targetLang,
                                    nativelang: currentUser['nativelang'],
                                  ),
                                ),
                              );
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
    );
  }
}
