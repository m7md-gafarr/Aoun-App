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
      bookingId: json['bookingId'] as int?,
      totalSeats: json['totalSeats'] as int?,
      availableSeats: json['availableSeats'] as int?,
      totalPrice: json['totalPrice'] as int?,
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
