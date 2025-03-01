import 'package:aoun_app/core/utils/check_connection/check_connection_cubit.dart';
import 'package:aoun_app/data/model/auth_model/auth_model.dart' show AuthModel;
import 'package:aoun_app/data/model/auth_model/location.dart';
import 'package:aoun_app/data/repositories/remote/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final CheckConnectionCubit connectionCubit;

  RegisterCubit(this.connectionCubit) : super(RegisterInitial());

  Future<void> registerUser(AuthModel user, LocationModel location) async {
    emit(RegisterLoading());
    if (connectionCubit.state is CheckConnectionNoInternet) {
      emit(RegisterFailure("No internet connection"));
      return;
    }
    try {
      Map<String, dynamic> response = await AuthenticationRepository()
          .register(user: user, location: location);

      if (response['successed'] == true) {
        emit(RegisterSuccess(response['message']));
      } else {
        emit(RegisterFailure(response['errors'][0]));
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {
        emit(RegisterFailure("Network error: ${e.message}"));
      }
    } catch (e) {
      emit(RegisterFailure("Unexpected error occurred : $e"));
    }
  }
}
