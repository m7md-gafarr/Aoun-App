part of 'view_all_debit_card_cubit.dart';

@immutable
sealed class ViewAllDebitCardState {}

final class ViewAllDebitCardInitial extends ViewAllDebitCardState {}

final class ViewAllDebitCardLoading extends ViewAllDebitCardState {}

final class ViewAllDebitCardSuccess extends ViewAllDebitCardState {
  final List<DebitCardModel> debitCardList;

  ViewAllDebitCardSuccess(this.debitCardList);
}

final class ViewAllDebitCardNull extends ViewAllDebitCardState {}

final class ViewAllDebitCardFailure extends ViewAllDebitCardState {
  final String errorMessage;
  ViewAllDebitCardFailure(this.errorMessage);
}
