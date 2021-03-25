//import 'dart:html';

import 'package:flutter/material.dart';

class Mot extends StatelessWidget {
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
          ]))),
    );
  }
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
