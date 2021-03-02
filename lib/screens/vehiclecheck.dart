import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'VehicleModel.dart';

class SecondScreen extends StatelessWidget {
  final String text;

  // receive data from the FirstScreen as a parameter
  SecondScreen({Key key, @required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.black, Colors.red, Colors.white],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
            child: Center(
                child: Column(children: <Widget>[
              SizedBox(
                height: 180,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 40,
                  ),
                  Text(
                    'Is this your vehicle?',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 35),
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              FutureBuilder<VehicleModel>(
                  future: getVehicle(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final vehicle = snapshot.data;

                      return Center(
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white70,
                                    width: 5,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              child: Text(
                                  "Registration: ${vehicle.registrationNumber} \nMake : ${vehicle.make} \nColour : ${vehicle.colour} \nYear: ${vehicle.yearOfManufacture} \nFuel: ${vehicle.fuelType} \nEngine: ${vehicle.engineCapacity}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20))));
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }

                    return CircularProgressIndicator();
                  })
            ]))));
  }

  Future<VehicleModel> getVehicle() async {
    final response = await http.post(
        'https://driver-vehicle-licensing.api.gov.uk/vehicle-enquiry/v1/vehicles',
        headers: {
          'x-api-key': 'gGC5fIY7cy4mMavJ3Pphv1PW6e5RsZJI29OZKpwu',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'registrationNumber': text}));

    if (response.statusCode == 200) {
      final jsonVehicle = jsonDecode(response.body);
      return VehicleModel.fromJson(jsonVehicle);
    } else {
      throw Exception();
    }
  }
}
