import 'package:aol_localfeedback/UI/Theme/Theme.dart';
import 'package:aol_localfeedback/UI/constants.dart';
import 'package:flutter/material.dart';

class Item1 extends StatelessWidget {
  const Item1({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Overlay(
        initialEntries: [
          OverlayEntry(builder: (BuildContext context) {
            return Stack(
              children: [
                Container(
                  decoration: slider1,
                ),
                Center(
                    child: Text(
                  'Hello',
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold,color: corouseltextColor),
                ))
              ],
            );
          })
        ],
      ),
    );
  }
}

class Item2 extends StatelessWidget {
  const Item2({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Overlay(
        initialEntries: [
          OverlayEntry(builder: (BuildContext context) {
            return Stack(
              children: [
                Container(
                  decoration: slider2,
                ),
                Center(
                    child: Text(
                  'Welcome ',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,color: corouseltextColor),
                ))
              ],
            );
          })
        ],
      ),
    );
  }
}




