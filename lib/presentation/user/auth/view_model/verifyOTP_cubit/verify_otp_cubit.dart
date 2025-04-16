import 'package:aoun_app/core/utils/check_connection/check_connection_cubit.dart';
import 'package:aoun_app/data/model/auth_model/auth_model.dart';
import 'package:aoun_app/data/repositories/remote/api_response_handler.dart';
import 'package:aoun_app/data/repositories/remote/auth_repository.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'verify_otp_state.dart';

class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  final CheckConnectionCubit connectionCubit;
  VerifyOtpCubit(this.connectionCubit) : super(VerifyOtpInitial());

  Future<void> verfiyOtp(
      AuthModel user, String otp, BuildContext context) async {
    emit(VerifyOtpLoading());
    if (connectionCubit.state is CheckConnectionNoInternet) {
      emit(VerifyOtpFailure(S.of(context).no_internet_connection));
      return;
    }
    try {
      ApiResponse<Map<String, dynamic>> response =
          await AuthenticationRepository().verifyOtp(
        user: user,
        otp: otp,
      );

      if (response.success) {
        emit(VerifyOtpSuccess(response.data!["message"]));
      } else {
        String error = response.errors;

        if (error == "Invalid or expired OTP.") {
          emit(VerifyOtpFailure(S.of(context).invalid_or_expired_otp));
        } else {
          emit(VerifyOtpFailure(error));
        }
      }
    } catch (e) {
      emit(VerifyOtpFailure("Unexpected error occurred: $e"));
    }
  }
}
