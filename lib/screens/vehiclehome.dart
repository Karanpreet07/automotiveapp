import 'package:automotiveapp/screens/MOT.dart';
import 'package:automotiveapp/screens/TAX.dart';
import 'package:automotiveapp/screens/myvehicle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class VehicleHome extends StatelessWidget {
  CollectionReference ref = FirebaseFirestore.instance.collection("cars");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: ref.snapshots(),
        builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return CarouselSlider.builder(
                options: CarouselOptions(
                    height: 700.0,
                    viewportFraction: 1.0,
                    aspectRatio: 16 / 9,
                    enableInfiniteScroll: false),
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index, realindex) {
                  var doc = snapshot.data.docs[index].data();
                  return Container(
                      margin: EdgeInsets.only(top: 40.0),
                      color: Colors.red,
                      child: Column(
                          // children: <Widget>[
                          //   Stack(
                          children: <Widget>[
                            Container(
                                alignment: Alignment.topCenter,
                                child: Image.network(
                                  doc['Url'],
                                  width: 700,
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                                alignment: Alignment.center,
                                child: ListTile(
                                    title: Column(
                                        children: <Widget>[Text(doc['Make'])]),
                                    subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(doc['MakeModel']),
                                          Text(doc['Vrm'])
                                        ]))),
                            Expanded(
                                child: GridView.count(
                              crossAxisCount: 2,
                              children: <Widget>[
                                GestureDetector(
                                    onTap: () {
                                      var NextMotDueDate =
                                          doc['NextMotDueDate'];
                                      var VehicleHasCurrentMot =
                                          doc['VehicleHasCurrentMot'];

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Mot(
                                                  text: NextMotDueDate,
                                                  text1:
                                                      VehicleHasCurrentMot)));
                                    },
                                    child: CircleAvatar(
                                      radius: 50,
                                      child: Text(
                                        'MOT',
                                        style: TextStyle(
                                            fontSize: 25, color: Colors.white),
                                      ),
                                      //  Icon(
                                      //   Icons.car_repair,
                                      //   size: 50.0,
                                      //   color: Colors.white,
                                      // ),
                                      backgroundColor:
                                          Colors.deepOrange.withOpacity(0.9),
                                    )),
                                GestureDetector(
                                    onTap: () {
                                      var VedExpiryDate = doc['VedExpiryDate'];
                                      var VedCurrentlyValid =
                                          doc['VedCurrentlyValid'];

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Tax(text: VedExpiryDate, text1: VedCurrentlyValid)));
                                    },
                                    child: CircleAvatar(
                                      radius: 50,
                                      child: Text(
                                        'TAX',
                                        style: TextStyle(
                                            fontSize: 25, color: Colors.white),
                                      ),
                                      //  Icon(
                                      //   Icons.car_repair,
                                      //   size: 50.0,

                                      //   color: Colors.white,
                                      // ),
                                      backgroundColor:
                                          Colors.deepOrange.withOpacity(0.9),
                                    ))
                              ],
                            ))
                          ]));
                });
          } else
            return Text('');
        },
      ),
    );
  }
}
