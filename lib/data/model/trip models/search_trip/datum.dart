import 'package:aoun_app/data/model/trip%20models/trip_location_model.dart';

class Datum {
  int? id;
  TripLocationModel? fromLocation;
  TripLocationModel? toLocation;
  String? driverName;
  String? driverPhone;
  String? startingPoint;
  String? destination;
  String? departureTime;
  dynamic estimatedDistance;
  dynamic estimatedDuration;
  dynamic estimatedArrivalTime;
  int? availableSeats;
  int? pricePerSeat;
  String? notes;
  DateTime? createdAt;

  Datum({
    this.id,
    this.fromLocation,
    this.toLocation,
    this.driverName,
    this.driverPhone,
    this.startingPoint,
    this.destination,
    this.departureTime,
    this.estimatedDistance,
    this.estimatedDuration,
    this.estimatedArrivalTime,
    this.availableSeats,
    this.pricePerSeat,
    this.notes,
    this.createdAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        fromLocation: json['fromLocation'] == null
            ? null
            : TripLocationModel.fromJson(
                json['fromLocation'] as Map<String, dynamic>),
        toLocation: json['toLocation'] == null
            ? null
            : TripLocationModel.fromJson(
                json['toLocation'] as Map<String, dynamic>),
        driverName: json['driverName'] as String?,
        driverPhone: json['driverPhone'] as String?,
        startingPoint: json['startingPoint'] as String?,
        destination: json['destination'] as String?,
        departureTime: json['departureTime'] as String?,
        estimatedDistance: json['estimatedDistance'] as dynamic,
        estimatedDuration: json['estimatedDuration'] as dynamic,
        estimatedArrivalTime: json['estimatedArrivalTime'] as dynamic,
        availableSeats: json['availableSeats'] as int?,
        pricePerSeat: json['pricePerSeat'] as int?,
        notes: json['notes'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'fromLocation': fromLocation?.toJson(),
        'toLocation': toLocation?.toJson(),
        'driverName': driverName,
        'driverPhone': driverPhone,
        'startingPoint': startingPoint,
        'destination': destination,
        'departureTime': departureTime,
        'estimatedDistance': estimatedDistance,
        'estimatedDuration': estimatedDuration,
        'estimatedArrivalTime': estimatedArrivalTime,
        'availableSeats': availableSeats,
        'pricePerSeat': pricePerSeat,
        'notes': notes,
        'createdAt': createdAt?.toIso8601String(),
      };
}
