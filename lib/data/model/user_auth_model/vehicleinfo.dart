class VehicleinfoModel {
  String? vehicleType;
  String? licensePlate;
  int? seatingCapacity;

  VehicleinfoModel({this.vehicleType, this.licensePlate, this.seatingCapacity});

  factory VehicleinfoModel.fromJson(Map<String, dynamic> json) =>
      VehicleinfoModel(
        vehicleType: json['vehicleType'] as String?,
        licensePlate: json['licensePlate'] as String?,
        seatingCapacity: json['seatingCapacity'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'vehicleType': vehicleType,
        'licensePlate': licensePlate,
        'seatingCapacity': seatingCapacity,
      };
}
