part of 'search_trip_cubit.dart';

@immutable
sealed class SearchTripState {}

final class SearchTripInitial extends SearchTripState {}

final class SearchTripLoading extends SearchTripState {}

final class SearchTripEmpty extends SearchTripState {}

final class SearchTripSuccess extends SearchTripState {
  List<SearchTrip> list;
  SearchTripSuccess(this.list);
}

final class SearchTripFailure extends SearchTripState {
  String errorMessage;
  SearchTripFailure(this.errorMessage);
}
