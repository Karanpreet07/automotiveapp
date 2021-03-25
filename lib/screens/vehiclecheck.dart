import 'package:flutter/material.dart';
import '../database.dart';
import 'VehicleImageModel.dart';
import 'VehicleModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class SecondScreen extends StatelessWidget {
  final String text;

  // receive data from the FirstScreen as a parameter
  SecondScreen({Key key, @required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(color: Colors.white
                // gradient: LinearGradient(
                //     colors: [Colors.black, Colors.red, Colors.white],
                //     begin: Alignment.topCenter,
                //     end: Alignment.bottomCenter)

                ),
            child: Center(
                child: Column(children: <Widget>[
              SizedBox(
                height: 80,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 40,
                  ),
                  Text(
                    'Is this your vehicle?',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 35),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              FutureBuilder<VehicleImageModel>(
                  future: getImage(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      // return Center(child: Text("DATA: ${snapshot.data}"));
                      final vehicleImage = snapshot.data;

                      return Center(
                        child: Image.network(
                          vehicleImage.ImageUrl, width: 500,
                          //scale: 4,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }

                    return CircularProgressIndicator();
                  }),
              SizedBox(
                height: 50,
              ),
              FutureBuilder<VehicleModel>(
                  future: getVehicle(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      // return Center(child: Text("DATA: ${snapshot.data}"));
                      final vehicle = snapshot.data;

                      return Center(
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 5,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              child: Text(
                                  "Registration: ${vehicle.Vrm} \nMake : ${vehicle.Make} \nModel: ${vehicle.MakeModel} \nYear: ${vehicle.YearOfManufacture} \nColour : ${vehicle.Colour}  \nFuel: ${vehicle.FuelType}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20))));
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }

                    return CircularProgressIndicator();
                  }),
              SizedBox(
                height: 20,
              ),
              FutureBuilder<VehicleModel>(
                  future: getVehicle(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final vehicle = snapshot.data;

                      return Center(
                          child: Container(
                              height: 75,
                              width: 250,
                              padding: EdgeInsets.all(16.0),
                              child: RaisedButton(
                                  onPressed: () {
                                    createData(
                                        vrm: vehicle.Vrm,
                                        make: vehicle.Make,
                                        makemodel: vehicle.MakeModel,
                                        yearofmanufacture:
                                            vehicle.YearOfManufacture,
                                        colour: vehicle.Colour,
                                        fueltype: vehicle.FuelType);
                                  },
                                  color: Colors.greenAccent[400],
                                  textColor: Colors.blue[900],
                                  child: Text("YES?"))));
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }

                    return CircularProgressIndicator();
                  }),
              Center(
                  child: Container(
                      height: 75,
                      width: 250,
                      padding: EdgeInsets.all(16.0),
                      child: RaisedButton(
                          onPressed: () {},
                          color: Colors.greenAccent[400],
                          textColor: Colors.blue[900],
                          child: Text("NO?"))))
            ]))));
  }

  Future<VehicleImageModel> getImage() async {
    var queryParameters = {
      "v": "2",
      "api_nullitems": "1",
      "auth_apikey": 'f538a039-52b5-48fd-adb2-94dfb69b307d',
      'key_VRM': text,
    };

    var uri = Uri.https("uk1.ukvehicledata.co.uk",
        "api/datapackage/VehicleImageData", queryParameters);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final jsonVehicle = jsonDecode(response.body);

      return VehicleImageModel.fromJson(jsonVehicle["Response"]["DataItems"]
          ["VehicleImages"]["ImageDetailsList"][0]);
    } else {
      throw Exception();
    }
  }

  Future<VehicleModel> getVehicle() async {
    var queryParameters = {
      "v": "2",
      "api_nullitems": "1",
      "auth_apikey": 'f538a039-52b5-48fd-adb2-94dfb69b307d',
      'key_VRM': text,
    };

    var uri = Uri.https("uk1.ukvehicledata.co.uk",
        "api/datapackage/VehicleData", queryParameters);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final jsonVehicle = jsonDecode(response.body);

      return VehicleModel.fromJson(
          jsonVehicle["Response"]["DataItems"]["VehicleRegistration"]);
    } else {
      throw Exception();
    }
  }
}
