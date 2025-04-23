part of 'send_otp_for_password_reset_cubit.dart';

@immutable
sealed class SendOtpForPasswordResetState {}

final class SendOtpForPasswordResetInitial
    extends SendOtpForPasswordResetState {}

final class SendOtpForPasswordResetLoading
    extends SendOtpForPasswordResetState {}

final class SendOtpForPasswordResetSuccess
    extends SendOtpForPasswordResetState {
  final String message;
  SendOtpForPasswordResetSuccess(this.message);
}

final class SendOtpForPasswordResetFailure
    extends SendOtpForPasswordResetState {
  final String errorMessage;
  SendOtpForPasswordResetFailure(this.errorMessage);
}
