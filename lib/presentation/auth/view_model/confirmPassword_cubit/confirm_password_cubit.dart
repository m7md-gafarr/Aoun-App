import 'package:aoun_app/core/utils/check_connection/check_connection_cubit.dart';
import 'package:aoun_app/data/model/auth_model/auth_model.dart';
import 'package:aoun_app/data/repositories/remote/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'confirm_password_state.dart';

class ConfirmPasswordCubit extends Cubit<ConfirmPasswordState> {
  final CheckConnectionCubit connectionCubit;
  ConfirmPasswordCubit(this.connectionCubit) : super(ConfirmPasswordInitial());
  Future<void> confirmPassword(AuthModel user) async {
    emit(ConfirmPasswordLoading());

    if (connectionCubit.state is CheckConnectionNoInternet) {
      emit(ConfirmPasswordFailure("No internet connection"));
      return;
    }
    try {
      Map<String, dynamic> response =
          await AuthenticationRepository().confirmPassword(user: user);

      if (response['successed'] == true) {
        emit(ConfirmPasswordSuccess(response['message']));
      } else {
        emit(ConfirmPasswordFailure(response['errors'][0]));
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
