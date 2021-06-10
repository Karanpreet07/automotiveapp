import 'package:automotiveapp/models/VehicleMotTax.dart';
import 'package:automotiveapp/screens/vehiclehome.dart';
import 'package:flutter/material.dart';
import '../services/database.dart';
import '../models/VehicleImageModel.dart';
import '../models/VehicleModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


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
                          vehicleImage.ImageUrl, width: 500, height: 200,
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
              FutureBuilder(
                  future: Future.wait([getVehicle(), getImage(), getMotTax()]),
                  builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                    if (snapshot.hasData) {
                      final vehicle = snapshot.data[0];
                      final vehicleImage = snapshot.data[1];
                      final VehicleMotTax = snapshot.data[2];

                      return Center(
                          child: Container(
                              height: 75,
                              width: 250,
                              padding: EdgeInsets.all(16.0),
                              child: RaisedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (ctx) => VehicleHome()));
                                    // Navigator.of(context);

                                    createData(
                                        Vrm: vehicle.Vrm,
                                        Make: vehicle.Make,
                                        MakeModel: vehicle.MakeModel,
                                        YearOfManufacture:
                                            vehicle.YearOfManufacture,
                                        Colour: vehicle.Colour,
                                        FuelType: vehicle.FuelType,
                                        Url: vehicleImage.ImageUrl,
                                    NextMotDueDate: VehicleMotTax.NextMotDueDate,
                                    VedExpiryDate:VehicleMotTax.VedExpiryDate,
                                    VedCurrentlyValid: VehicleMotTax.VedCurrentlyValid,
                                    VehicleHasCurrentMot: VehicleMotTax.VehicleHasCurrentMot
                                    );
                                  },
                                  color: Colors.greenAccent[400],
                                  textColor: Colors.blue[900],
                                  child: Text("LETS GO"))));
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }

                    return CircularProgressIndicator();
                  })
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

  Future<VehicleMotTax> getMotTax() async {
    var queryParameters = {
      "v": "2",
      "api_nullitems": "1",
      "auth_apikey": 'f538a039-52b5-48fd-adb2-94dfb69b307d',
      'key_VRM': text,
    };

    var uri = Uri.https("uk1.ukvehicledata.co.uk",
        "api/datapackage/MotHistoryAndTaxStatusData", queryParameters);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final jsonVehicle = jsonDecode(response.body);

      return VehicleMotTax.fromJson(
          jsonVehicle["Response"]["DataItems"]["VehicleStatus"]);
    } else {
      throw Exception();
    }
  }
}
