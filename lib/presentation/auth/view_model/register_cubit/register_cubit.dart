import 'package:aoun_app/data/model/auth_model/auth_model.dart' show AuthModel;
import 'package:aoun_app/data/repositories/remote/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> registerUser(AuthModel user) async {
    emit(RegisterLoading());

    try {
      Map<String, dynamic> response =
          await AuthenticationRepository().registerFun(user: user);

      if (response['success'] == true) {
        emit(RegisterSuccess(response['message']));
      } else {
        emit(RegisterFailure(response['error']));
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        emit(RegisterFailure("Unexpected error: $e"));
      }
    }
  }
}
