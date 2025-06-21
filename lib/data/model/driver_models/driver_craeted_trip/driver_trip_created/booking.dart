import 'package:aoun_app/data/model/driver_models/driver_craeted_trip/driver_trip_created/payment_info.dart';
import 'package:aoun_app/data/model/trip_models/booking_trip/booking_request_trip/booking_request_trip_model/meeting_point.dart';

class BookingModel {
  int? bookingId;
  String? userId;
  String? userName;
  String? userPhone;
  int? numberOfSeats;
  String? bookingStatus;
  DateTime? bookingDate;
  double? totalAmount;
  MeetingPoint? meetingPoint;
  PaymentModel? payment;

  BookingModel({
    this.bookingId,
    this.userId,
    this.userName,
    this.userPhone,
    this.numberOfSeats,
    this.bookingStatus,
    this.bookingDate,
    this.totalAmount,
    this.meetingPoint,
    this.payment,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      bookingId: json['bookingId'] as int?,
      userId: json['userId'] as String?,
      userName: json['userName'] as String?,
      userPhone: json['userPhone'] as String?,
      numberOfSeats: json['numberOfSeats'] as int?,
      bookingStatus: json['bookingStatus'] as String?,
      bookingDate: json['bookingDate'] == null
          ? null
          : DateTime.parse(json['bookingDate']),
      totalAmount: (json['totalAmount'] as num?)?.toDouble(),
      meetingPoint: json['meetingPoint'] == null
          ? null
          : MeetingPoint.fromJson(json['meetingPoint']),
      payment: json['payment'] == null
          ? null
          : PaymentModel.fromJson(json['payment']),
    );
  }

  Map<String, dynamic> toJson() => {
        'bookingId': bookingId,
        'userId': userId,
        'userName': userName,
        'userPhone': userPhone,
        'numberOfSeats': numberOfSeats,
        'bookingStatus': bookingStatus,
        'bookingDate': bookingDate?.toIso8601String(),
        'totalAmount': totalAmount,
        'meetingPoint': meetingPoint?.toJson(),
        'payment': payment?.toJson(),
      };
}
