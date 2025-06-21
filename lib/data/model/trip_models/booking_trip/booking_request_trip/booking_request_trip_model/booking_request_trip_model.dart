import 'meeting_point.dart';

class BookingRequestTripModel {
  int? tripId;
  int? numberOfSeats;
  MeetingPoint? meetingPoint;
  String? note;

  BookingRequestTripModel({
    this.tripId,
    this.numberOfSeats,
    this.meetingPoint,
    this.note,
  });

  factory BookingRequestTripModel.fromJson(Map<String, dynamic> json) {
    return BookingRequestTripModel(
      tripId: json['tripId'] as int?,
      numberOfSeats: json['numberOfSeats'] as int?,
      meetingPoint: json['meetingPoint'] == null
          ? null
          : MeetingPoint.fromJson(json['meetingPoint'] as Map<String, dynamic>),
      note: json['note'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'tripId': tripId,
        'numberOfSeats': numberOfSeats,
        'meetingPoint': meetingPoint?.toJson(),
        'note': note,
      };
}
