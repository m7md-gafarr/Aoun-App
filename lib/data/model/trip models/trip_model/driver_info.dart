import 'vehicle_info.dart';

class DriverInfo {
  String? driverName;
  String? driverPhone;
  VehicleInfo? vehicleInfo;

  DriverInfo({this.driverName, this.driverPhone, this.vehicleInfo});

  factory DriverInfo.fromJson(Map<String, dynamic> json) => DriverInfo(
        driverName: json['driverName'] as String?,
        driverPhone: json['driverPhone'] as String?,
        vehicleInfo: json['vehicleInfo'] == null
            ? null
            : VehicleInfo.fromJson(json['vehicleInfo'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'driverName': driverName,
        'driverPhone': driverPhone,
        'vehicleInfo': vehicleInfo?.toJson(),
      };
}
