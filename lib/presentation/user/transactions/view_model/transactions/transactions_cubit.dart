import 'package:aoun_app/data/model/user%20models/user_transactaion/user_transaction_response_model/user_transaction_response_model.dart';
import 'package:aoun_app/data/repositories/remote/api_response_handler.dart';
import 'package:aoun_app/data/repositories/remote/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'transactions_state.dart';

class UserTransactionsCubit extends Cubit<UserTransactionsState> {
  UserTransactionsCubit() : super(UserTransactionsInitial());

  List<UserTransactionResponseModel> _list = [];

  transactions({bool forceRefresh = false}) async {
    if (!forceRefresh && _list.isNotEmpty) {
      emit(UserTransactionsSuccess(_list.toList()));
      return;
    }
    emit(UserTransactionsLoading());
    try {
      ApiResponse<Map<String, dynamic>> response =
          await UserRepository().gettransactions();

      if (response.success) {
        if (response.data == null || response.data!.isEmpty) {
          emit(UserTransactionsSuccess([]));
        } else {
          _list.clear();
          for (var element in response.data!['data']!) {
            _list.add(UserTransactionResponseModel.fromJson(element));
          }

          emit(UserTransactionsSuccess(_list.toList()));
        }
      } else {
        String error = response.errors;
        emit(UserTransactionsFailure(error));
      }
    } on DioException catch (e) {
      emit(UserTransactionsFailure("Network error: ${e.message}"));
    } catch (e) {
      emit(UserTransactionsFailure("Unexpected error: ${e.toString()}"));
    }
  }
}
