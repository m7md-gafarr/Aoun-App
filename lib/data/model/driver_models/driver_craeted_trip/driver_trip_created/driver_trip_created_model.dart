import 'package:aoun_app/data/model/driver_models/driver_craeted_trip/driver_trip_created/booking.dart';
import 'package:aoun_app/data/model/trip_models/trip_location_model.dart';

import 'additional_info.dart';
import 'basic_info.dart';
import 'driver_info.dart';

class DriverTripCreatedModel {
  int? id;

  TripLocationModel? fromLocation;
  TripLocationModel? toLocation;
  BasicInfo? basicInfo;
  DriverInfo? driverInfo;
  AdditionalInfo? additionalInfo;
  double? pricePerSeat;
  DateTime? createdAt;
  int? status;
  List<BookingModel>? bookings;

  DriverTripCreatedModel({
    this.id,
    this.fromLocation,
    this.toLocation,
    this.basicInfo,
    this.driverInfo,
    this.additionalInfo,
    this.pricePerSeat,
    this.createdAt,
    this.status,
    this.bookings,
  });

  factory DriverTripCreatedModel.fromJson(Map<String, dynamic> json) {
    return DriverTripCreatedModel(
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
      bookings: json['bookings'] == null
          ? null
          : List<BookingModel>.from(
              (json['bookings'] as List).map((x) => BookingModel.fromJson(x))),
    );
  }

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
        'bookings': bookings?.map((e) => e.toJson()).toList(),
      };
}
