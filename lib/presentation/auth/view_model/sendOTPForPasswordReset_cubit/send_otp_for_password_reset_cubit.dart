import 'package:aoun_app/core/utils/check_connection/check_connection_cubit.dart';
import 'package:aoun_app/data/model/auth%20models/user_auth_model/auth_model.dart';
import 'package:aoun_app/data/repositories/remote/api_response_handler.dart';
import 'package:aoun_app/data/repositories/remote/auth_repository.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'send_otp_for_password_reset_state.dart';

class SendOtpForPasswordResetCubit extends Cubit<SendOtpForPasswordResetState> {
  final CheckConnectionCubit connectionCubit;
  SendOtpForPasswordResetCubit(this.connectionCubit)
      : super(SendOtpForPasswordResetInitial());

  Future<void> sendOtp(UserAuthModel user, BuildContext context) async {
    emit(SendOtpForPasswordResetLoading());
    if (connectionCubit.state is CheckConnectionNoInternet) {
      emit(
          SendOtpForPasswordResetFailure(S.of(context).no_internet_connection));
      return;
    }
    try {
      ApiResponse<Map<String, dynamic>> response =
          await AuthenticationRepository().sendOTPForPasswordReset(user: user);

      if (response.success) {
        emit(SendOtpForPasswordResetSuccess(response.data!["message"]));
      } else {
        String error = response.errors;

        if (error ==
            "Email not found. Please make sure the email is correct.") {
          emit(SendOtpForPasswordResetFailure(S.of(context).email_not_found));
        } else {
          emit(SendOtpForPasswordResetFailure(error));
        }
      }
    } catch (e) {
      emit(SendOtpForPasswordResetFailure("Unexpected error occurred: $e"));
    }
  }
}
