import 'dart:convert';

List<VehicleModel> vehicleFromJson(String str) => List<VehicleModel>.from(
    json.decode(str).map((x) => VehicleModel.fromJson(x)));

String vehicleToJson(List<VehicleModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VehicleModel {
  final String MakeModel;
  final String Colour;
  final String FuelType;
  final String Vrm;
  final String EngineCapacity;

  final String YearOfManufacture;
  final String Make;
  final String TransmissionType;

  VehicleModel(
      {this.MakeModel,
      this.Colour,
      this.FuelType,
      this.Vrm,
      this.YearOfManufacture,
      this.Make,
      this.TransmissionType,
      this.EngineCapacity});

  factory VehicleModel.fromJson(Map<String, dynamic> json) => VehicleModel(
      MakeModel: json["MakeModel"],
      Colour: json["Colour"],
      Make: json["Make"],
      FuelType: json["FuelType"],
      Vrm: json["Vrm"],
      YearOfManufacture: json["YearOfManufacture"],
      TransmissionType: json["TransmissionType"],
      EngineCapacity: json["EngineCapacity"]);

  Map<String, dynamic> toJson() => {
        "MakeModel": MakeModel,
        "Colour": Colour,
        "Make": Make,
        "FuelType": FuelType,
        "Vrm": Vrm,
        "YearOfManufacture": YearOfManufacture,
        "TransmissionType": TransmissionType,
        "EngineCapacity":EngineCapacity
      };

  Map<String, dynamic> toMap() {
    return {
      "MakeModel": MakeModel,
      "Colour": Colour,
      "Make": Make,
      "FuelType": FuelType,
      "Vrm": Vrm,
      "YearOfManufacture": YearOfManufacture,
      "EngineCapacity":EngineCapacity
    };
  }
}
