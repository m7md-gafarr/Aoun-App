part of 'driver_dashboard_cubit.dart';

@immutable
sealed class DriverDashboardState {}

final class DriverDashboardInitial extends DriverDashboardState {}

final class DriverDashboardLoading extends DriverDashboardState {}

final class DriverDashboardSuccess extends DriverDashboardState {
  final DriverDashboardModel dashboardModel;
  DriverDashboardSuccess(this.dashboardModel);
}

final class DriverDashboardFailure extends DriverDashboardState {
  final String errorMessage;
  DriverDashboardFailure(this.errorMessage);
}
