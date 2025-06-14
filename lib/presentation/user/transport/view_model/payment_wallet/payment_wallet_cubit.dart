import 'package:aoun_app/core/utils/extract_user_info_from_token.dart';
import 'package:aoun_app/data/repositories/local/shared_pref.dart';
import 'package:aoun_app/data/repositories/remote/api_response_handler.dart';
import 'package:aoun_app/data/repositories/remote/payment_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'payment_wallet_state.dart';

class PaymentWalletCubit extends Cubit<PaymentWalletState> {
  PaymentWalletCubit() : super(PaymentWalletInitial());

  Future<void> paymentWallet(String walletId, int amount) async {
    emit(PaymentWalletLoading());
    try {
      String? token = await SharedPreferencesService().getToken();
      String userEmail =
          extractUserInfoFromToken().extractUserEmailFromToken(token!);

      ApiResponse<Map<String, dynamic>> response = await PaymentRepository()
          .payWithWallet(walletId: walletId, amount: amount, email: userEmail);
      if (response.success && response.data!['status'] == "success") {
        emit(PaymentWalletSuccess(response.data!['redirectUrl']));
      } else if (response.success && response.data!['status'] == "failed") {
        emit(PaymentWalletFailure(response.data!['message']));
      } else {
        emit(PaymentWalletFailure(response.errors));
      }
    } catch (e) {
      emit(PaymentWalletFailure(e.toString()));
    }
  }
}
