part of 'withdraw_from_wallet_cubit.dart';

@immutable
sealed class WithdrawFromWalletState {}

final class WithdrawFromWalletInitial extends WithdrawFromWalletState {}

final class WithdrawFromWalletLoading extends WithdrawFromWalletState {}

final class WithdrawFromWalletSuccess extends WithdrawFromWalletState {}

final class WithdrawFromWalletFailure extends WithdrawFromWalletState {
  final String errorMessage;
  WithdrawFromWalletFailure(this.errorMessage);
}
