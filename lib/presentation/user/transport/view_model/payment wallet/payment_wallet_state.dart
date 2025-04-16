part of 'payment_wallet_cubit.dart';

@immutable
sealed class PaymentWalletState {}

final class PaymentWalletInitial extends PaymentWalletState {}

final class PaymentWalletLoading extends PaymentWalletState {}

final class PaymentWalletSuccess extends PaymentWalletState {
  final String url;
  PaymentWalletSuccess(this.url);
}

final class PaymentWalletFailure extends PaymentWalletState {
  final String errorMessage;
  PaymentWalletFailure(this.errorMessage);
}
