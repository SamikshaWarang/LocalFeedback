import 'package:aol_localfeedback/UI/Theme/Theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

var card1text = "Gallery";
var card2text = "Heat Map";
var card3text = "Feedback";
var card4text1 = "Charity LeaderBoard";
var card4text2 = "LeaderBoard";
var aboutuscardtext = "About Us";

var textAlign = TextAlign.justify;
var style =
    TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18);
double iconsize = 60;
double cardElevation = 10;
double containerheight = 70;
double containerwidth = 70;

card1() {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    color: feedbackbuttonColor, // check UI/THEME
    elevation: cardElevation,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 100,
          padding: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: commonBGColor,
          ),
          child: Center(
              child: FaIcon(
            FontAwesomeIcons.images,
            size: 50,
          )),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Text(
            card1text,
            style: style,
            textAlign: textAlign,
          ),
        ),
      ],
    ),
  );
}

card2() {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    color: feedbackbuttonColor, // check UI/THEME
    elevation: cardElevation,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 100,
          padding: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: iconColor,
          ),
          child: Center(
              child: FaIcon(
            FontAwesomeIcons.map,
            size: 50,
          )),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Text(
            card2text,
            style: style,
            textAlign: textAlign,
          ),
        ),
      ],
    ),
  );
}

card3() {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    color: feedbackbuttonColor, // check UI/THEME
    elevation: cardElevation,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 100,
          padding: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: commonBGColor,
          ),
          child: Center(
              child: FaIcon(
            FontAwesomeIcons.solidStar,
            size: 50,
            // color: commonBGColor,
          )),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Text(
            card3text,
            style: style,
            textAlign: textAlign,
          ),
        ),
      ],
    ),
  );
}

card4() {
  return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: feedbackbuttonColor, // check UI/THEME
      elevation: cardElevation,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              padding: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: commonBGColor,
              ),
              child: Center(
                  child: FaIcon(
                FontAwesomeIcons.chartLine,
                size: 50,
              )),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              child: Text(
                card4text1,
                style: style,
                textAlign: textAlign,
              ),
            ),
          ]));
}

aboutuscard() {
  return Card(
    color: cardColor,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
    elevation: cardElevation,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
            child: FaIcon(
          FontAwesomeIcons.infoCircle,
          size: 20,
        )),
        SizedBox(
          width: 20,
        ),
        Center(
          child: Text(aboutuscardtext,
              textAlign: textAlign,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
        ),
      ],
    ),
  );
}
