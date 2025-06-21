class BookingResponseTripModel {
  String? bookingStatus;
  int? bookingId;
  int? totalSeats;
  int? availableSeats;
  int? totalPrice;

  BookingResponseTripModel({
    this.bookingStatus,
    this.bookingId,
    this.totalSeats,
    this.availableSeats,
    this.totalPrice,
  });

  factory BookingResponseTripModel.fromJson(Map<String, dynamic> json) {
    return BookingResponseTripModel(
      bookingStatus: json['bookingStatus'] as String?,
      bookingId: (json['bookingId'] as num?)?.toInt(),
      totalSeats: (json['totalSeats'] as num?)?.toInt(),
      availableSeats: (json['availableSeats'] as num?)?.toInt(),
      totalPrice: (json['totalPrice'] as num?)?.toInt(),
    );
  }

  Map<String, dynamic> toJson() => {
        'bookingStatus': bookingStatus,
        'bookingId': bookingId,
        'totalSeats': totalSeats,
        'availableSeats': availableSeats,
        'totalPrice': totalPrice,
      };
}
