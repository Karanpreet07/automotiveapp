import 'package:automotiveapp/screens/vehiclecheck.dart';
import 'package:flutter/material.dart';

import 'MOT.dart';

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
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
                child: Column(children: <Widget>[
                  Container(
                      height: 50,
                      width: 300,
                      child: TextField(
                          controller: textFieldController,
                          style: TextStyle(fontSize: 20),
                          decoration: InputDecoration(
                            hintText: "Enter Your Reg",
                            hintStyle: TextStyle(fontSize: 20.0),
                            fillColor: Colors.white,
                            filled: true,
                          ))),
                  Container(
                      height: 75,
                      width: 250,
                      padding: EdgeInsets.all(16.0),
                      child: RaisedButton(
                          onPressed: () {
                            _sendDataToSecondScreen(context);
                          },
                          color: Colors.greenAccent[400],
                          textColor: Colors.blue[900],
                          child: Text("GET QUOTES"))),
                  Expanded(
                      child: GridView.count(
                    crossAxisCount: 2,
                    children: [
                      _gridItem(Icons.car_repair, context),
                      _gridItem(Icons.car_repair, context),
                      _gridItem(Icons.car_repair, context),
                      _gridItem(Icons.car_repair, context),
                      _gridItem(Icons.car_repair, context),
                      _gridItem(Icons.car_repair, context)
                    ],
                  ))
                ]))),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          unselectedItemColor: Colors.black,
          selectedItemColor: Color(0xFFfc6a26),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.car_rental),
              title: Text("Vehicle"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              title: Text("Map"),
            ),
          ],
        ));
  }

  // get the text in the TextField and start the Second Screen
  void _sendDataToSecondScreen(BuildContext context) {
    String textToSend = textFieldController.text;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondScreen(
            text: textToSend,
          ),
        ));
  }
}

_gridItem(icon, BuildContext context) {
  return Column(children: [
    SizedBox(
      height: 20,
    ),
    GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (ctx) => Mot()));
        },
        child: CircleAvatar(
          radius: 50,
          child: Icon(
            icon,
            size: 50.0,
            color: Colors.white,
          ),
          backgroundColor: Colors.deepOrange.withOpacity(0.9),
        )),
    SizedBox(height: 10.0),
    Text(
      "hello",
      style: TextStyle(fontSize: 12.0),
    )
  ]);
}
