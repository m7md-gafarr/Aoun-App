import 'package:aoun_app/core/utils/check_connection/check_connection_cubit.dart';
import 'package:aoun_app/data/model/auth_model/auth_model.dart';
import 'package:aoun_app/data/repositories/remote/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'verify_otp_state.dart';

class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  final CheckConnectionCubit connectionCubit;
  VerifyOtpCubit(this.connectionCubit) : super(VerifyOtpInitial());

  Future<void> verfiyOtp(AuthModel user, String otp) async {
    emit(VerifyOtpLoading());
    if (connectionCubit.state is CheckConnectionNoInternet) {
      emit(VerifyOtpFailure("No internet connection"));
      return;
    }
    try {
      Map<String, dynamic> response =
          await AuthenticationRepository().verifyOtp(
        user: user,
        otp: otp,
      );

      if (response["successed"] == true) {
        emit(VerifyOtpSuccess(response["message"]));
      } else {
        emit(VerifyOtpFailure(response["errors"][0]));
      }
    } catch (e) {
      emit(VerifyOtpFailure("Unexpected error occurred: $e"));
    }
  }
}
