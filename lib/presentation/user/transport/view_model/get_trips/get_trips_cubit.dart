import 'package:aoun_app/data/model/trip%20models/trip_model/trip_model.dart';
import 'package:aoun_app/data/repositories/remote/api_response_handler.dart';
import 'package:aoun_app/data/repositories/remote/trip_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'get_trips_state.dart';

class GetTripsCubit extends Cubit<GetTripsState> {
  GetTripsCubit() : super(GetTripsInitial());

  getTrips({required bool includePast}) async {
    try {
      emit(GetTripsLoading());

      ApiResponse<Map<String, dynamic>> response =
          await TripRepository().getTrips(includePast: includePast);

      if (response.success) {
        if (response.data == null || response.data!.isEmpty) {
          emit(GetTripsSuccess([]));
        } else {
          List<TripModel> list = [];
          for (var element in response.data!['data']!) {
            list.add(TripModel.fromJson(element));
          }

          emit(GetTripsSuccess(list.reversed.toList()));
        }
      } else {
        String error = response.errors;

        emit(GetTripsError(error));
      }
    } on DioException catch (e) {
      emit(GetTripsError("Network error: ${e.message}"));
    } catch (e) {
      emit(GetTripsError("Unexpected error login: $e"));
    }
  }
}
