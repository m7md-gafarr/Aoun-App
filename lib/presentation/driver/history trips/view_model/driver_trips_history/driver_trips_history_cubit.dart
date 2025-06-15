import 'package:aoun_app/data/model/trip%20models/trip_model/trip_model.dart';
import 'package:aoun_app/data/repositories/remote/api_response_handler.dart';
import 'package:aoun_app/data/repositories/remote/trip_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'driver_trips_history_state.dart';

class DriverTripsHistoryCubit extends Cubit<DriverTripsHistoryState> {
  DriverTripsHistoryCubit() : super(DriverTripsHistoryInitial());
  List<TripModel> _list = [];
  getDriverTrips({bool forceRefresh = false}) async {
    if (!forceRefresh && _list.isNotEmpty) {
      emit(DriverTripsHistorySuccess(_list.reversed.toList()));
      return;
    }
    try {
      emit(DriverTripsHistoryInitial());

      ApiResponse<Map<String, dynamic>> response =
          await TripRepository().getDriverTrips();

      if (response.success) {
        if (response.data!['data'] == null || response.data!['data']!.isEmpty) {
          emit(DriverTripsHistorySuccess([]));
        } else {
          _list.clear();
          for (var element in response.data!['data']!) {
            _list.add(TripModel.fromJson(element));
          }

          emit(DriverTripsHistorySuccess(_list.reversed.toList()));
        }
      } else {
        String error = response.errors;
        emit(DriverTripsHistoryFailure(error));
      }
    } on DioException catch (e) {
      emit(DriverTripsHistoryFailure("Network error: ${e.message}"));
    } catch (e) {
      emit(DriverTripsHistoryFailure("Unexpected error login: $e"));
    }
  }
}
