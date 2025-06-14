part of 'booking_trip_cubit.dart';

@immutable
sealed class BookingTripState {}

final class BookingTripInitial extends BookingTripState {}

final class BookingTripLoading extends BookingTripState {}

final class BookingTripSucess extends BookingTripState {
  final BookingResponseTripModel bookingResponseTripModel;
  BookingTripSucess(this.bookingResponseTripModel);
}

final class BookingTripFailure extends BookingTripState {
  final String errorMessage;
  BookingTripFailure(this.errorMessage);
}
