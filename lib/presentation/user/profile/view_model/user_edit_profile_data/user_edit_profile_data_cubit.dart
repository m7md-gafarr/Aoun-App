import 'dart:developer';

import 'package:aoun_app/data/model/user%20models/user_model/user_model.dart';
import 'package:aoun_app/data/repositories/local/shared_pref.dart';
import 'package:aoun_app/data/repositories/remote/api_response_handler.dart';
import 'package:aoun_app/data/repositories/remote/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'user_edit_profile_data_state.dart';

class UserEditProfileDataCubit extends Cubit<UserEditProfileDataState> {
  UserEditProfileDataCubit() : super(UserEditProfileDataInitial());

  updateUser(UserModel user) async {
    emit(UserEditProfileDataLoading());

    try {
      final response =
          await UserRepository().updateUserProfileData(usermodel: user);

      if (response.success) {
        emit(UserEditProfileDataSuccess());
      } else {
        String error = response.errors;
        emit(UserEditProfileDataFaliure(error));
      }
    } on DioException catch (e) {
      emit(UserEditProfileDataFaliure("Network error: ${e.message}"));
    } catch (e) {
      emit(UserEditProfileDataFaliure("Unexpected error: $e"));
    }
  }
}
