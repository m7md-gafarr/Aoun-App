import 'trip_location.dart';

class CreateTripModel {
  LocationTrip? fromLocation;
  LocationTrip? toLocation;
  DateTime? departureTime;
  int? availableSeats;
  int? pricePerSeat;
  String? driverNotes;
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
  });

  factory CreateTripModel.fromJson(Map<String, dynamic> json) {
    return CreateTripModel(
      fromLocation: json['fromLocation'] == null
          ? null
          : LocationTrip.fromJson(json['fromLocation'] as Map<String, dynamic>),
      toLocation: json['toLocation'] == null
          ? null
          : LocationTrip.fromJson(json['toLocation'] as Map<String, dynamic>),
      departureTime: json['departureTime'] == null
          ? null
          : DateTime.parse(json['departureTime'] as String),
      availableSeats: json['availableSeats'] as int?,
      pricePerSeat: json['pricePerSeat'] as int?,
      driverNotes: json['driverNotes'] as String?,
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
        'departureTime': departureTime?.toIso8601String(),
        'availableSeats': availableSeats,
        'pricePerSeat': pricePerSeat,
        'driverNotes': driverNotes,
        'hasWiFi': hasWiFi,
        'hasPhoneCharger': hasPhoneCharger,
        'hasAirConditioning': hasAirConditioning,
        'hasChildSeat': hasChildSeat,
        'hasFreeWater': hasFreeWater,
        'hasMusic': hasMusic,
      };
}
