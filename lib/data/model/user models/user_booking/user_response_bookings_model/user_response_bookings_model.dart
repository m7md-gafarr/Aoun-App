import 'package:aoun_app/data/model/trip%20models/trip_location_model.dart';

class UserResponseBookingsModel {
  TripLocationModel? fromLocation;
  TripLocationModel? toLocation;
  int? totalSeats;
  String? formattedDate;
  String? formattedTripStatus;

  UserResponseBookingsModel({
    this.fromLocation,
    this.toLocation,
    this.totalSeats,
    this.formattedDate,
    this.formattedTripStatus,
  });

  factory UserResponseBookingsModel.fromJson(Map<String, dynamic> json) {
    return UserResponseBookingsModel(
      fromLocation: json['fromLocation'] == null
          ? null
          : TripLocationModel.fromJson(
              json['fromLocation'] as Map<String, dynamic>),
      toLocation: json['toLocation'] == null
          ? null
          : TripLocationModel.fromJson(
              json['toLocation'] as Map<String, dynamic>),
      totalSeats: json['totalSeats'] as int?,
      formattedDate: json['formattedDate'] as String?,
      formattedTripStatus: json['formattedTripStatus'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'fromLocation': fromLocation?.toJson(),
        'toLocation': toLocation?.toJson(),
        'totalSeats': totalSeats,
        'formattedDate': formattedDate,
        'formattedTripStatus': formattedTripStatus,
      };
}
