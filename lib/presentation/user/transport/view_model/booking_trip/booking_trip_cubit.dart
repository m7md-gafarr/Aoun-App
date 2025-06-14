import 'package:aoun_app/data/model/trip%20models/booking_trip/booking_response_trip_model.dart';
import 'package:aoun_app/data/model/trip%20models/booking_trip/booking_request_trip_model.dart';
import 'package:aoun_app/data/repositories/remote/api_response_handler.dart';
import 'package:aoun_app/data/repositories/remote/trip_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'booking_trip_state.dart';

class BookingTripCubit extends Cubit<BookingTripState> {
  BookingTripCubit() : super(BookingTripInitial());

  bookingTrip(BookingTripRequestModel bookTrioModel) async {
    try {
      emit(BookingTripLoading());
      ApiResponse<Map<String, dynamic>> response =
          await TripRepository().bookingTrip(bookTrioModel);

      if (response.success) {
        emit(BookingTripSucess(
            BookingResponseTripModel.fromJson(response.data!['data'])));
      } else {
        emit(BookingTripFailure(response.errors));
      }
    } on DioException catch (e) {
      emit(BookingTripFailure("Network error: ${e.message}"));
    } catch (e) {
      emit(BookingTripFailure("Unexpected error: $e"));
    }
  }
}
