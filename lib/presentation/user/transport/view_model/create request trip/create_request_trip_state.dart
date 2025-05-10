part of 'create_request_trip_cubit.dart';

@immutable
sealed class CreateRequestTripState {}

final class CreateRequestTripInitial extends CreateRequestTripState {}

final class CreateRequestTripLoading extends CreateRequestTripState {}

final class CreateRequestTripSuccess extends CreateRequestTripState {
  String message;
  CreateRequestTripSuccess(this.message);
}

final class CreateRequestTripFailure extends CreateRequestTripState {
  String errorMessage;
  CreateRequestTripFailure(this.errorMessage);
}
