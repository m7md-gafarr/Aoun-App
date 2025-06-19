part of 'user_booking_history_cubit.dart';

@immutable
sealed class UserBookingHistoryState {}

final class UserBookingHistoryInitial extends UserBookingHistoryState {}

final class UserBookingHistoryLoading extends UserBookingHistoryState {}

final class UserBookingHistorySuccess extends UserBookingHistoryState {
  final List<UserResponseBookingsModel> bookingList;
  UserBookingHistorySuccess(this.bookingList);
}

final class UserBookingHistoryFailure extends UserBookingHistoryState {
  final String errorMessage;
  UserBookingHistoryFailure(this.errorMessage);
}
