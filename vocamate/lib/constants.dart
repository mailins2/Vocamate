import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vocamate/models/userModel.dart';

const Color themecolor_blue = Color.fromRGBO(75, 85, 255, 1.0);
const Color themecolor_pink = Color.fromRGBO(255, 120, 112, 1.0);
const Color themecolor_mint = Color.fromRGBO(63, 253, 225, 1.0);
const Color themecolor_purple = Color.fromRGBO(94, 88, 239, 1.0);
const Color themecolor_green = Color.fromRGBO(74, 220, 131, 1.0);
late Map<String,dynamic> currentUser ;
Map<String,String> displayLanguage(lang) {
  Map<String,String> languagekit={};
  switch (lang) {
    case "vi":
      {
        languagekit ={
          'language' :"Vietnamese",
          'flag' : "assets/images/vietnam_flag.png",
        };
        break;
      }
    case "en":
      {
        languagekit ={
          'language' :"English",
          'flag' : "assets/images/english_flag.png",
        };
        break;
      }
    case "ko":
      {
        languagekit ={
          'language' :"Korean",
          'flag' : "assets/images/korea_flag.png",
        };
        break;
      }
  }
  return languagekit;
}



