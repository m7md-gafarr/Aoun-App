part of 'driver_edit_profile_data_cubit.dart';

@immutable
sealed class DriverEditProfileDataState {}

final class DriverEditProfileDataInitial extends DriverEditProfileDataState {}

final class DriverEditProfileDataLoading extends DriverEditProfileDataState {}

final class DriverEditProfileDataSuccess extends DriverEditProfileDataState {}

final class DriverEditProfileDataFaliure extends DriverEditProfileDataState {
  String errorMessage;
  DriverEditProfileDataFaliure(this.errorMessage);
}
