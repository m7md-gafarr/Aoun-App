import '../trip_location_model.dart';

class ActiveTripRequests {
  TripLocationModel? fromLocation;
  TripLocationModel? toLocation;
  int? activePassengers;

  ActiveTripRequests({
    this.fromLocation,
    this.toLocation,
    this.activePassengers,
  });

  factory ActiveTripRequests.fromJson(Map<String, dynamic> json) {
    return ActiveTripRequests(
      fromLocation: json['fromLocation'] == null
          ? null
          : TripLocationModel.fromJson(
              json['fromLocation'] as Map<String, dynamic>),
      toLocation: json['toLocation'] == null
          ? null
          : TripLocationModel.fromJson(
              json['toLocation'] as Map<String, dynamic>),
      activePassengers: json['activePassengers'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'fromLocation': fromLocation?.toJson(),
        'toLocation': toLocation?.toJson(),
        'activePassengers': activePassengers,
      };
}
