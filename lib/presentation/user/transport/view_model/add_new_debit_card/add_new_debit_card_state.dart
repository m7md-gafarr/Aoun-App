part of 'add_new_debit_card_cubit.dart';

@immutable
sealed class AddNewDebitCardState {}

final class AddNewDebitCardInitial extends AddNewDebitCardState {}

final class AddNewDebitCardLoading extends AddNewDebitCardState {}

final class AddNewDebitCardSuccess extends AddNewDebitCardState {}

final class AddNewDebitCardFailure extends AddNewDebitCardState {
  final String errorMessage;
  AddNewDebitCardFailure(this.errorMessage);
}
