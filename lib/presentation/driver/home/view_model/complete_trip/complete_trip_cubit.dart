import 'package:aoun_app/data/repositories/remote/api_response_handler.dart';
import 'package:aoun_app/data/repositories/remote/trip_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'complete_trip_state.dart';

class CompleteTripCubit extends Cubit<CompleteTripState> {
  CompleteTripCubit() : super(CompleteTripInitial());

  completeTrip(int id) async {
    emit(CompleteTripLoading());
    try {
      ApiResponse<Map<String, dynamic>> response =
          await TripRepository().completeTrip(tripId: id);

      if (response.success) {
        emit(CompleteTripSuccess());
      } else {
        String error = response.errors;
        emit(CompleteTripFailure(error));
      }
    } on DioException catch (e) {
      emit(CompleteTripFailure("Network error: ${e.message}"));
    } catch (e) {
      emit(CompleteTripFailure("Unexpected error: $e"));
    }
  }
}
