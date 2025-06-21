import 'vehicle_info.dart';

class DriverInfo {
  String? driverName;
  String? driverPhone;
  String? personalPhotoPath;
  VehicleInfo? vehicleInfo;

  DriverInfo(
      {this.driverName,
      this.driverPhone,
      this.vehicleInfo,
      this.personalPhotoPath});

  factory DriverInfo.fromJson(Map<String, dynamic> json) => DriverInfo(
        driverName: json['driverName'] as String?,
        driverPhone: json['driverPhone'] as String?,
        vehicleInfo: json['vehicleInfo'] == null
            ? null
            : VehicleInfo.fromJson(json['vehicleInfo'] as Map<String, dynamic>),
        personalPhotoPath: json['personalPhotoPath'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'driverName': driverName,
        'driverPhone': driverPhone,
        'vehicleInfo': vehicleInfo?.toJson(),
        'personalPhotoPath': personalPhotoPath,
      };
}
