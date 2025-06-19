part of 'complete_trip_cubit.dart';

@immutable
sealed class CompleteTripState {}

final class CompleteTripInitial extends CompleteTripState {}

final class CompleteTripLoading extends CompleteTripState {}

final class CompleteTripSuccess extends CompleteTripState {}

final class CompleteTripFailure extends CompleteTripState {
  final String erroeMessage;
  CompleteTripFailure(this.erroeMessage);
}
