import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void createData(
    {String colour,
    String make,
    String fueltype,
    String vrm,
    String makemodel,
    String yearofmanufacture}) async {
  Firebase.initializeApp();
  CollectionReference cars = FirebaseFirestore.instance.collection("cars");
  //final databaseReference = FirebaseDatabase.instance.reference().child("car");

  // databaseReference.set({
  //   "colour": colour,
  //   "make": make,
  //   "fueltype": fueltype,
  //   "registrationNumber": vrm,
  //   "model": makemodel,
  //   "yearOfManufacture": yearofmanufacture,
  // });
  cars.add({
    "colour": colour,
    "make": make,
    "fueltype": fueltype,
    "registrationNumber": vrm,
    "model": makemodel,
    "yearOfManufacture": yearofmanufacture,
  });
}
