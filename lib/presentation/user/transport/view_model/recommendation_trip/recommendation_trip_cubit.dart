import 'package:aoun_app/data/model/trip_models/trip_model/trip_model.dart';
import 'package:aoun_app/data/repositories/remote/api_response_handler.dart';
import 'package:aoun_app/data/repositories/remote/trip_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'recommendation_trip_state.dart';

class RecommendationTripCubit extends Cubit<RecommendationTripState> {
  RecommendationTripCubit() : super(RecommendationTripInitial());
  getTrips(BuildContext context) async {
    try {
      emit(RecommendationTripLoading());

      ApiResponse<Map<String, dynamic>> response =
          await TripRepository().getRecommendationTrips(context);

      if (response.success) {
        if (response.data == null || response.data!.isEmpty) {
          emit(RecommendationTripSuccess([]));
        } else {
          List<TripModel> list = [];
          for (var element in response.data!['data']!) {
            TripModel trip = TripModel.fromJson(element);
            list.add(trip);
          }

          emit(RecommendationTripSuccess(list.reversed.toList()));
        }
      } else {
        if (response.errors == "No locations found for the trips.") {
          emit(RecommendationTripSuccess([]));
        } else {
          String error = response.errors;

          emit(RecommendationTripFailure(error));
        }
      }
    } on DioException catch (e) {
      emit(RecommendationTripFailure("Network error: ${e.message}"));
    } catch (e) {
      emit(RecommendationTripFailure("Unexpected error login: $e"));
    }
  }
}
