import 'package:aoun_app/core/utils/check_connection/check_connection_cubit.dart';
import 'package:aoun_app/data/model/driver%20models/greate_trip_model/greate_trip_model.dart';
import 'package:aoun_app/data/repositories/remote/api_response_handler.dart';
import 'package:aoun_app/data/repositories/remote/trip_repository.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

part 'create_trip_state.dart';

class CreateTripCubit extends Cubit<CreateTripState> {
  final CheckConnectionCubit connectionCubit;

  CreateTripCubit(this.connectionCubit) : super(CreateTripInitial());

  Future<void> greateTrip(CreateTripModel trip, BuildContext context) async {
    emit(CreateTripLoading());

    if (connectionCubit.state is CheckConnectionNoInternet) {
      emit(CreateTripFailure(S.of(context).no_internet_connection));
      return;
    }

    try {
      ApiResponse<Map<String, dynamic>> response =
          await TripRepository().greateTrip(trip: trip);

      if (response.success) {
        emit(CreateTripSuccess(response.data!['message']));
      } else {
        String error = response.errors;

        emit(CreateTripFailure(error));
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        emit(CreateTripFailure("Network error: ${e.message}"));
      }
    } catch (e) {
      emit(CreateTripFailure("Unexpected error login: $e"));
    }
  }
}
