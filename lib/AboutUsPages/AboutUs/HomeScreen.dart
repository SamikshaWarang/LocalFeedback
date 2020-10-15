import 'package:aol_localfeedback/AboutUsPages/Pages/AboutAolMain.dart';
import 'package:aol_localfeedback/AboutUsPages/Pages/AboutIAHVMain.dart';
import 'package:aol_localfeedback/AboutUsPages/Pages/MainAboutDevelopers.dart';
import 'package:aol_localfeedback/UI/Theme/Theme.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import '../Pages/AboutDevelopers.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  State createState() => new HomeWidgetState();
}

class HomeWidgetState extends State with SingleTickerProviderStateMixin {
  final List tabs = [
    new Tab(
      text: "About AOL",
    ),
    new Tab(
      text: "About IAHV",
    ),
    new Tab(
      text: "About Developers",
    )
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: tabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: commonBGColor,
      appBar: AppBar(
        title: Text('ABOUT US',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
            textAlign: TextAlign.center),
        centerTitle: true,
        backgroundColor: appbarColor,
        bottom: TabBar(
          unselectedLabelColor: bubbleindicatorColor,
          indicator: new BubbleTabIndicator(
            indicatorHeight: 30.0,
            indicatorColor: bubbleindicatorColor,
            tabBarIndicatorSize: TabBarIndicatorSize.tab,
          ),
          // indicatorColor: Colors.blueAccent,
          tabs: tabs,
          controller: _tabController,
        ),
      ),
      body: new TabBarView(controller: _tabController, children: [
        MainAOLPage(),
        MainIAHVPage(),
        MainDevelopersPage(),
      ]),
    );
  }
}
