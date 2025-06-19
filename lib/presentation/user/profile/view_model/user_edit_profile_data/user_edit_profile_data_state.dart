part of 'user_edit_profile_data_cubit.dart';

@immutable
sealed class UserEditProfileDataState {}

final class UserEditProfileDataInitial extends UserEditProfileDataState {}

final class UserEditProfileDataLoading extends UserEditProfileDataState {}

final class UserEditProfileDataSuccess extends UserEditProfileDataState {}

final class UserEditProfileDataFaliure extends UserEditProfileDataState {
  String errorMessage;
  UserEditProfileDataFaliure(this.errorMessage);
}
