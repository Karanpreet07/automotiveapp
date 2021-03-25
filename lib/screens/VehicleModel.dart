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

  final String YearOfManufacture;
  final String Make;

  VehicleModel(
      {this.MakeModel,
      this.Colour,
      this.FuelType,
      this.Vrm,
      this.YearOfManufacture,
      this.Make});

  factory VehicleModel.fromJson(Map<String, dynamic> json) => VehicleModel(
        MakeModel: json["MakeModel"],
        Colour: json["Colour"],
        Make: json["Make"],
        FuelType: json["FuelType"],
        Vrm: json["Vrm"],
        YearOfManufacture: json["YearOfManufacture"],
      );

  Map<String, dynamic> toJson() => {
        "MakeModel": MakeModel,
        "Colour": Colour,
        "Make": Make,
        "FuelType": FuelType,
        "Vrm": Vrm,
        "YearOfManufacture": YearOfManufacture,
      };
}
