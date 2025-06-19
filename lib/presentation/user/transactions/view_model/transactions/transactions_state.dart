part of 'transactions_cubit.dart';

@immutable
sealed class UserTransactionsState {}

final class UserTransactionsInitial extends UserTransactionsState {}

final class UserTransactionsLoading extends UserTransactionsState {}

final class UserTransactionsSuccess extends UserTransactionsState {
  final List<UserTransactionResponseModel> transactionsList;

  UserTransactionsSuccess(this.transactionsList);
}

final class UserTransactionsFailure extends UserTransactionsState {
  final String errorMessage;
  UserTransactionsFailure(this.errorMessage);
}
