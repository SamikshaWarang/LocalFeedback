import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'BottomNav.dart';
import 'Multilingual/language.dart';
import 'wrapper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool setLanguage;
  String getSetLanguage;
  void initState() {
    getLanguageInfo();
    super.initState();
  }

  Future<bool> getLanguageInfo() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      setLanguage = sharedPreferences.getBool('setLanguage' ?? false);
      getSetLanguage = sharedPreferences.getString('language' ?? 'en');
    });

    return setLanguage;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Language>(
      create: (context) => Language(getSetLanguage),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: BottomNav(),
        // (setLanguage == true)
        //     ? MyHomePage(
        //         title: 'HomePage',
        //       )
        //     : TranslationSelection(),
        // home: MyHomePage(title: 'Home Page'),
      ),
    );
  }
}
