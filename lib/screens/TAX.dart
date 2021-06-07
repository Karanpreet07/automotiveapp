//import 'dart:html';

import 'package:flutter/material.dart';

class Tax extends StatelessWidget {
  final String text;
  final String text1; 

  // receive data from the FirstScreen as a parameter
  Tax({Key key, @required this.text, this.text1}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Tax'),
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
                  'What is car Tax?',
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
                  'Your Tax?',
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
          title: Text("What is car tax?"),
          content: Text(
              "You need to pay tax when the vehicle is first registered, this covers the vehicle for 12 months. \n \nYou’ll then pay vehicle tax every 6 or 12 months at a different rate."),
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
          title: Text("Your Tax?"),
          content: Text(
              "Valid tax : $text1. \n \nTax expire by : \n \n $text"),
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
