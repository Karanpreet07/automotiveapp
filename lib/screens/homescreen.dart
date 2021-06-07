import 'package:automotiveapp/screens/VRM_Screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController textFieldController = TextEditingController();
  //String registration = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('My Local Mechanic'),
          centerTitle: true,
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
            ),
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
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Image.asset(
                      'images/genric_car.png',
                    ),
                    RaisedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (ctx) => VrmScreen()));
                        },
                        color: Colors.greenAccent[400],
                        textColor: Colors.blue[900],
                        child: Text("ADD A NEW VEHICLE")),
                  ]),
            ]))));
  }
}
