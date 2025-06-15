part of 'transactions_cubit.dart';

@immutable
sealed class TransactionsState {}

final class TransactionsInitial extends TransactionsState {}

final class TransactionsLoading extends TransactionsState {}

final class TransactionsSuccess extends TransactionsState {
  final List<DTransaction> transactionsList;
  final double balance;
  TransactionsSuccess(this.transactionsList, this.balance);
}

final class TransactionsFailure extends TransactionsState {
  final String errorMessage;
  TransactionsFailure(this.errorMessage);
}
