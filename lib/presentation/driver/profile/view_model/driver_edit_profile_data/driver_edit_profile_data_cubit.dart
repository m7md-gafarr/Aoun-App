import 'dart:developer';

import 'package:aoun_app/data/model/driver_models/driver_model/driver_model.dart';
import 'package:aoun_app/data/repositories/remote/api_response_handler.dart';
import 'package:aoun_app/data/repositories/remote/driver_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'driver_edit_profile_data_state.dart';

class DriverEditProfileDataCubit extends Cubit<DriverEditProfileDataState> {
  DriverEditProfileDataCubit() : super(DriverEditProfileDataInitial());

  updateDriver(DriverModel driver) async {
    emit(DriverEditProfileDataLoading());
    try {
      ApiResponse<Map<String, dynamic>> response =
          await DriverRepository().updateDriverProfileData(driverModel: driver);

      if (response.success) {
        emit(DriverEditProfileDataSuccess());
      } else {
        String error = response.errors;
        log(error.toString());
        emit(DriverEditProfileDataFaliure(error));
      }
    } on DioException catch (e) {
      emit(DriverEditProfileDataFaliure("Network error: ${e.message}"));
    } catch (e) {
      emit(DriverEditProfileDataFaliure("Unexpected error: $e"));
    }
  }
}
