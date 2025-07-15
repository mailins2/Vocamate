import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vocamate/screens/home.dart';
import 'constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'screens/lessons.dart';
import 'screens/cards.dart';
import 'screens/feeds.dart';
import 'screens/ranks.dart';
import 'screens/profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Vocamate', home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NavigatorPage();
  }
}

class NavigatorPage extends State<MyHomePage> {
  Widget currentState = HomePage();
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentState,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: themecolor_blue,
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        backgroundColor: Colors.white,
        onTap: (int index){
          if(index == 0){
            setState(() {
              currentState = HomePage();
              selectedIndex = 0;
            });
          }
          else if(index == 1){
            setState(() {
              currentState = LessonsPage();
              selectedIndex =1;
            });
          }
          else if(index == 2){
            setState(() {
              currentState = FeedsPage();
              selectedIndex =2;
            });
          }
          else if(index == 3){
            setState(() {
              currentState = Ranks();
              selectedIndex =3;
            });
          }
          else{
            setState(() {
              currentState = Profile();
              selectedIndex =4;
            });
          }
        },
        currentIndex:  selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.import_contacts),
            label: "Lessons",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.comment),
            label: "Feed",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.rankingStar),
            label: "Ranks",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.user),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
