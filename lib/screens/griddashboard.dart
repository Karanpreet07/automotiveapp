import 'package:flutter/material.dart';

class GridDashboard extends StatelessWidget {
  Items item1 = new Items(
    title: "MOT", 
    img: "images/4.png");

     Items item2 = new Items(
    title: "Servicing", 
    img: "images/5.png");

     Items item3 = new Items(
    title: "Repairs", 
    img: "images/6.png");

     Items item4 = new Items(
    title: "Servicing", 
    img: "images/5.png");
  @override
  Widget build(BuildContext context) {
    List<Items>myList=[item1, item2, item3, item4];
    return Flexible(
child: GridView.count(
  childAspectRatio: 1.0, padding: EdgeInsets.only(left: 16, right:16),
  crossAxisCount: 2, 
  crossAxisSpacing: 18,
  mainAxisSpacing: 18,
  children: myList.map((data){
    return Container(
      decoration: BoxDecoration(color: Colors.lightBlue, borderRadius: BorderRadius.circular(10) ),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(data.img, width: 60), 
          SizedBox(height:14),
          Text(data.title, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)) 
        ]
      )
    );


  }).toList(),
  )
    );
  }
}

class Items {
  String title;
  String img;
  Items({this.title, this.img});
}
