import 'package:aoun_app/core/utils/check_connection/check_connection_cubit.dart';
import 'package:aoun_app/data/model/auth_model/auth_model.dart';
import 'package:aoun_app/data/repositories/remote/auth_repository.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'send_otp_for_password_reset_state.dart';

class SendOtpForPasswordResetCubit extends Cubit<SendOtpForPasswordResetState> {
  final CheckConnectionCubit connectionCubit;
  SendOtpForPasswordResetCubit(this.connectionCubit)
      : super(SendOtpForPasswordResetInitial());

  Future<void> sendOtp(AuthModel user, BuildContext context) async {
    emit(SendOtpForPasswordResetLoading());
    if (connectionCubit.state is CheckConnectionNoInternet) {
      emit(
          SendOtpForPasswordResetFailure(S.of(context).no_internet_connection));
      return;
    }
    try {
      Map<String, dynamic> response =
          await AuthenticationRepository().sendOTPForPasswordReset(user: user);

      if (response["successed"] == true) {
        emit(SendOtpForPasswordResetSuccess(response["message"]));
      } else {
        String error = response['errors'][0];

        if (error ==
            "Email not found. Please make sure the email is correct.") {
          emit(SendOtpForPasswordResetFailure(S.of(context).email_not_found));
        } else {
          emit(SendOtpForPasswordResetFailure(response['errors'][0]));
        }
      }
    } catch (e) {
      emit(SendOtpForPasswordResetFailure("Unexpected error occurred: $e"));
    }
  }
}
