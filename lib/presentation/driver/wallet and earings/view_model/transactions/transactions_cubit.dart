import 'package:aoun_app/data/model/payment_models/transaction_model/datum.dart';
import 'package:aoun_app/data/repositories/remote/api_response_handler.dart';
import 'package:aoun_app/data/repositories/remote/payment_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'transactions_state.dart';

class TransactionsCubit extends Cubit<TransactionsState> {
  TransactionsCubit() : super(TransactionsInitial());

  List<DTransaction> _list = [];
  double? _lastBalance;

  transactions({bool forceRefresh = false}) async {
    if (!forceRefresh && _list.isNotEmpty) {
      emit(TransactionsSuccess(_list.toList(), _lastBalance!));
      return;
    }
    emit(TransactionsLoading());
    try {
      ApiResponse<Map<String, dynamic>> response =
          await PaymentRepository().transactions();

      if (response.success) {
        if (response.data == null || response.data!.isEmpty) {
          emit(TransactionsSuccess([], 0));
        } else {
          _list.clear();
          for (var element in response.data!['data']!) {
            _list.add(DTransaction.fromJson(element));
          }

          double balance =
              (response.data!['currentBalance'] as num?)?.toDouble() ?? 0;
          _lastBalance = balance;

          emit(TransactionsSuccess(_list.toList(), balance));
        }
      } else {
        String error = response.errors;
        emit(TransactionsFailure(error));
      }
    } on DioException catch (e) {
      emit(TransactionsFailure("Network error: ${e.message}"));
    } catch (e) {
      emit(TransactionsFailure("Unexpected error: ${e.toString()}"));
    }
  }
}
