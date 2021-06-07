import 'dart:convert';

List<VehicleMotTax> vehicleFromJson(String str) => List<VehicleMotTax>.from(
    json.decode(str).map((x) => VehicleMotTax.fromJson(x)));

String vehicleToJson(List<VehicleMotTax> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VehicleMotTax {
  final String NextMotDueDate;
  final String VedExpiryDate;
  final String VehicleHasCurrentMot;
  final String VedCurrentlyValid;

  VehicleMotTax({this.NextMotDueDate, this.VedExpiryDate, this.VehicleHasCurrentMot, this.VedCurrentlyValid});

  factory VehicleMotTax.fromJson(Map<String, dynamic> json) => VehicleMotTax(
      NextMotDueDate: json["NextMotDueDate"],
      VedExpiryDate: json["MotVed"]["VedExpiryDate"],
       VehicleHasCurrentMot: json["VehicleHasCurrentMot"],
      VedCurrentlyValid: json["MotVed"]["VedCurrentlyValid"]);

  Map<String, dynamic> toJson() =>
      {"NextMotDueDate": NextMotDueDate, "VedExpiryDate": VedExpiryDate, "VehicleHasCurrentMot": VehicleHasCurrentMot, "VedCurrentlyValid":VedCurrentlyValid};
}
