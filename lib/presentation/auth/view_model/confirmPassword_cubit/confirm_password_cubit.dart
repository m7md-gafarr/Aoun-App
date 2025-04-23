import 'package:aoun_app/core/utils/check_connection/check_connection_cubit.dart';
import 'package:aoun_app/data/model/auth%20models/user_auth_model/auth_model.dart';
import 'package:aoun_app/data/repositories/remote/api_response_handler.dart';
import 'package:aoun_app/data/repositories/remote/auth_repository.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

part 'confirm_password_state.dart';

class ConfirmPasswordCubit extends Cubit<ConfirmPasswordState> {
  final CheckConnectionCubit connectionCubit;
  ConfirmPasswordCubit(this.connectionCubit) : super(ConfirmPasswordInitial());

  Future<void> confirmPassword(UserAuthModel user, BuildContext context) async {
    emit(ConfirmPasswordLoading());

    if (connectionCubit.state is CheckConnectionNoInternet) {
      emit(ConfirmPasswordFailure(S.of(context).no_internet_connection));
      return;
    }
    try {
      ApiResponse<Map<String, dynamic>> response =
          await AuthenticationRepository().confirmPassword(user: user);

      if (response.success) {
        emit(ConfirmPasswordSuccess(S.of(context).password_reset_successful));
      } else {
        String error = response.errors;

        if (error == "OTP verification expired. Please request a new OTP.") {
          emit(ConfirmPasswordFailure(S.of(context).otp_verification_expired));
        } else if (error == "Passwords do not match.") {
          emit(ConfirmPasswordFailure(S.of(context).passwords_do_not_match));
        } else {
          emit(ConfirmPasswordFailure(error));
        }
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        emit(ConfirmPasswordFailure("Network error: ${e.message}"));
      }
    } catch (e) {
      emit(ConfirmPasswordFailure("Unexpected error login: $e"));
    }
  }
}
