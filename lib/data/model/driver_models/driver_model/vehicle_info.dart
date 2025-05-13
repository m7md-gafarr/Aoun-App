class VehicleInfo {
  String? vehicleBrand;
  String? vehicleModel;
  String? vehicleColor;
  int? productionYear;
  String? plateNumber;
  int? seatingCapacity;
  String? vehiclePicture;
  String? vehicleRegistrationFront;
  String? vehicleRegistrationBack;
  int? id;

  VehicleInfo({
    this.vehicleBrand,
    this.vehicleModel,
    this.vehicleColor,
    this.productionYear,
    this.plateNumber,
    this.seatingCapacity,
    this.vehiclePicture,
    this.vehicleRegistrationFront,
    this.vehicleRegistrationBack,
    this.id,
  });

  factory VehicleInfo.fromJson(Map<String, dynamic> json) => VehicleInfo(
        vehicleBrand: json['vehicleBrand'] as String?,
        vehicleModel: json['vehicleModel'] as String?,
        vehicleColor: json['vehicleColor'] as String?,
        productionYear: json['productionYear'] as int?,
        plateNumber: json['plateNumber'] as String?,
        seatingCapacity: json['seatingCapacity'] as int?,
        vehiclePicture: json['vehiclePicture'] as String?,
        vehicleRegistrationFront: json['vehicleRegistrationFront'] as String?,
        vehicleRegistrationBack: json['vehicleRegistrationBack'] as String?,
        id: json['id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'vehicleBrand': vehicleBrand,
        'vehicleModel': vehicleModel,
        'vehicleColor': vehicleColor,
        'productionYear': productionYear,
        'plateNumber': plateNumber,
        'seatingCapacity': seatingCapacity,
        'vehiclePicture': vehiclePicture,
        'vehicleRegistrationFront': vehicleRegistrationFront,
        'vehicleRegistrationBack': vehicleRegistrationBack,
        'id': id,
      };
}
