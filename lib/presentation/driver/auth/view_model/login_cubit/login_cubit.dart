import 'package:aoun_app/core/utils/check_connection/check_connection_cubit.dart';
import 'package:aoun_app/data/model/auth_model/auth_model.dart';
import 'package:aoun_app/data/repositories/local/shared_pref.dart';
import 'package:aoun_app/data/repositories/remote/auth_repository.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart' show DioException;
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final CheckConnectionCubit connectionCubit;

  LoginCubit(this.connectionCubit) : super(LoginInitial());

  Future<void> loginUser(AuthModel user, BuildContext context) async {
    emit(LoginLoading());

    if (connectionCubit.state is CheckConnectionNoInternet) {
      emit(LoginFailure(S.of(context).no_internet_connection));
      return;
    }
    try {
      Map<String, dynamic> response =
          await AuthenticationRepository().login(user: user);

      if (response['successed'] == true) {
        await SharedPreferencesService().userMode(true);
        await SharedPreferencesService().saveLoginState(response['token']);
        emit(LoginSuccess(S.of(context).login_successful));
      } else {
        String error = response['errors'][0];

        if (error ==
            "Email not found. Please make sure the email is correct.") {
          emit(LoginFailure(S.of(context).email_not_found));
        } else if (error == "Wrong Password or Email") {
          emit(LoginFailure(S.of(context).wrong_password_or_email));
        } else if (error == "Email not confirmed. Please check your inbox.") {
          emit(LoginFailure(S.of(context).email_not_confirmed));
        } else {
          emit(LoginFailure(response['errors'][0]));
        }
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
