//added popup
import 'package:aol_localfeedback/BottomNav.dart';
import 'package:aol_localfeedback/UI/Theme/Theme.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Multilingual/language.dart';
import '../../pageTranslations/feedbackText.dart';

class Feedback extends StatefulWidget {
  @override
  _FeedbackState createState() => _FeedbackState();
}

class _FeedbackState extends State<Feedback> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: Theme.of(context),
        title: "Local Feedback",
        home: Builder(builder: (BuildContext context) => LocalFeedback()));
  }
}

class LocalFeedback extends StatefulWidget {
  @override
  _LocalFeedbackState createState() => _LocalFeedbackState();
}

class _LocalFeedbackState extends State<LocalFeedback> {
  TextEditingController _name = new TextEditingController();
  TextEditingController _contactNumber = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  TextEditingController _feedback = new TextEditingController();
  TextEditingController _suggestions = new TextEditingController();
  TextEditingController _ratings = new TextEditingController();
  TextEditingController _address = new TextEditingController();
  TextEditingController _groundWater1 = new TextEditingController();
  TextEditingController _groundWater2 = new TextEditingController();
  TextEditingController _crop1 = new TextEditingController();

  TextEditingController _crop2 = new TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool feedback;
  SharedPreferences sharedPreferences;
  String language;

  @override
  void initState() {
    super.initState();
    loadTextFields();
  }

  // Language _languageHome;
  loadTextFields() async {
    sharedPreferences = await SharedPreferences.getInstance();
    language = sharedPreferences.getString('language');
    if (language != 'en') {
      for (var i = 0; i < feedbackText.length; i++) {
        await Language(language).getTranslation(feedbackText[i]).then((value) {
          setState(() {
            feedbackText[i] = value;
          });
        });
      }
    }

    // return text1 =
    //     (await _langVar.getTranslation('We serve the society')).toString();
  }

  void submitLocalFeedback() {
    FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
    DatabaseReference databaseReference = firebaseDatabase.reference();

    databaseReference.child("localFeedback").push().set({
      'name': _name.text,
      'contactNumber': _contactNumber.text,
      'email': _email.text,
      'address': _address.text,
      // 'waterexcbef': waterexcbef.text,
      // 'waterexcaft': waterexcaft.text,
      // 'cropprodbef': cropprodbef.text,
      // 'cropprodaft': cropprodaft.text,
      'feedback': _feedback.text,
      'suggestions': _suggestions.text,
      'groundwater level before': _groundWater1.text,
      'groundwater level after': _groundWater2.text,
      'crop production before': _crop1.text,
      'crop production after': _crop2.text,
      'timestamp': new DateFormat.yMd().add_jm().format(new DateTime.now()),
    });
  }

  void clearControllers() {
    _name.clear();
    _contactNumber.clear();
    _email.clear();
    _feedback.clear();
    _suggestions.clear();
    _ratings.clear();
    // waterexcaft.clear();
    // waterexcbef.clear();
    // cropprodaft.clear();
    // cropprodbef.clear();
  }

  Future<void> _showMyDialog() async {
    return await showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: commonBGColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              feedbackText[28],
              style: TextStyle(
                letterSpacing: 2.0,
                fontWeight: FontWeight.normal,
                fontSize: 25,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 2
                  ..color = popupthankutextColor,
                shadows: [
                  Shadow(
                    color: popupthankutextColor,
                    blurRadius: 3.0,
                    offset: Offset(2.0, 2.0),
                  ),
                  Shadow(
                    color: popupthankushadowColor,
                    blurRadius: 4.0,
                    offset: Offset(-4.0, 4.0),
                  ),
                ],
              ),
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              mainAxis: Axis.vertical,
              children: <Widget>[
                Center(
                  child: Text(
                    feedbackText[29],
                    style: TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              // hoverColor: Colors.red[400],
              color: commonBGColor,
              child: Text(
                feedbackText[30],
                style: TextStyle(color: feedbackbuttonColor),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
          // backgroundColor: Colors.white[400],
          elevation: 58.0,
          // shape: CircleBorder(),
        );
      },
    );
  }

  String nameValidator(value) {
    if (value.isEmpty) {
      return feedbackText[16];
    } else
      return null;
  }

  String contactValidator(value) {
    if (value.isEmpty) {
      return feedbackText[17];
    }
    final n = num.tryParse(value);
    if (n == null) {
      return feedbackText[18];
    } else if (n > 9999999999 || n < 1000000000) {
      return feedbackText[18];
    } else
      return null;
  }

  String emailValidator(value) {
    if (value.isEmpty) {
      return feedbackText[19];
    } else if (value.toString().contains('@') &&
        value.toString().contains('.')) {
      return null;
    } else
      return feedbackText[20];
  }

  String addressValidator(value) {
    if (value.isEmpty) {
      return feedbackText[21];
    } else
      return null;
  }

  String feedbackValidator(value) {
    if (value.isEmpty) {
      return feedbackText[22];
    } else
      return null;
  }

  TextFormField fields(
      {String decorationText,
      String labelText,
      TextEditingController controllername,
      Function validateFunction,
      List<TextInputFormatter> numFormatter,
      int maxlines,
      int maxlen,
      TextInputType keyboard,
      String compulsory}) {
    return TextFormField(
      maxLines: maxlines,
      maxLength: maxlen,
      controller: controllername,
      decoration: InputDecoration(
          labelText: labelText + compulsory,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: feedbacktextformfieldColor),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: feedbacktextformfieldColor),
          ),
          hintText: '$decorationText'),
      cursorWidth: 2,
      inputFormatters: numFormatter,
      keyboardType: keyboard,
      validator: validateFunction,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: appbarColor,
          title: Text(feedbackText[8]),
          centerTitle: true,
          leading: GestureDetector(
            child: Icon(Icons.arrow_back),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BottomNav()));
            },
          ),
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(32, 8, 32, 8),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: <Widget>[
                Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        fields(
                            labelText: feedbackText[0],
                            decorationText: feedbackText[10],
                            controllername: _name,
                            validateFunction: nameValidator,
                            compulsory: "*"),
                        SizedBox(
                          height: 20,
                        ),
                        fields(
                          labelText: feedbackText[1],
                          keyboard: TextInputType.number,
                          decorationText: feedbackText[11],
                          controllername: _contactNumber,
                          validateFunction: contactValidator,
                          numFormatter: [
                            WhitelistingTextInputFormatter.digitsOnly
                          ],
                          compulsory: "*",
                          maxlen: 10,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        fields(
                            labelText: feedbackText[2],
                            decorationText: feedbackText[12],
                            controllername: _email,
                            validateFunction: emailValidator,
                            compulsory: "*"),
                        SizedBox(
                          height: 20,
                        ),
                        fields(
                          labelText: feedbackText[3],
                          decorationText: feedbackText[13],
                          controllername: _address,
                          validateFunction: addressValidator,
                          compulsory: "*",
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        fields(
                            labelText: feedbackText[4],
                            decorationText: feedbackText[4],
                            controllername: _groundWater1,
                            maxlen: 150,
                            maxlines: 3,
                            compulsory: ""),
                        SizedBox(
                          height: 20,
                        ),
                        fields(
                            labelText: feedbackText[5],
                            decorationText: feedbackText[5],
                            controllername: _groundWater2,
                            maxlen: 150,
                            maxlines: 3,
                            compulsory: ""),
                        SizedBox(
                          height: 20,
                        ),
                        fields(
                            labelText: feedbackText[6],
                            decorationText: feedbackText[6],
                            controllername: _crop1,
                            maxlen: 150,
                            maxlines: 2,
                            compulsory: ""),
                        SizedBox(
                          height: 20,
                        ),
                        fields(
                            labelText: feedbackText[7],
                            decorationText: feedbackText[7],
                            controllername: _crop2,
                            maxlen: 150,
                            maxlines: 2,
                            compulsory: ""),
                        SizedBox(
                          height: 20,
                        ),
                        fields(
                            labelText: feedbackText[8],
                            decorationText: feedbackText[14],
                            controllername: _feedback,
                            validateFunction: feedbackValidator,
                            maxlen: 300,
                            maxlines: 5,
                            compulsory: "*"),
                        SizedBox(
                          height: 20,
                        ),
                        fields(
                            labelText: feedbackText[9],
                            controllername: _suggestions,
                            decorationText: feedbackText[15],
                            maxlen: 300,
                            maxlines: 5,
                            compulsory: ""),
                        SizedBox(
                          height: 20,
                        ),
                        Builder(
                          builder: (BuildContext context) => Container(
                            child: RaisedButton(
                              elevation: 5,
                              color: feedbackbuttonColor,
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  try {
                                    submitLocalFeedback();
                                    _name.clear();
                                    _contactNumber.clear();
                                    _email.clear();
                                    _feedback.clear();
                                    _suggestions.clear();
                                    _ratings.clear();
                                    _address.clear();
                                    _showMyDialog();
                                    _groundWater1.clear();
                                    _groundWater2.clear();
                                    _crop1.clear();
                                    _crop2.clear();

                                    // Scaffold.of(context).showSnackBar(SnackBar(
                                    //     content: Text("Feedback recorded")));
                                  } catch (error) {
                                    Scaffold.of(context).showSnackBar(SnackBar(
                                        content: Text("Something went wrong")));
                                    return feedbackText[24];
                                  }

                                  // return null;
                                } else {
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text(feedbackText[25]),
                                    duration: Duration(seconds: 1),
                                  ));
                                  return feedbackText[26];
                                }
                              },
                              textColor: Colors.black,
                              padding: const EdgeInsets.all(20.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              child: Container(
                                width: double.infinity,
                                color: feedbackbuttonColor,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color(0xff02b9f3),
                                ),
                                // padding:
                                //     const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                child: Center(
                                  child: Text(
                                    feedbackText[27],
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.italic,
                                        color: commonBGColor),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ));
  }
}
