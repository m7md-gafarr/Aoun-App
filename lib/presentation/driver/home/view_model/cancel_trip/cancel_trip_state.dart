part of 'cancel_trip_cubit.dart';

@immutable
sealed class CancelTripState {}

final class CancelTripInitial extends CancelTripState {}

final class CancelTripLoading extends CancelTripState {}

final class CancelTripSuccess extends CancelTripState {}

final class CancelTripFailure extends CancelTripState {
  final errorMessage;
  CancelTripFailure(this.errorMessage);
}
