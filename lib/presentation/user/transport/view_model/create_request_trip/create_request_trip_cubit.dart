import 'package:aoun_app/data/model/trip_models/trip_location_model.dart';
import 'package:aoun_app/data/repositories/remote/api_response_handler.dart';
import 'package:aoun_app/data/repositories/remote/trip_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'create_request_trip_state.dart';

class CreateRequestTripCubit extends Cubit<CreateRequestTripState> {
  CreateRequestTripCubit() : super(CreateRequestTripInitial());

  createRequestTrip(TripLocationModel from, TripLocationModel to) async {
    try {
      emit(CreateRequestTripLoading());

      ApiResponse<Map<String, dynamic>> response =
          await TripRepository().createTripRequest(from, to);

      if (response.success) {
        final message =
            response.data?['message'] ?? "Trip request created successfully";

        emit(CreateRequestTripSuccess(message));
      } else {
        emit(CreateRequestTripFailure(response.errors));
      }
    } on DioException catch (e) {
      emit(CreateRequestTripFailure("Network error: ${e.message}"));
    } catch (e) {
      emit(CreateRequestTripFailure("Unexpected error: $e"));
    }
  }

  void emitInitial() {
    emit(CreateRequestTripInitial());
  }
}
