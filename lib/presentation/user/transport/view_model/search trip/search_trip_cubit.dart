import 'dart:developer';

import 'package:aoun_app/data/model/trip%20models/search_trip/search_trip.dart';
import 'package:aoun_app/data/repositories/remote/api_response_handler.dart';
import 'package:aoun_app/data/repositories/remote/trip_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'search_trip_state.dart';

class SearchTripCubit extends Cubit<SearchTripState> {
  SearchTripCubit() : super(SearchTripInitial());
  bool _first = true;

  searchTrip(String from, String to) async {
    try {
      emit(SearchTripLoading());

      ApiResponse<Map<String, dynamic>> response =
          await TripRepository().searchTrip(from, to);

      if (response.success) {
        List<SearchTrip> list = [];

        if (response.data!['data'] == null || response.data!['data'].isEmpty) {
          _first = false;

          if (_first) {
            emit(SearchTripInitial());
          } else {
            emit(SearchTripEmpty());
          }
        } else {
          for (var element in response.data!['data']) {
            list.add(SearchTrip.fromJson(element));
          }

          emit(SearchTripSuccess(list));
        }
      } else {
        String error = response.errors;

        emit(SearchTripFailure(error));
      }
    } on DioException catch (e) {
      emit(SearchTripFailure("Network error: ${e.message}"));
    } catch (e) {
      emit(SearchTripFailure("Unexpected error: $e"));
    }
  }

  void emitInitial() {
    _first = true;
    emit(SearchTripInitial());
  }
}
