import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore _db = FirebaseFirestore.instance;

// //Create
void createData(
    {final String MakeModel,
    final String Colour,
    final String FuelType,
    final String Vrm,
    final String YearOfManufacture,
    final String Make,
    final String Url,
    final String EngineCapacity,
    final String TransmissionType,
    final String NextMotDueDate,
    final String VedExpiryDate,
    final String VehicleHasCurrentMot, 
    final String VedCurrentlyValid
    }) async {
  //Firebase.initializeApp();
  CollectionReference cars = _db.collection("cars");

  cars.add({
    "MakeModel": MakeModel,
    "Colour": Colour,
    "Make": Make,
    "FuelType": FuelType,
    "Vrm": Vrm,
    "YearOfManufacture": YearOfManufacture,
    "Url":Url,
    "EngineCapacity": EngineCapacity,
    "TransmissionType": TransmissionType,
    "NextMotDueDate": NextMotDueDate,
    "VedExpiryDate": VedExpiryDate,
    "VehicleHasCurrentMot": VehicleHasCurrentMot,
    "VedCurrentlyValid": VedCurrentlyValid

  });
}
