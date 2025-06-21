part of 'create_trip_cubit.dart';

@immutable
sealed class CreateTripState {}

final class CreateTripInitial extends CreateTripState {}

final class CreateTripLoading extends CreateTripState {}

final class CreateTripSuccess extends CreateTripState {
  final String message;
  CreateTripSuccess(this.message);
}

final class CreateTripFailure extends CreateTripState {
  final String errorMessage;
  CreateTripFailure(this.errorMessage);
}
