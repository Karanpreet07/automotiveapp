import 'dart:ffi';

class Address {
  String placeName;
  String placeId;
  double longitude;
  double latitude;

  Address({this.placeName, this.placeId, this.longitude, this.latitude});

  Address.fromJson(Map<String, dynamic> json) {
    placeName = json["name"];
    placeId = json["place_id"];
    longitude = json["geometry"]["location"]["lat"] as double;
    latitude = json["geometry"]["location"]["lng"]as double;
  }
}
