import 'package:aoun_app/data/model/user%20models/user_model/user_model.dart';
import 'package:aoun_app/data/repositories/remote/api_response_handler.dart';
import 'package:aoun_app/data/repositories/remote/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'get_user_info_state.dart';

class GetUserInfoCubit extends Cubit<GetUserInfoState> {
  GetUserInfoCubit() : super(GetUserInfoInitial());

  UserModel? _cachedUser;
  UserModel get userData => _cachedUser!;

  getUserInformation(BuildContext context, {bool forceRefresh = false}) async {
    if (!forceRefresh && _cachedUser != null) {
      emit(GetUserInfoInitialSuccess(_cachedUser!));
      return;
    }

    try {
      emit(GetUserInfoInitialLoading());

      ApiResponse<Map<String, dynamic>> response =
          await UserRepository().getUserInformation();

      if (response.success) {
        _cachedUser = UserModel.fromJson(response.data!['data']);

        emit(GetUserInfoInitialSuccess(_cachedUser!));
      } else {
        String error = response.errors;

        emit(GetUserInfoInitialFailure(error));
      }
    } on DioException catch (e) {
      emit(GetUserInfoInitialFailure("Network error: ${e.message}"));
    } catch (e) {
      emit(GetUserInfoInitialFailure("Unexpected error login: $e"));
    }
  }
}
