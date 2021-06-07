import 'dart:convert';

List<VehicleImageModel> vehicleFromJson(String str) =>
    List<VehicleImageModel>.from(
        json.decode(str).map((x) => VehicleImageModel.fromJson(x)));

String vehicleToJson(List<VehicleImageModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VehicleImageModel {
  final String ImageUrl;

  VehicleImageModel({this.ImageUrl});

  factory VehicleImageModel.fromJson(Map<String, dynamic> json) =>
      VehicleImageModel(
        ImageUrl: json["ImageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "ImageUrl": ImageUrl,
      };
}
