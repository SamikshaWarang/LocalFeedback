import 'package:aol_localfeedback/AboutUsPages/AboutUs/HomeScreen.dart';
import 'package:flutter/material.dart';
import '../../BottomNav.dart';
import '../../RazorPay/ApiRazorPay.dart';
import '../../FeedbackPages/Pages/feedback.dart';
import '../../Multilingual/translationPage.dart';

Drawer myDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Column(
            children: [
              Text(
                'WELCOME',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'dummy@gmail.com',
                style: TextStyle(fontWeight: FontWeight.normal),
              ),
            ],
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [const Color(0xff0094ff), const Color(0xff00ccff)],
            ),
          ),
        ),
        ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => BottomNav()));
            }),
        ListTile(
            title: Text('About Us'),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            }),
        ListTile(
          title: Text('Login'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        // ListTile(
        //     title: Text('Project'),
        //     onTap: () {
        //       Navigator.push(context,
        //           MaterialPageRoute(builder: (context) => ProjectPage()));
        //     }),
        ListTile(
          title: Text('Donation'),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ApiRazorPay()));
          },
        ),
        ListTile(
            title: Text('Feedback'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LocalFeedback()));
            }

            // Navigator.pop(context);

            ),
        ListTile(
            title: Text('Change Language'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TranslationSelection()));
            }

            // Navigator.pop(context);

            ),
      ],
    ),
  );
}
