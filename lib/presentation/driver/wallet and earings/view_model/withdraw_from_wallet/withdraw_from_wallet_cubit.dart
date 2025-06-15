import 'package:aoun_app/data/repositories/remote/api_response_handler.dart';
import 'package:aoun_app/data/repositories/remote/payment_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'withdraw_from_wallet_state.dart';

class WithdrawFromWalletCubit extends Cubit<WithdrawFromWalletState> {
  WithdrawFromWalletCubit() : super(WithdrawFromWalletInitial());

  withdrawFromWallet({required int amount}) async {
    emit(WithdrawFromWalletLoading());
    try {
      ApiResponse<Map<String, dynamic>> response =
          await PaymentRepository().withdrawFromWallet(amount: amount);

      if (response.success) {
        emit(WithdrawFromWalletSuccess());
      } else {
        String error = response.errors;
        emit(WithdrawFromWalletFailure(error));
      }
    } on DioException catch (e) {
      emit(WithdrawFromWalletFailure("Network error: ${e.message}"));
    } catch (e) {
      emit(WithdrawFromWalletFailure("Unexpected error: ${e.toString()}"));
    }
  }
}
