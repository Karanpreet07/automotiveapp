import 'package:automotiveapp/screens/vehiclecheck.dart';
import 'package:flutter/material.dart';



class VrmScreen extends StatelessWidget {
  final TextEditingController textFieldController = TextEditingController();
  //String registration = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(child:Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black, Colors.red, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          // child: Padding(
          //     padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
          child: Center(
          
             
              child: Column(children: <Widget>[

                SizedBox(height: 300,),
                Container(alignment: Alignment.topCenter,
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
                Container(alignment: Alignment.topCenter,
                    height: 75,
                    width: 250,
                    padding: EdgeInsets.all(16.0),
                    child: RaisedButton(
                        onPressed: () {
                          _sendDataToSecondScreen(context);
                        },
                        color: Colors.greenAccent[400],
                        textColor: Colors.blue[900],
                        child: Text("NEXT"))),
                
                
              ])),
    )));
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


