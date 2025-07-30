import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vocamate/constants.dart';
import 'package:vocamate/services/lessonAPI.dart';
import 'package:vocamate/widgets/lessoncard.dart';
import 'package:vocamate/widgets/lockedLesson.dart';

import '../models/lessonsModel.dart';

class LessonsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LessonsScreen();
  }
}

class LessonsScreen extends State<LessonsPage> {
  int filter = 1;
  late Future<List<Lessons>?> lessonslst;
  bool beginner = true;

  @override
  void initState() {
    super.initState();
    lessonslst = LessonsAPIService().getLessons();
    isBeginner();
  }

  Future<void> isBeginner() async {
    final progressSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('learningprogress')
        .get();
    if (progressSnapshot.docs.isEmpty) {
      beginner = true;
    } else {
      beginner = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    onPressed: () {
                      setState(() {
                        filter = 1;
                      });
                    },
                    child: Text("All"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: themecolor_purple,
                      foregroundColor: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        filter = 2;
                      });
                    },
                    child: Text("Learned"),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        filter = 3;
                      });
                    },
                    child: Text("Locked"),
                  ),
                ],
              ),
            ),
            FutureBuilder(
              future: lessonslst,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  final lessons = snapshot.data!.where((x) =>
                  x.targetLang == currentUser['targetlang']).toList() as List<
                      Lessons>;
                  if (filter == 1) {
                    if (beginner) {
                      return ListView.builder(
                        itemCount: lessons.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return index == 0
                              ? LessonCard(
                            lessonlst: lessons,
                            index: index,
                            progress: 0,
                          )
                              : LockedLesson(lessonlst: lessons, index: index);
                        },
                      );
                    }
                    return Center(child: Text(beginner.toString()));
                  } else if (filter == 2) {
                    if (beginner) {
                      return Text(
                          "You haven't learned any lessons yet. Let's study now!");
                    }
                    return LessonCard(
                      lessonlst: lessons,
                      index: 0,
                      progress: 0,
                    );
                  } else {
                    if (beginner) {
                      return ListView.builder(
                        itemCount: lessons.length-1,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return LockedLesson(lessonlst: lessons, index: index+1);
                        },
                      );
                    }
                    return LessonCard(
                      lessonlst: lessons,
                      index: 0,
                      progress: 0,
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
