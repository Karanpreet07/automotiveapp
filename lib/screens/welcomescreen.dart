import 'dart:async';

import 'package:automotiveapp/screens/Loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(milliseconds: 2500), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (ctx) => Loginscreen()));
    });

    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blue, Colors.blue[400]],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter),
                image: DecorationImage(
                    image: AssetImage("images/1.png"), fit: BoxFit.cover)),
            child: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                  SizedBox(
                    height: 120,
                  ),
                  Text(
                    '',
                    style: TextStyle(
                        color: Colors.white, fontFamily: 'Camar', fontSize: 30),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 260,
                    child: Image(image: AssetImage("images/2.png")),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Compare, Book, Repair, Save.",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  SizedBox(
                    height: 150,
                  ),
                  LinearPercentIndicator(
                    animation: true,
                    alignment: MainAxisAlignment.center,
                    width: 240.0,
                    lineHeight: 4.0,
                    percent: 1.0,
                    animationDuration: 2250,
                    backgroundColor: Colors.grey,
                    progressColor: Colors.white,
                  ),
                ]))));
  }
}
