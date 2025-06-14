class VehicleInfo {
  String? vehicleModel;
  int? seatingCapacity;
  String? plateNumber;

  VehicleInfo({this.vehicleModel, this.seatingCapacity, this.plateNumber});

  factory VehicleInfo.fromJson(Map<String, dynamic> json) => VehicleInfo(
        vehicleModel: json['vehicleModel'] as String?,
        seatingCapacity: json['seatingCapacity'] as int?,
        plateNumber: json['plateNumber'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'vehicleModel': vehicleModel,
        'seatingCapacity': seatingCapacity,
        'plateNumber': plateNumber,
      };
}
