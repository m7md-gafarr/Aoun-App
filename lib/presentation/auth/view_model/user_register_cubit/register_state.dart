part of 'register_cubit.dart';

@immutable
sealed class UserRegisterState {}

class RegisterInitial extends UserRegisterState {}

class RegisterLoading extends UserRegisterState {}

class RegisterSuccess extends UserRegisterState {
  final String message;
  RegisterSuccess(this.message);
}

class RegisterFailure extends UserRegisterState {
  final String errorMessage;
  RegisterFailure(this.errorMessage);
}
