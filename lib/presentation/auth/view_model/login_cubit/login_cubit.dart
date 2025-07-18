import 'package:aoun_app/core/utils/check_connection/check_connection_cubit.dart';
import 'package:aoun_app/data/model/auth%20models/user_auth_model/auth_model.dart';
import 'package:aoun_app/data/repositories/local/shared_pref.dart';
import 'package:aoun_app/data/repositories/remote/api_response_handler.dart';
import 'package:aoun_app/data/repositories/remote/auth_repository.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart' show DioException;
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final CheckConnectionCubit connectionCubit;

  LoginCubit(this.connectionCubit) : super(LoginInitial());

  Future<void> loginUser(UserAuthModel user, BuildContext context) async {
    emit(LoginLoading());

    if (connectionCubit.state is CheckConnectionNoInternet) {
      emit(LoginFailure(S.of(context).no_internet_connection));
      return;
    }

    try {
      ApiResponse<Map<String, dynamic>> response =
          await AuthenticationRepository().login(user: user);

      if (response.success) {
        final token = response.data?['token'];
        final mode = response.data?['loggedBy'];
        if (mode == "driver") {
          await SharedPreferencesService().userMode(false);
        } else {
          await SharedPreferencesService().userMode(true);
        }

        await SharedPreferencesService().saveLoginState(token);
        emit(LoginSuccess(S.of(context).login_successful, mode));
      } else {
        final error = response.errors;

        if (error ==
            "Email not found. Please make sure the email is correct.") {
          emit(LoginFailure(S.of(context).email_not_found));
        } else if (error == "Wrong Password or Email") {
          emit(LoginFailure(S.of(context).wrong_password_or_email));
        } else if (error == "Email not confirmed. Please check your inbox.") {
          emit(LoginFailure(S.of(context).email_not_confirmed));
        } else {
          emit(LoginFailure(error));
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
