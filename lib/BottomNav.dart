import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'AOLText.dart';
import 'AboutUsPages/AboutUs/HomeScreen.dart';
import 'HomePages/Pages/myHomePage.dart';
import 'Multilingual/language.dart';
import 'UI/Theme/Theme.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentPage = 0;
  GlobalKey bottomNavigationKey = GlobalKey();
  SharedPreferences sharedPreferences;
  String language;

  void initState() {
    print("in homepage");
    // _languageHome = context.read<Language>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: getPage(currentPage),
        bottomNavigationBar: FancyBottomNavigation(
          circleColor: bottomnavColor,
          activeIconColor: iconColor,
          inactiveIconColor: bottomnavColor,
          tabs: [
            TabData(
                iconData: Icons.home,
                title: "Home",
                onclick: () {
                  final FancyBottomNavigationState fState =
                      bottomNavigationKey.currentState;
                  fState.setPage(0);
                }),
            TabData(
                iconData: Icons.assignment,
                title: "Projects",
                onclick: () {
                  final FancyBottomNavigationState fState =
                      bottomNavigationKey.currentState;
                  fState.setPage(1);
                }),
            TabData(
                iconData: Icons.attach_money,
                title: "Donations",
                onclick: () {
                  final FancyBottomNavigationState fState =
                      bottomNavigationKey.currentState;
                  fState.setPage(2);
                }),         
          ],
          initialSelection: 0,
          key: bottomNavigationKey,
          onTabChangedListener: (position) {
            setState(() {
              currentPage = position;
            });
          },
        ));
  }
}

getPage(int page) {
  switch (page) {
    case 0:
      return MyHome(); //HomePage
    case 1:
      return HomeScreen(); //Change Project Page here
    case 2:
      return HomeScreen(); //Change Profile Page here
    default:
      return MyHome();
  }
}
