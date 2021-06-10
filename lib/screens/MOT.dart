//import 'dart:html';

import 'package:flutter/material.dart';

class Mot extends StatelessWidget {
  final String text;
  final bool text1;

  // receive data from the FirstScreen as a parameter
  Mot({Key key, @required this.text, this.text1}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('MOT'),
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black, Colors.red, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Center(
              child: Column(children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
              FlatButton(
                child: Text(
                  'What is an MOT?',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
                textColor: Colors.white,
                onPressed: () {
                  showAlert(context);
                },
              )
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
              FlatButton(
                child: Text(
                  'Your MOT?',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
                textColor: Colors.white,
                onPressed: () {
                  motAlert(context);
                },
              )
            ])
          ]))),
    );
  }

  showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("What is an MOT?"),
          content: Text(
              "The MOT test checks that your vehicle meets road safety and environmental standards. \n \nYou must get an MOT for your vehicle by either: \n \n-The third anniversary of its registration \n\n-The anniversary of its last MOT, if it’s over 3 years old"),
          actions: <Widget>[
            FlatButton(
              child: Text("OK"),
              onPressed: () {
                //Put your code here which you want to execute on Yes button click.
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  motAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Your MOT?"),
          content: Text(
              "Valid MOT: $text1. \n \n MOT expiry date: \n \n $text"),
          actions: <Widget>[
            FlatButton(
              child: Text("OK"),
              onPressed: () {
                //Put your code here which you want to execute on Yes button click.
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
