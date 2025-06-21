part of 'driver_create_trip_or_not_cubit.dart';

@immutable
sealed class DriverCreateTripOrNotState {}

final class DriverCreateTripOrNotInitial extends DriverCreateTripOrNotState {}

final class DriverCreateTripOrNotLoading extends DriverCreateTripOrNotState {}

final class DriverCreateTripOrNotSuccess extends DriverCreateTripOrNotState {
  final DriverTripCreatedModel trip;
  DriverCreateTripOrNotSuccess(this.trip);
}

final class DriverCreateTripOrNotFailure extends DriverCreateTripOrNotState {
  final String errorMessage;
  DriverCreateTripOrNotFailure(this.errorMessage);
}
