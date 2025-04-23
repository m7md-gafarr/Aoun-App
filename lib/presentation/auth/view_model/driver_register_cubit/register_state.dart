part of 'register_cubit.dart';

@immutable
sealed class DriverRegisterState {}

class DriverRegisterInitial extends DriverRegisterState {}

class DriverRegisterLoading extends DriverRegisterState {}

class DriverRegisterSuccess extends DriverRegisterState {
  final String message;
  DriverRegisterSuccess(this.message);
}

class DriverRegisterFailure extends DriverRegisterState {
  final String errorMessage;
  DriverRegisterFailure(this.errorMessage);
}
