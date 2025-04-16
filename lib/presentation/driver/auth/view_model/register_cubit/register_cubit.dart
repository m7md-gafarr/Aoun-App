import 'package:aoun_app/core/utils/check_connection/check_connection_cubit.dart';
import 'package:aoun_app/data/model/auth_model/auth_model.dart' show AuthModel;
import 'package:aoun_app/data/model/auth_model/location.dart';
import 'package:aoun_app/data/repositories/remote/api_response_handler.dart';
import 'package:aoun_app/data/repositories/remote/auth_repository.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final CheckConnectionCubit connectionCubit;

  RegisterCubit(this.connectionCubit) : super(RegisterInitial());

  Future<void> registerUser(
      AuthModel user, LocationModel location, BuildContext context) async {
    emit(RegisterLoading());
    if (connectionCubit.state is CheckConnectionNoInternet) {
      emit(RegisterFailure(S.of(context).no_internet_connection));
      return;
    }
    if (user.phoneNumber == null || user.phoneNumber!.isEmpty) {
      emit(RegisterFailure(S.of(context).phone_number_required));
      return;
    }

    try {
      ApiResponse<Map<String, dynamic>> response =
          await AuthenticationRepository()
              .register(user: user, location: location);

      if (response.success) {
        emit(RegisterSuccess(S.of(context).registration_successful));
      } else {
        String error = response.errors;

        if (error == "Email already exists.") {
          emit(RegisterFailure(S.of(context).email_already_exists));
        } else {
          emit(RegisterFailure(error));
        }
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        emit(RegisterFailure("Network error: ${e.message}"));
      }
    } catch (e) {
      emit(RegisterFailure("Unexpected error occurred : $e"));
    }
  }
}
