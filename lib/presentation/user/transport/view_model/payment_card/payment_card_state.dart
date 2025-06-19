part of 'payment_card_cubit.dart';

@immutable
sealed class PaymentCardState {}

final class PaymentCardInitial extends PaymentCardState {}

final class PaymentCardLoading extends PaymentCardState {}

final class PaymentCardSuccess extends PaymentCardState {
  // final PaymentCardResponseModel paymentCardResponseModel;
  // PaymentCardSuccess(this.paymentCardResponseModel);
}

final class PaymentCardFailure extends PaymentCardState {
  final String errorMessage;
  PaymentCardFailure(this.errorMessage);
}
