import 'package:aoun_app/data/repositories/remote/api_response_handler.dart';
import 'package:aoun_app/data/repositories/remote/trip_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'deletetrip_state.dart';

class DeletetripCubit extends Cubit<DeletetripState> {
  DeletetripCubit() : super(DeletetripInitial());

  deleteTrip(String id) async {
    emit(DeletetripLoading());
    try {
      ApiResponse<Map<String, dynamic>> response =
          await TripRepository().deleteTrip(id: id);

      if (response.success) {
        emit(DeletetripSuccess());
      } else {
        String error = response.errors;
        emit(DeletetripFailure(error));
      }
    } on DioException catch (e) {
      emit(DeletetripFailure("Network error: ${e.message}"));
    } catch (e) {
      emit(DeletetripFailure("Unexpected error: $e"));
    }
  }
}
