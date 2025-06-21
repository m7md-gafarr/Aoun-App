import 'dart:developer';

import 'package:aoun_app/data/model/trip_models/active_trip_requests/active_trip_requests.dart';
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
      emit(ActiveTripRequestsLoading());

      ApiResponse<Map<String, dynamic>> response =
          await TripRepository().getActiveTripRequests();

      if (response.success) {
        if (response.data!['data'] == null || response.data!['data']!.isEmpty) {
          emit(ActiveTripRequestsSuccess([]));
        } else {
          List<ActiveTripRequests> list = [];

          for (var element in response.data!['data']!) {
            list.add(ActiveTripRequests.fromJson(element));
          }

          emit(ActiveTripRequestsSuccess(list.reversed.toList()));
        }
      } else {
        String error = response.errors;
        emit(ActiveTripRequestsFailure(error));
      }
    } on DioException catch (e) {
      emit(ActiveTripRequestsFailure("Network error: ${e.message}"));
    } catch (e) {
      emit(ActiveTripRequestsFailure("Unexpected error login: $e"));
    }
  }
}
