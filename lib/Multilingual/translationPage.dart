import 'package:aol_localfeedback/FeedbackPages/Pages/feedback.dart';
import 'package:aol_localfeedback/UI/Theme/Theme.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../BottomNav.dart';
import 'language.dart';

class TranslationSelection extends StatefulWidget {
  @override
  _TranslationSelectionState createState() => _TranslationSelectionState();
}

class _TranslationSelectionState extends State<TranslationSelection> {
  int selected;

  @override
  void initState() {
    selected = 0;
    super.initState();
  }

  setSelectedRadio(int val) {
    setState(() {
      selected = val;
    });
  }

  _showLangDialog() async {
    var setLang = Provider.of<Language>(context);
    return await showDialog<void>(
        barrierColor: commonBGColor,
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
              backgroundColor: commonBGColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Choose your Language',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              content: Container(
                height: 150,
                // color: Colors.blue,
                child: Column(
                  children: [
                    RadioListTile(
                        activeColor: radioselectColor,
                        title: Text("English"),
                        value: 1,
                        groupValue: selected,
                        onChanged: (val) {
                          setSelectedRadio(val);
                        }),
                    RadioListTile(
                        activeColor: radioselectColor,
                        title: Text("Hindi"),
                        value: 2,
                        groupValue: selected,
                        onChanged: (val) {
                          setSelectedRadio(val);
                        }),
                    RadioListTile(
                        activeColor: radioselectColor,
                        title: Text("Marathi"),
                        value: 3,
                        groupValue: selected,
                        onChanged: (val) {
                          setSelectedRadio(val);
                        }),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30, top: 10),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Default Language is English')),
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                Container(
                  // color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: FlatButton(
                            color: commonBGColor,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LocalFeedback()));
                            },
                            child: Text(
                              'Cancel',
                              style: TextStyle(color: feedbackbuttonColor),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                            padding: EdgeInsets.all(10),
                            child: Builder(builder: (BuildContext context) {
                              return FlatButton(
                                splashColor: commonBGColor,
                                onPressed: () async {
                                  SharedPreferences sharedPreferences =
                                      await SharedPreferences.getInstance();
                                  if (selected == 1) {
                                    setState(() {
                                      setLang.setLang('en');
                                      print(setLang.languageSelected);
                                      sharedPreferences.setString(
                                          'language', 'en');
                                    });
                                  } else if (selected == 2) {
                                    setState(() {
                                      setLang.setLang('hi');
                                      print(setLang.languageSelected);
                                      sharedPreferences.setString(
                                          'language', 'hi');
                                    });
                                  } else if (selected == 3) {
                                    setState(() {
                                      setLang.setLang('mr');
                                      print(setLang.languageSelected);
                                      print(setLang.getLang());
                                      sharedPreferences.setString(
                                          'language', 'mr');
                                    });
                                  }
                                  setState(() {
                                    sharedPreferences.setBool(
                                        'setLanguage', true);
                                  });
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              LocalFeedback()));
                                },
                                child: Text(
                                  "Continue",
                                  style: TextStyle(color: feedbackbuttonColor),
                                ),
                                color: commonBGColor,
                              );
                            })),
                      ),
                    ],
                  ),
                ),
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        body: _showLangDialog());
  }
}
