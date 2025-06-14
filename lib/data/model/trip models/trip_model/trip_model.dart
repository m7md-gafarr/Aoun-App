import 'package:aoun_app/data/model/trip%20models/trip_location_model.dart';

import 'additional_info.dart';
import 'basic_info.dart';
import 'driver_info.dart';

class TripModel {
  int? id;
  TripLocationModel? fromLocation;
  TripLocationModel? toLocation;
  BasicInfo? basicInfo;
  DriverInfo? driverInfo;
  AdditionalInfo? additionalInfo;
  double? pricePerSeat;
  DateTime? createdAt;
  int? status;

  TripModel({
    this.id,
    this.fromLocation,
    this.toLocation,
    this.basicInfo,
    this.driverInfo,
    this.additionalInfo,
    this.pricePerSeat,
    this.createdAt,
    this.status,
  });

  factory TripModel.fromJson(Map<String, dynamic> json) => TripModel(
        id: json['id'] as int?,
        fromLocation: json['fromLocation'] == null
            ? null
            : TripLocationModel.fromJson(
                json['fromLocation'] as Map<String, dynamic>),
        toLocation: json['toLocation'] == null
            ? null
            : TripLocationModel.fromJson(
                json['toLocation'] as Map<String, dynamic>),
        basicInfo: json['basicInfo'] == null
            ? null
            : BasicInfo.fromJson(json['basicInfo'] as Map<String, dynamic>),
        driverInfo: json['driverInfo'] == null
            ? null
            : DriverInfo.fromJson(json['driverInfo'] as Map<String, dynamic>),
        additionalInfo: json['additionalInfo'] == null
            ? null
            : AdditionalInfo.fromJson(
                json['additionalInfo'] as Map<String, dynamic>),
        pricePerSeat: json['pricePerSeat'] as double?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        status: json['status'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'fromLocation': fromLocation?.toJson(),
        'toLocation': toLocation?.toJson(),
        'basicInfo': basicInfo?.toJson(),
        'driverInfo': driverInfo?.toJson(),
        'additionalInfo': additionalInfo?.toJson(),
        'pricePerSeat': pricePerSeat,
        'createdAt': createdAt?.toIso8601String(),
        'status': status,
      };
}
