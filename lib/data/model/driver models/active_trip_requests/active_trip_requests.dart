import 'from_location.dart';
import 'to_location.dart';

class ActiveTripRequests {
  FromLocation? fromLocation;
  ToLocation? toLocation;
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
          : FromLocation.fromJson(json['fromLocation'] as Map<String, dynamic>),
      toLocation: json['toLocation'] == null
          ? null
          : ToLocation.fromJson(json['toLocation'] as Map<String, dynamic>),
      activePassengers: json['activePassengers'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'fromLocation': fromLocation?.toJson(),
        'toLocation': toLocation?.toJson(),
        'activePassengers': activePassengers,
      };
}
