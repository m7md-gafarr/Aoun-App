class VehicleInfoJson {
  String? vehicleBrand;
  String? vehicleModel;
  String? vehicleColor;
  int? productionYear;
  String? plateNumber;
  int? seatingCapacity;

  VehicleInfoJson({
    this.vehicleBrand,
    this.vehicleModel,
    this.vehicleColor,
    this.productionYear,
    this.plateNumber,
    this.seatingCapacity,
  });

  factory VehicleInfoJson.fromJson(Map<String, dynamic> json) {
    return VehicleInfoJson(
      vehicleBrand: json['VehicleBrand'] as String?,
      vehicleModel: json['VehicleModel'] as String?,
      vehicleColor: json['VehicleColor'] as String?,
      productionYear: json['ProductionYear'] as int?,
      plateNumber: json['PlateNumber'] as String?,
      seatingCapacity: json['SeatingCapacity'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'VehicleBrand': vehicleBrand,
        'VehicleModel': vehicleModel,
        'VehicleColor': vehicleColor,
        'ProductionYear': productionYear,
        'PlateNumber': plateNumber,
        'SeatingCapacity': seatingCapacity,
      };
}
