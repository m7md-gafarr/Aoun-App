import 'package:aoun_app/core/utils/check_connection/check_connection_cubit.dart';
import 'package:aoun_app/data/model/auth_model/auth_model.dart';
import 'package:aoun_app/data/repositories/local/shared_pref.dart';
import 'package:aoun_app/data/repositories/remote/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart' show DioException;
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final CheckConnectionCubit connectionCubit;

  LoginCubit(this.connectionCubit) : super(LoginInitial());

  Future<void> loginUser(AuthModel user) async {
    emit(LoginLoading());

    if (connectionCubit.state is CheckConnectionNoInternet) {
      emit(LoginFailure("No internet connection"));
      return;
    }
    try {
      Map<String, dynamic> response =
          await AuthenticationRepository().login(user: user);

      if (response['successed'] == true) {
        await SharedPreferencesService().saveLoginState(response['token']);
        emit(LoginSuccess(response['message']));
      } else {
        emit(LoginFailure(response['errors'][0]));
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        emit(LoginFailure("Network error: ${e.message}"));
      }
    } catch (e) {
      emit(LoginFailure("Unexpected error login: $e"));
    }
  }
}
