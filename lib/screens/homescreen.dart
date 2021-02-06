


import 'package:flutter/material.dart';

import 'package:automotiveapp/screens/MOT.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView(children: <Widget>[
        _top(),
        SizedBox(height: 20.0),
        Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Category",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
                ),
              ],
            )),
        SizedBox(height: 20.0),
        Container(
            height: 400.0,
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 3 / 2),
              children: <Widget>[
                
                _gridItem(Icons.car_repair, context),
                _gridItem(Icons.car_repair, context),
                _gridItem(Icons.car_repair, context),
                _gridItem(Icons.car_repair, context),
                _gridItem(Icons.car_repair, context),
                _gridItem(Icons.car_repair, context),
                _gridItem(Icons.car_repair, context),
                _gridItem(Icons.car_repair, context)
              ],
            ))
      ]),
    );
  }
}

_gridItem(icon, BuildContext context){
  return Column(
    children: [
 
   GestureDetector(
                onTap: () {
                 Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => Mot()));
                },
            child:CircleAvatar(
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

_top() {
  return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        
          color: Colors.deepOrange,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0))),
      child: Row(mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
        SizedBox(height: 30.0),
        Container(
          height: 50, 
          width: 225,
        child:TextField(style: TextStyle(fontSize: 20),
            decoration: InputDecoration(
                hintText: "Enter Your Reg", 
                hintStyle: TextStyle(fontSize: 20.0),
                fillColor: Colors.white,
                filled: true,
                
               
                
                prefixIcon: ImageIcon(AssetImage('images/7.png'), color: Color(0xFF3A5A98),),
                
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(color: Colors.transparent)),
                contentPadding:
                    (EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0)))))
, Container(
  padding:EdgeInsets.all(16.0),
  child:RaisedButton(onPressed: (){},
  color: Colors.greenAccent[400],
  textColor: Colors.blue[900],
  child:Text("GET QUOTES"))
)
                
      ]));
}
