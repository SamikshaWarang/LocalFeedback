import 'package:aol_localfeedback/AboutUsPages/Pages/AboutDevelopers.dart';
import 'package:aol_localfeedback/AboutUsPages/Pages/AboutIAHV.dart';
import 'package:aol_localfeedback/Multilingual/language.dart';
import 'package:aol_localfeedback/UI/Theme/Theme.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:link/link.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../DevelopersText.dart';
import '../../IAHVText.dart';

class DevelopersPage extends StatefulWidget {
  // aboutIAHV({Key key, this.title}) : super(key: key)({this.title});

  @override
  _DevelopersPageState createState() => _DevelopersPageState();
}

class _DevelopersPageState extends State<DevelopersPage> {
  SharedPreferences sharedPreferences;
  String language;
  List<Slide> slides = new List();
  // Language _languageHome;
  void initState() {
    print("in homepage");
    // _languageHome = context.read<Language>();
    super.initState();
    slides.add(
      new Slide(
        centerWidget: Container(
            width: 250.0,
            height: 200.0,
            decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                shape: BoxShape.circle,
                image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/sakeclogo.jpg')))),
        widgetDescription: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              children: [
                Text(
                  DevelopersText[1],
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(height: 25),
                Link(
                  child: Text(
                    DevelopersText[2],
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontSize: 18,
                        color: commonBGColor,
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic),
                  ),
                  url: 'https://www.shahandanchor.com/home/',
                ),
              ],
            ),
          ),
        ),
        backgroundOpacity: 0.7,
        backgroundImage: 'assets/waterimg.jpg',
//        directionColorBegin: Alignment.center,
//        directionColorEnd: Alignment.bottomRight,
//        onCenterItemPress: () {},
      ),
    );
    slides.add(
      new Slide(
          widgetDescription: Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      DevelopersText[3],
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Link(
                      child: Text(
                        DevelopersText[4],
                        style: TextStyle(color: commonBGColor, fontSize: 20),
                        textAlign: TextAlign.justify,
                      ),
                      url: 'https://www.shahandanchor.com/research/',
                    ),
                  ),
                ],
              ),
            ),
          ),
          backgroundImage: 'assets/waterimg.jpg',
          backgroundOpacity: 0.7),
    );
    slides.add(
      new Slide(
          widgetDescription: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    DevelopersText[5],
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    DevelopersText[6],
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    DevelopersText[7],
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 9,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    DevelopersText[8],
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    DevelopersText[9],
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    DevelopersText[10],
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          backgroundImage: 'assets/waterimg.jpg',
          backgroundOpacity: 0.7),
    );
  }

  // loadTextFields() async {
  //   sharedPreferences = await SharedPreferences.getInstance();
  //   language = sharedPreferences.getString('language');
  //   if (language != 'en') {
  //     for (var i = 0; i < IAHVText.length; i++) {
  //       await Language(language).getTranslation(IAHVText[i]).then((value) {
  //         setState(() {
  //           IAHVText[i] = value;
  //         });
  //       });
  //     }
  //   }
  //   // return text1 =
  //   //     (await _langVar.getTranslation('We serve the society')).toString();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroSlider(
        isShowSkipBtn: false,
        isShowPrevBtn: true,
        isShowDoneBtn: true,
        isShowDotIndicator: true,
        isShowNextBtn: true,
        slides: this.slides,
        isScrollable: false,
        colorActiveDot: Colors.white,
        colorDot: Colors.white30,
        renderNextBtn: Icon(Icons.arrow_forward_ios, color: Colors.white),
        renderPrevBtn: Icon(Icons.arrow_back_ios, color: Colors.white),
      ),
    );
  }
}
