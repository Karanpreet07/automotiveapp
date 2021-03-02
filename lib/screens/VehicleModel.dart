class VehicleModel {
  final String colour;
  final String fuelType;
  final String registrationNumber;
  final int engineCapacity;
  final int yearOfManufacture;

  final String make;

  VehicleModel(
      {this.colour,
      this.fuelType,
      this.registrationNumber,
      this.engineCapacity,
      this.yearOfManufacture,
      this.make});

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
        colour: json["colour"],
        make: json["make"],
        fuelType: json["fuelType"],
        registrationNumber: json["registrationNumber"],
        engineCapacity: json["engineCapacity"],
        yearOfManufacture: json["yearOfManufacture"]);
  }
}
