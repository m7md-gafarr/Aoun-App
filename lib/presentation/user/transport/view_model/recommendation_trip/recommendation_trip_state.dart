part of 'recommendation_trip_cubit.dart';

@immutable
sealed class RecommendationTripState {}

final class RecommendationTripInitial extends RecommendationTripState {}

final class RecommendationTripLoading extends RecommendationTripState {}

final class RecommendationTripSuccess extends RecommendationTripState {
  final List<TripModel> tripModel;
  RecommendationTripSuccess(this.tripModel);
}

final class RecommendationTripFailure extends RecommendationTripState {
  final String errorMessage;
  RecommendationTripFailure(this.errorMessage);
}
