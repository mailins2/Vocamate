import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vocamate/constants.dart';

import '../models/lessonsModel.dart';
import '../services/lessonAPI.dart';

class LessonsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LessonsScreen();
  }
}

class LessonsScreen extends State<LessonsPage> {
  List<Lessons>? lessonlst;

  bool isloaded = false;

  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    lessonlst = await LessonsAPIService().getLessons();
    if (lessonlst != null) {
      lessonlst = lessonlst!
          .where((x) => x.targetLang == TargetLang.KO)
          .toList();
      setState(() {
        isloaded = true;
      });
    }
  }

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
              themecolor_pink.withOpacity(0.1),
              themecolor_mint.withOpacity(0.1),
              themecolor_purple.withOpacity(0.1),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topLeft,
            stops: [0.1, 0.3, 0.7],
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
                    child: Text("All"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: themecolor_purple,
                      foregroundColor: Colors.white,

                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(onPressed: () {}, child: Text("Learned")),
                  SizedBox(width: 10),
                  ElevatedButton(onPressed: () {}, child: Text("Locked")),
                ],
              ),
            ),
            Visibility(
              visible: isloaded,
              child: ListView.builder(
                itemCount: lessonlst?.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            100,
                                          ),
                                          gradient: LinearGradient(
                                            colors: [
                                              themecolor_blue,
                                              themecolor_pink,
                                            ],
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
                                            placeholderBuilder: (context) => CircularProgressIndicator(strokeWidth: 1),
                                          ),
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
                                                padding: EdgeInsets.only(
                                                  left: 6,
                                                  right: 6,
                                                ),
                                                margin: EdgeInsets.only(
                                                  left: 10,
                                                ),
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
                                                  "Level " +
                                                      lessonlst![index].level
                                                          .toString(),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                            MediaQuery.of(context).size.width *
                                            0.01,
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
                                        "+" +
                                            lessonlst![index].reward
                                                .toString() +
                                            "XP",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey.shade700,
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                            0.02,
                                      ),
                                      Container(
                                        width: 65,
                                        height: 33,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            40,
                                          ),
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
                  );
                },
              ),
              replacement: Center(child: CircularProgressIndicator()),
            ),
            // Opacity(
            //   opacity: 0.5,
            //   child: Column(
            //     children: [
            //       Container(
            //         margin: EdgeInsets.all(15),
            //         decoration: BoxDecoration(
            //           color: Colors.white,
            //           borderRadius: BorderRadius.circular(10),
            //           boxShadow: [
            //             BoxShadow(
            //               color: Colors.black.withOpacity(0.2),
            //               spreadRadius: 2,
            //               blurRadius: 8,
            //               offset: Offset(0, 2),
            //             ),
            //           ],
            //         ),
            //         child: Column(
            //           children: [
            //             Container(
            //               padding: EdgeInsets.all(15),
            //               child: Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: [
            //                   Row(
            //                     children: [
            //                       Container(
            //                         width: 50,
            //                         height: 50,
            //                         padding: EdgeInsets.all(13),
            //                         decoration: BoxDecoration(
            //                           borderRadius: BorderRadius.circular(100),
            //                           color: Colors.grey,
            //                         ),
            //                         child: Image.asset(
            //                           "assets/images/lock_badge.png",
            //                         ),
            //                       ),
            //                       SizedBox(
            //                         width:
            //                             MediaQuery.of(context).size.width *
            //                             0.03,
            //                         height:
            //                             MediaQuery.of(context).size.height *
            //                             0.03,
            //                       ),
            //                       Column(
            //                         crossAxisAlignment:
            //                             CrossAxisAlignment.start,
            //                         children: [
            //                           Row(
            //                             children: [
            //                               Container(
            //                                 width:
            //                                     MediaQuery.of(
            //                                       context,
            //                                     ).size.width *
            //                                     0.37,
            //                                 child: Text(
            //                                   "Travel & Transportation",
            //                                   overflow: TextOverflow.ellipsis,
            //                                   softWrap: false,
            //                                   style: GoogleFonts.roboto(
            //                                     fontSize: 18,
            //                                     fontWeight: FontWeight.bold,
            //                                     color: Colors.grey.shade700,
            //                                   ),
            //                                 ),
            //                               ),
            //                               Container(
            //                                 padding: EdgeInsets.only(
            //                                   left: 6,
            //                                   right: 6,
            //                                 ),
            //                                 margin: EdgeInsets.only(left: 10),
            //                                 decoration: BoxDecoration(
            //                                   borderRadius:
            //                                       BorderRadius.circular(40),
            //                                   color: Color.fromRGBO(
            //                                     243,
            //                                     233,
            //                                     254,
            //                                     1.0,
            //                                   ),
            //                                 ),
            //                                 child: Text(
            //                                   "Level 2",
            //                                   style: TextStyle(
            //                                     color: Color.fromRGBO(
            //                                       159,
            //                                       73,
            //                                       236,
            //                                       1.0,
            //                                     ),
            //                                   ),
            //                                 ),
            //                               ),
            //                             ],
            //                           ),
            //                           Text(
            //                             "2 changllenges await",
            //                             style: TextStyle(
            //                               color: Colors.grey.shade700,
            //                             ),
            //                           ),
            //                         ],
            //                       ),
            //                     ],
            //                   ),
            //                   Row(
            //                     mainAxisAlignment: MainAxisAlignment.end,
            //                     crossAxisAlignment: CrossAxisAlignment.center,
            //                     children: [
            //                       Icon(
            //                         Icons.star_rounded,
            //                         color: Colors.yellow.shade600,
            //                         size: 30,
            //                       ),
            //                       Text(
            //                         "0/5",
            //                         style: TextStyle(
            //                           fontWeight: FontWeight.bold,
            //                           fontSize: 17,
            //                         ),
            //                       ),
            //                     ],
            //                   ),
            //                 ],
            //               ),
            //             ),
            //             Divider(color: Colors.grey.withOpacity(0.2)),
            //             Container(
            //               padding: EdgeInsets.all(15),
            //               child: Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: [
            //                   Row(
            //                     children: [
            //                       Icon(
            //                         Icons.circle,
            //                         color: Colors.grey.withOpacity(0.4),
            //                         size: 20,
            //                       ),
            //                       Icon(
            //                         Icons.circle,
            //                         color: Colors.grey.withOpacity(0.4),
            //                         size: 20,
            //                       ),
            //                       Icon(
            //                         Icons.circle,
            //                         color: Colors.grey.withOpacity(0.4),
            //                         size: 20,
            //                       ),
            //                       Icon(
            //                         Icons.circle,
            //                         color: Colors.grey.withOpacity(0.4),
            //                         size: 20,
            //                       ),
            //                       Icon(
            //                         Icons.circle,
            //                         color: Colors.grey.withOpacity(0.4),
            //                         size: 20,
            //                       ),
            //                       SizedBox(
            //                         width:
            //                             MediaQuery.of(context).size.width *
            //                             0.01,
            //                       ),
            //                       Text(
            //                         "0% Complete",
            //                         style: TextStyle(
            //                           fontSize: 16,
            //                           color: Colors.grey.shade700,
            //                         ),
            //                       ),
            //                     ],
            //                   ),
            //                   Row(
            //                     children: [
            //                       Text(
            //                         "+20XP",
            //                         style: TextStyle(
            //                           fontSize: 16,
            //                           color: Colors.grey.shade700,
            //                         ),
            //                       ),
            //                       SizedBox(
            //                         width:
            //                             MediaQuery.of(context).size.width *
            //                             0.01,
            //                       ),
            //                       Container(
            //                         width: 65,
            //                         height: 33,
            //                         decoration: BoxDecoration(
            //                           borderRadius: BorderRadius.circular(40),
            //                           gradient: LinearGradient(
            //                             colors: [
            //                               themecolor_green,
            //                               themecolor_blue,
            //                             ],
            //                             begin: Alignment.topLeft,
            //                             end: Alignment.bottomRight,
            //                           ),
            //                         ),
            //                         child: TextButton(
            //                           onPressed: () {
            //                             print("tapped");
            //                           },
            //                           child: Text(
            //                             "PLAY",
            //                             style: TextStyle(
            //                               color: Colors.white,
            //                               fontSize: 14,
            //                               fontWeight: FontWeight.bold,
            //                             ),
            //                           ),
            //                           style: TextButton.styleFrom(
            //                             backgroundColor: Colors.transparent,
            //                           ),
            //                         ),
            //                       ),
            //                     ],
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
