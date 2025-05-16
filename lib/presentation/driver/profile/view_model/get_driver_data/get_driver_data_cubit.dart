import 'dart:developer';

import 'package:aoun_app/core/router/route_name.dart';
import 'package:aoun_app/data/model/driver_models/driver_model/driver_model.dart';
import 'package:aoun_app/data/repositories/local/shared_pref.dart';
import 'package:aoun_app/data/repositories/remote/api_response_handler.dart';
import 'package:aoun_app/data/repositories/remote/driver_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'get_driver_data_state.dart';

class GetDriverDataCubit extends Cubit<GetDriverDataState> {
  GetDriverDataCubit() : super(GetDriverDataInitial());

  DriverModel? _cachedDriver;

  getDriverData(BuildContext context) async {
    if (_cachedDriver != null) {
      emit(GetDriverDataSucess(_cachedDriver!));
      return;
    }

    try {
      emit(GetDriverDataInitial());
      ApiResponse<Map<String, dynamic>> response =
          await DriverRepository().getDriverInformation();
      if (response.success) {
        final driver = DriverModel.fromJson(response.data!);
        _cachedDriver = driver;
        emit(GetDriverDataSucess(driver));
      } else {
        String error = response.errors;

        if (error == "Driver not found") {
          emit(GetDriverDataError(error.toString()));
          SharedPreferencesService().logout();
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutesName.selectTypeScreenRoute,
            (route) => false,
          );
        }
      }
    } catch (e) {
      emit(GetDriverDataError(e.toString()));
    }
  }
}
