import 'package:aoun_app/data/model/driver_models/driver_dashboard/driver_dashboard_model/driver_dashboard_model.dart';
import 'package:aoun_app/data/repositories/remote/api_response_handler.dart';
import 'package:aoun_app/data/repositories/remote/driver_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'driver_dashboard_state.dart';

class DriverDashboardCubit extends Cubit<DriverDashboardState> {
  DriverDashboardCubit() : super(DriverDashboardInitial());

  getDashboard() async {
    try {
      emit(DriverDashboardLoading());

      ApiResponse<Map<String, dynamic>> response =
          await DriverRepository().getDriverDashboard();

      if (response.data != null && response.data!.isNotEmpty) {
        emit(DriverDashboardSuccess(
          DriverDashboardModel.fromJson(response.data!),
        ));
      } else {
        emit(DriverDashboardFailure(response.errors));
      }
    } on DioException catch (e) {
      emit(DriverDashboardFailure("Network error: ${e.message}"));
    } catch (e) {
      emit(DriverDashboardFailure("Unexpected error login: $e"));
    }
  }
}
