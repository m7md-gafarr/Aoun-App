part of 'driver_trips_history_cubit.dart';

@immutable
sealed class DriverTripsHistoryState {}

final class DriverTripsHistoryInitial extends DriverTripsHistoryState {}

final class DriverTripsHistoryLoading extends DriverTripsHistoryState {}

final class DriverTripsHistorySuccess extends DriverTripsHistoryState {
  final List<TripModel> tripList;
  DriverTripsHistorySuccess(this.tripList);
}

final class DriverTripsHistoryFailure extends DriverTripsHistoryState {
  final String errorMessage;
  DriverTripsHistoryFailure(this.errorMessage);
}
