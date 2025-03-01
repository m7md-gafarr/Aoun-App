part of 'confirm_password_cubit.dart';

@immutable
sealed class ConfirmPasswordState {}

final class ConfirmPasswordInitial extends ConfirmPasswordState {}

final class ConfirmPasswordLoading extends ConfirmPasswordState {}

final class ConfirmPasswordSuccess extends ConfirmPasswordState {
  final String message;

  ConfirmPasswordSuccess(this.message);
}

final class ConfirmPasswordFailure extends ConfirmPasswordState {
  final String errorMessage;
  ConfirmPasswordFailure(this.errorMessage);
}
