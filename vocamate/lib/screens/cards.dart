import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vocamate/models/vocabularyModel.dart';
import 'package:vocamate/screens/cardsets.dart';
import 'package:vocamate/services/lessonAPI.dart';

import '../constants.dart';

class CardPage extends StatefulWidget {
  final lessonId;
  final targetlang;
  final nativelang;

  CardPage({
    required this.lessonId,
    required this.targetlang,
    required this.nativelang,
  });

  @override
  State<StatefulWidget> createState() {
    return Card();
  }
}

class Card extends State<CardPage> {
  int word_index = 0;
  int rememberwords = 0;
  late Color cardColor = themecolor_blue;
  late Future<List<Vocabulary>> vocabfuture;
  late int length;

  @override
  void initState() {
    super.initState();
    vocabfuture = VocabFuture();
  }

  Future<List<Vocabulary>> VocabFuture() async {
    final isnew = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('learningprogress')
        .doc(widget.lessonId.toString())
        .get();
    if (!isnew.exists) {
      List<Vocabulary>? vocablist = await LessonsAPIService().getVocabulary();
      if (vocablist != null) {
        vocablist = vocablist
            .where((x) => x.lessonId == widget.lessonId)
            .toList();
        await FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('learningprogress')
            .doc(widget.lessonId.toString())
            .set({
              'reviewwords': vocablist.map((vocab) => vocab.toJson()).toList(),
              'removewords': [],
            });
      }
    }
    DocumentSnapshot finaldata = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('learningprogress')
        .doc(widget.lessonId.toString())
        .get();
    Map<String, dynamic> transferdata =
        finaldata.data() as Map<String, dynamic>;

    List<Vocabulary> reviewlist = (transferdata['reviewwords'] as List)
        .map((vocab) => Vocabulary.fromJson(vocab))
        .toList();
    length = reviewlist.length;
    return reviewlist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: FutureBuilder(
          future: vocabfuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else {
              final reviewwords = snapshot.data as List<Vocabulary>;
              late Vocabulary removewords;
              if (reviewwords.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.emoji_events, size: 80, color: Colors.amber),
                      SizedBox(height: 20),
                      Text(
                        "🎉 You’ve reviewed all words!",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Great job! Let's go to the next lesson",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                );
              } else {
                return ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Flashcards",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          (rememberwords).toString() + "/" + length.toString(),
                          style: TextStyle(fontSize: 17, color: Colors.grey),
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: rememberwords / length,
                        backgroundColor: Colors.grey.withOpacity(0.5),
                        valueColor: AlwaysStoppedAnimation<Color>(
                          themecolor_blue,
                        ),
                        minHeight: 10,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          cardColor == themecolor_blue
                              ? cardColor = themecolor_green
                              : cardColor = themecolor_blue;
                        });
                      },
                      child: Container(
                        height: 400,
                        margin: EdgeInsets.symmetric(vertical: 15),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: cardColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: cardColor == themecolor_blue
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    reviewwords[word_index].word.toUpperCase(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    reviewwords[word_index].type,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  // IconButton(
                                  //   onPressed: () {},
                                  //   icon: Icon(Icons.volume_up_sharp,color: Colors.white,),
                                  //   style: IconButton.styleFrom(
                                  //     backgroundColor: Colors.white.withOpacity(0.2)
                                  //   ),
                                  // ),
                                ],
                              )
                            : Center(
                                child: Text(
                                  reviewwords[word_index].meaning[widget
                                      .nativelang],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (word_index < reviewwords.length - 1) {
                              setState(() {
                                word_index++;
                                cardColor = themecolor_blue;
                              });
                            } else {
                              setState(() {
                                word_index = 0;
                                cardColor = themecolor_blue;
                              });
                            }
                            print(word_index.toString());
                            print(
                              "Review words: ${reviewwords.map((vocab) => vocab.word).toList()}",
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(5),
                            backgroundColor: Colors.red.withOpacity(0.2),
                            elevation: 0,
                            shadowColor: Colors.transparent,
                          ),
                          child: const Icon(
                            Icons.close_rounded,
                            color: Colors.red,
                            size: 25,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async{
                            if (word_index < reviewwords.length) {
                              print(word_index.toString());
                              setState(() {
                                removewords = reviewwords[word_index];
                                reviewwords.removeAt(word_index);
                                cardColor = themecolor_blue;
                                rememberwords++;
                              });
                              final uid =
                                  FirebaseAuth.instance.currentUser!.uid;
                              await FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(uid)
                                  .collection('learningprogress')
                                  .doc(widget.lessonId.toString())
                                  .set({
                                'reviewwords': reviewwords.map((vocab) =>
                                    vocab.toJson()).toList(),
                              });
                              print(
                                "Review words: ${reviewwords.map((vocab) => vocab.word).toList()}",
                              );
                              print(
                                "Remove words: " + removewords.word.toString(),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(5),
                            backgroundColor: Colors.green.withOpacity(0.2),
                            elevation: 0,
                            shadowColor: Colors.transparent,
                          ),
                          child: const Icon(
                            Icons.check_sharp,
                            color: Colors.green,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 15),
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: BoxBorder.all(
                          color: Colors.grey.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Example Sentence",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // IconButton(
                              //   onPressed: () {},
                              //   icon: Icon(
                              //     Icons.volume_up_sharp,
                              //     color: themecolor_blue,
                              //   ),
                              // ),
                            ],
                          ),
                          Text(
                            reviewwords[word_index].example[widget.targetlang],
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 5),
                          cardColor == themecolor_green
                              ? Text(
                                  reviewwords[word_index].example[widget
                                      .nativelang],
                                  style: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontSize: 16,
                                  ),
                                )
                              : Text(""),
                        ],
                      ),
                    ),
                  ],
                );
              }
            }
          },
        ),
      ),
    );
  }
}
