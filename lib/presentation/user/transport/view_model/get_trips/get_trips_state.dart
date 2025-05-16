part of 'get_trips_cubit.dart';

@immutable
sealed class GetTripsState {}

final class GetTripsInitial extends GetTripsState {}

final class GetTripsLoading extends GetTripsState {}

final class GetTripsSuccess extends GetTripsState {
  List<TripModel> tripModel;
  GetTripsSuccess(this.tripModel);
}

final class GetTripsError extends GetTripsState {
  final String errorMessage;

  GetTripsError(this.errorMessage);
}
