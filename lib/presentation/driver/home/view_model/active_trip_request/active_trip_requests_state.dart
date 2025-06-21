part of 'active_trip_requests_cubit.dart';

@immutable
sealed class ActiveTripRequestsState {}

final class ActiveTripRequestsInitial extends ActiveTripRequestsState {}

final class ActiveTripRequestsLoading extends ActiveTripRequestsState {}

final class ActiveTripRequestsSuccess extends ActiveTripRequestsState {
  List<ActiveTripRequests> tripList;
  ActiveTripRequestsSuccess(this.tripList);
}

final class ActiveTripRequestsFailure extends ActiveTripRequestsState {
  String errorMessage;
  ActiveTripRequestsFailure(this.errorMessage);
}
