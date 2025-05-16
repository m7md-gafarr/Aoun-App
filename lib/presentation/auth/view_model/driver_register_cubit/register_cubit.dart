import 'dart:developer';

import 'package:aoun_app/core/utils/check_connection/check_connection_cubit.dart';
import 'package:aoun_app/data/model/auth%20models/driver_auth_model/driver_auth_model.dart';
import 'package:aoun_app/data/repositories/remote/api_response_handler.dart';
import 'package:aoun_app/data/repositories/remote/auth_repository.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

part 'register_state.dart';

class DriverRegisterCubit extends Cubit<DriverRegisterState> {
  final CheckConnectionCubit connectionCubit;

  DriverRegisterCubit(this.connectionCubit) : super(DriverRegisterInitial());

  Future<void> registerUser(DriverAuthModel user, BuildContext context) async {
    emit(DriverRegisterLoading());
    if (connectionCubit.state is CheckConnectionNoInternet) {
      emit(DriverRegisterFailure(S.of(context).no_internet_connection));
      return;
    }
    if (user.phoneNumber == null || user.phoneNumber!.isEmpty) {
      emit(DriverRegisterFailure(S.of(context).phone_number_required));
      return;
    }

    try {
      ApiResponse<Map<String, dynamic>> response =
          await AuthenticationRepository().registerDriver(
        user: user,
      );
      if (response.success) {
        emit(DriverRegisterSuccess(S.of(context).registration_successful));
      } else {
        String error = response.errors;
        if (error == "Email already exists.") {
          emit(DriverRegisterFailure(S.of(context).email_already_exists));
        } else {
          emit(DriverRegisterFailure(error));
        }
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        emit(DriverRegisterFailure("Network error: ${e.message}"));
      }
    } catch (e) {
      emit(DriverRegisterFailure("Unexpected error occurred : $e"));
    }
  }
}
