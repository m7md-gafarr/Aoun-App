import 'dart:developer';

import 'package:aoun_app/data/model/driver%20models/active_trip_requests/active_trip_requests.dart';
import 'package:aoun_app/data/repositories/remote/api_response_handler.dart';
import 'package:aoun_app/data/repositories/remote/trip_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'active_trip_requests_state.dart';

class ActiveTripRequestsCubit extends Cubit<ActiveTripRequestsState> {
  ActiveTripRequestsCubit() : super(ActiveTripRequestsInitial());

  getActiveTripRequests() async {
    try {
      ApiResponse<List<Map<String, dynamic>>> response =
          await TripRepository().getActiveTripRequests();
      log(response.data.toString());
      if (response.success) {
        List<ActiveTripRequests> list = [];

        for (var element in response.data!) {
          list.add(ActiveTripRequests.fromJson(element));
        }

        emit(ActiveTripRequestsSuccess(list));
      } else {
        String error = response.errors;

        emit(ActiveTripRequestsFailure(error));
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        emit(ActiveTripRequestsFailure("Network error: ${e.message}"));
      }
    } catch (e) {
      emit(ActiveTripRequestsFailure("Unexpected error login: $e"));
    }
  }
}
