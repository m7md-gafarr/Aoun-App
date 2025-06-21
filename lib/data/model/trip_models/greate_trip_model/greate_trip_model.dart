import 'package:aoun_app/data/model/trip_models/trip_location_model.dart';

class CreateTripModel {
  TripLocationModel? fromLocation;
  TripLocationModel? toLocation;
  String? departureTime;
  int? availableSeats;
  int? pricePerSeat;
  String? driverNotes;
  int? estimatedDistance;
  String? estimatedDuration;
  bool? hasWiFi;
  bool? hasPhoneCharger;
  bool? hasAirConditioning;
  bool? hasChildSeat;
  bool? hasFreeWater;
  bool? hasMusic;

  CreateTripModel({
    this.fromLocation,
    this.toLocation,
    this.departureTime,
    this.availableSeats,
    this.pricePerSeat,
    this.driverNotes,
    this.hasWiFi,
    this.hasPhoneCharger,
    this.hasAirConditioning,
    this.hasChildSeat,
    this.hasFreeWater,
    this.hasMusic,
    this.estimatedDistance,
    this.estimatedDuration,
  });

  factory CreateTripModel.fromJson(Map<String, dynamic> json) {
    return CreateTripModel(
      fromLocation: json['fromLocation'] == null
          ? null
          : TripLocationModel.fromJson(
              json['fromLocation'] as Map<String, dynamic>),
      toLocation: json['toLocation'] == null
          ? null
          : TripLocationModel.fromJson(
              json['toLocation'] as Map<String, dynamic>),
      departureTime: json['departureTime'] as String,
      availableSeats: json['availableSeats'] as int?,
      pricePerSeat: json['pricePerSeat'] as int?,
      driverNotes: json['driverNotes'] as String?,
      estimatedDuration: json['estimatedDuration'] as String?,
      estimatedDistance: json['estimatedDistance'] as int?,
      hasWiFi: json['hasWiFi'] as bool?,
      hasPhoneCharger: json['hasPhoneCharger'] as bool?,
      hasAirConditioning: json['hasAirConditioning'] as bool?,
      hasChildSeat: json['hasChildSeat'] as bool?,
      hasFreeWater: json['hasFreeWater'] as bool?,
      hasMusic: json['hasMusic'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
        'fromLocation': fromLocation?.toJson(),
        'toLocation': toLocation?.toJson(),
        'departureTime': departureTime,
        'availableSeats': availableSeats,
        'pricePerSeat': pricePerSeat,
        'driverNotes': driverNotes,
        "estimatedDistance": estimatedDistance,
        "estimatedDuration": estimatedDuration,
        'hasWiFi': hasWiFi,
        'hasPhoneCharger': hasPhoneCharger,
        'hasAirConditioning': hasAirConditioning,
        'hasChildSeat': hasChildSeat,
        'hasFreeWater': hasFreeWater,
        'hasMusic': hasMusic,
      };
}
