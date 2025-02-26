import 'package:aoun_app/data/model/auth_model/auth_model.dart';
import 'package:aoun_app/data/repositories/local/shared_pref.dart';
import 'package:aoun_app/data/repositories/remote/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart' show DioException;
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> registerUser(AuthModel user) async {
    emit(LoginLoading());

    try {
      Map<String, dynamic> response =
          await AuthenticationRepository().loginFun(user: user);

      if (response['success'] == true) {
        SharedPreferencesService().saveLoginState(response['token']);
        emit(LoginSuccess(response['message']));
      } else {
        emit(LoginFailure(response['error'][0]));
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        emit(LoginFailure("Unexpected error: ${e.message}"));
      }
    }
  }
}
