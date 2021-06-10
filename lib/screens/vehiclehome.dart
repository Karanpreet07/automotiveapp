import 'package:automotiveapp/screens/MOT.dart';
import 'package:automotiveapp/screens/TAX.dart';
import 'package:automotiveapp/screens/VEHICLE.dart';
import 'package:automotiveapp/screens/myvehicle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class VehicleHome extends StatelessWidget {
  CollectionReference ref = FirebaseFirestore.instance.collection("cars");

  @override
  Widget build(BuildContext context) {
    return Scaffold(extendBodyBehindAppBar: true,

      appBar: AppBar(
          backgroundColor: Colors.transparent,
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
      

      
      body:  StreamBuilder(
        stream: ref.snapshots(),
        builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return 

            Container(

              
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
                      //margin: EdgeInsets.only(top:30.0),
            
            
             child:CarouselSlider.builder(
                options: CarouselOptions(
                    height: 700.0,
                    viewportFraction: 1.0,
                    aspectRatio: 16 / 9,
                    enableInfiniteScroll: false),
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index, realindex) {
                  var doc = snapshot.data.docs[index].data();

                  return Container(
                     
                      margin: EdgeInsets.only(top:80.0),
                       

                      child: Column(
                       

                          // children: <Widget>[
                          //   Stack(
                          children: <Widget>[
                            Expanded(
                                child: GridView.count(
                              padding: EdgeInsets.all(30.0),
                              mainAxisSpacing: 50.0,
                              crossAxisSpacing: 30.0,
                              crossAxisCount: 3,

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
                                      radius: 15.0,
                                      child: Text(
                                        'MOT',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
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
                                              builder: (context) => Tax(
                                                  text: VedExpiryDate,
                                                  text1: VedCurrentlyValid)));
                                    },
                                    child: CircleAvatar(
                                      radius: 15.0,
                                      child: Text(
                                        'TAX',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
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
                                      var  Make = doc['Make'];
                                      var MakeModel =
                                          doc['MakeModel'];
                                          var YearOfManufacture =
                                          doc['YearOfManufacture'];
                                          var Vrm =
                                          doc['Vrm'];
                                          var Colour =
                                          doc['Colour'];
                                          var FuelType =
                                          doc['FuelType'];
                                          var EngineCapacity =
                                          doc['EngineCapacity'];
                                          var Url =
                                          doc['Url'];

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Vehicle(
                                                  text: Make,
                                                  text1: MakeModel,
                                                  text2: YearOfManufacture,
                                                  text3: Vrm, 
                                                  text4: Colour,
                                                  text5: FuelType,
                                                  text6:EngineCapacity,
                                                  text7:Url)));
                                    },
                                    child: CircleAvatar(
                                      radius: 15.0,
                                      child: Text(
                                        'VEHICLE',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
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
                                              builder: (context) => Tax(
                                                  text: VedExpiryDate,
                                                  text1: VedCurrentlyValid)));
                                    },
                                    child: CircleAvatar(
                                      radius: 15.0,
                                      child: Text(
                                        'SERVICE',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
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
                                              builder: (context) => Tax(
                                                  text: VedExpiryDate,
                                                  text1: VedCurrentlyValid)));
                                    },
                                    child: CircleAvatar(
                                      radius: 15.0,
                                      child: Text(
                                        'REPAIRS',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
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
                                              builder: (context) => Tax(
                                                  text: VedExpiryDate,
                                                  text1: VedCurrentlyValid)));
                                    },
                                    child: CircleAvatar(
                                      radius: 15.0,
                                      child: Text(
                                        'INSURANCE',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
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
                            )),
                            Container(
                                alignment: Alignment.center,
                                child: ListTile(
                                    title: Column(
                                      
                                      children: <Widget>[
                                      Text(doc['MakeModel'], textAlign: TextAlign.center, style: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold), )
                                    ]),
                                    subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          //Text(doc['MakeModel']),
                                          Text(doc['Vrm'],style: TextStyle(
    
    fontWeight: FontWeight.bold))
                                        ]))),
                            Container(
                                alignment: Alignment.topCenter,
                                child: Image.network(
                                  doc['Url'],
                                  width: 700,
                                )),
                          ]));
                }));
          } else
            return Text('');
        },
      ),
    );
  }
}
