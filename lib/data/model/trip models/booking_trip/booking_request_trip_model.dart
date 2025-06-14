class BookingTripRequestModel {
  int? tripId;
  int? numberOfSeats;
  String? meetingPoint;
  String? note;

  BookingTripRequestModel({
    this.tripId,
    this.numberOfSeats,
    this.meetingPoint,
    this.note,
  });

  factory BookingTripRequestModel.fromJson(Map<String, dynamic> json) {
    return BookingTripRequestModel(
      tripId: json['tripId'] as int?,
      numberOfSeats: json['numberOfSeats'] as int?,
      meetingPoint: json['meetingPoint'] as String?,
      note: json['note'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'tripId': tripId,
        'numberOfSeats': numberOfSeats,
        'meetingPoint': meetingPoint,
        'note': note,
      };
}
