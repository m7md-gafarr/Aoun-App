part of 'get_driver_data_cubit.dart';

@immutable
sealed class GetDriverDataState {}

final class GetDriverDataInitial extends GetDriverDataState {}

final class GetDriverDataLoading extends GetDriverDataState {}

final class GetDriverDataSucess extends GetDriverDataState {
  final DriverModel driverdata;
  GetDriverDataSucess(this.driverdata);
}

final class GetDriverDataError extends GetDriverDataState {
  final String errorMessage;
  GetDriverDataError(this.errorMessage);
}
