import 'dart:developer';

import 'package:aoun_app/data/repositories/remote/api_response_handler.dart';
import 'package:aoun_app/data/repositories/remote/trip_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'cancel_trip_state.dart';

class CancelTripCubit extends Cubit<CancelTripState> {
  CancelTripCubit() : super(CancelTripInitial());
  cancelTrip(String id) async {
    emit(CancelTripLoading());
    try {
      ApiResponse<Map<String, dynamic>> response =
          await TripRepository().cancelTrip(tripId: id);

      log('CancelTripCubit: API response: success=${response.success}, errors=${response.errors}');

      if (response.success) {
        emit(CancelTripSuccess());
      } else {
        String error = response.errors;
        emit(CancelTripFailure(error));
      }
    } on DioException catch (e) {
      emit(CancelTripFailure("Network error: ${e.message}"));
    } catch (e) {
      emit(CancelTripFailure("Unexpected error: $e"));
    }
  }
}
