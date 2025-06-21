import 'package:aoun_app/data/model/user_models/user_transactaion/user_transaction_response_model/user_transaction_response_model.dart';
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
          print("ℹ️ No transactions found (empty data)");
          emit(UserTransactionsSuccess([]));
        } else {
          _list.clear();
          print("📦 Parsing transaction list...");
          for (var element in response.data!['data']!) {
            final item = UserTransactionResponseModel.fromJson(element);
            _list.add(item);
          }
          print("✅ Parsed ${_list.length} transactions");
          emit(UserTransactionsSuccess(_list.toList()));
        }
      } else {
        String error = response.errors;
        print("❌ API returned error: $error");
        emit(UserTransactionsFailure(error));
      }
    } on DioException catch (e) {
      print("🔥 DioException: ${e.message}");
      emit(UserTransactionsFailure("Network error: ${e.message}"));
    } catch (e) {
      print("❗ Unexpected error: ${e.toString()}");
      emit(UserTransactionsFailure("Unexpected error: ${e.toString()}"));
    }
  }
}
