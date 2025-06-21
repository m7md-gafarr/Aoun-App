import 'package:aoun_app/core/utils/check_connection/check_connection_cubit.dart';
import 'package:aoun_app/data/model/driver_models/driver_craeted_trip/driver_trip_created/driver_trip_created_model.dart';
import 'package:aoun_app/data/repositories/remote/api_response_handler.dart';
import 'package:aoun_app/data/repositories/remote/driver_repository.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
part 'driver_create_trip_or_not_state.dart';

class DriverCreateTripOrNotCubit extends Cubit<DriverCreateTripOrNotState> {
  final CheckConnectionCubit connectionCubit;
  DriverCreateTripOrNotCubit(this.connectionCubit)
      : super(DriverCreateTripOrNotInitial());

  bool _tripCreated = false;

  bool get getTripCreated => _tripCreated;

  driverCreateTripOrNot(BuildContext context) async {
    emit(DriverCreateTripOrNotLoading());

    if (connectionCubit.state is CheckConnectionNoInternet) {
      emit(DriverCreateTripOrNotFailure(S.of(context).no_internet_connection));
      return;
    }

    try {
      ApiResponse<Map<String, dynamic>> response =
          await DriverRepository().getDriverActiveTrip();

      _tripCreated = response.success;

      if (response.success) {
        emit(DriverCreateTripOrNotSuccess(
            DriverTripCreatedModel.fromJson(response.data!['data'])));
      } else {
        String error = response.errors;

        emit(DriverCreateTripOrNotFailure(error));
      }
    } on DioException catch (e) {
      emit(DriverCreateTripOrNotFailure("Network error: ${e.message}"));
    } catch (e) {
      emit(DriverCreateTripOrNotFailure("Unexpected error: $e"));
    }
  }
}
