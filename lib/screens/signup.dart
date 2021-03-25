import 'package:automotiveapp/screens/homedummy.dart';
import 'package:automotiveapp/screens/welcomescreen.dart';
import 'package:flutter/material.dart';
import 'package:automotiveapp/screens/Loginscreen.dart';
import 'package:automotiveapp/screens/homescreen.dart';

class Signupscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.black, Colors.red, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 40,
                  ),
                  Text(
                    "Create Account",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 35),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              CustomTextField(
                hint: 'First name',
                secured: false,
              ),
              SizedBox(height: 15),
              CustomTextField(
                hint: 'Last name',
                secured: false,
              ),
              SizedBox(height: 15),
              CustomTextField(
                hint: 'E-mail address',
                secured: false,
              ),
              SizedBox(height: 15),
              CustomTextField(
                hint: 'Phone number',
                secured: false,
              ),
              SizedBox(height: 15),
              CustomTextField(
                hint: 'Create Password',
                secured: true,
              ),
              SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                child: ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width,
                  height: 55,
                  child: RaisedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => CustomDialog(
                                title: "Success",
                                description:
                                    "Your account has been created successfully."));
                      },
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      child: Text(
                        "Create Account",
                        style: TextStyle(color: Colors.blueGrey, fontSize: 22),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Image image;
  CustomDialog({this.title, this.description, this.buttonText, this.image});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        padding: EdgeInsets.only(top: 100, bottom: 16, left: 16, right: 16),
        margin: EdgeInsets.only(top: 16),
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(17),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              )
            ]),
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Text(title,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
              )),
          SizedBox(
            height: 16.0,
          ),
          Text(
            description,
            style: TextStyle(fontSize: 16.0),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24.0),
          Align(
              alignment: Alignment.bottomRight,
              child: RaisedButton(
                child: Text("Start Exploring ➔"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => HomeDummy()));
                },
              ))
        ]),
      ),
      Positioned(
        top: 0,
        left: 16,
        right: 16,
        child: CircleAvatar(
            backgroundColor: Colors.blueAccent,
            radius: 45,
            backgroundImage: AssetImage('images/3.gif')),
      )
    ]);
  }
}
