//import 'dart:html';

import 'package:flutter/material.dart';

class Vehicle extends StatelessWidget {
  final String text;
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String text5;
  final String text6;
  final String text7;
  


  // receive data from the FirstScreen as a parameter
  Vehicle({Key key, @required this.text, this.text1, this.text2, this.text3, this.text4, this.text5, this.text6, this.text7}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('My Vehicle'),
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
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: [
                          0.1,
                          0.4,
                          0.6,
                          0.9,
                        ],
                        colors: [
                          Colors.black,
                          Colors.red,
                          Colors.white,
                          Colors.white,
                        ],
                      )),

  child: Container(
                     
                      margin: EdgeInsets.only(top:80.0),
                       

                      child: Column(
                       

                          // children: <Widget>[
                          //   Stack(
                          children: <Widget>[

             Center(
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 5,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              child: Text(
                                  "Registration: $text3 \nMake : $text2 \nModel: $text1 \nYear: $text2 \nColour : $text4  \nFuel: $text5 \nEngine: $text6",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)))),

                                  SizedBox(height: 250,) ,   
       Container(
                                alignment: Alignment.topCenter,
                                child: Image.network(
                                  text7,
                                  width: 700,
                                )),
                          ]))));
    
  }
}
