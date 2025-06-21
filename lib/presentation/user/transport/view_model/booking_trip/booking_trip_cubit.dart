import 'dart:developer';

import 'package:aoun_app/data/model/trip_models/booking_trip/booking_request_trip/booking_request_trip_model/booking_request_trip_model.dart';
import 'package:aoun_app/data/model/trip_models/booking_trip/booking_response_trip_model.dart';
import 'package:aoun_app/data/repositories/remote/api_response_handler.dart';
import 'package:aoun_app/data/repositories/remote/trip_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'booking_trip_state.dart';

class BookingTripCubit extends Cubit<BookingTripState> {
  BookingTripCubit() : super(BookingTripInitial());

  bookingTrip(BookingRequestTripModel bookTrioModel) async {
    log("📤 BookingTrip started...");
    log("📝 Request data: ${bookTrioModel.toJson()}");

    try {
      emit(BookingTripLoading());

      ApiResponse<Map<String, dynamic>> response =
          await TripRepository().bookingTrip(bookTrioModel);

      log("📨 API response received");

      if (response.success) {
        log("✅ Booking successful");
        log("📦 Response data: ${response.data!['data']}");
        emit(BookingTripSucess(
            BookingResponseTripModel.fromJson(response.data!['data'])));
      } else {
        log("❌ Booking failed: ${response.errors}");
        emit(BookingTripFailure(response.errors));
      }
    } on DioException catch (e) {
      log("🌐 Dio error: ${e.message}", error: e);
      emit(BookingTripFailure("Network error: ${e.message}"));
    } catch (e, stackTrace) {
      log("❗ Unexpected error", error: e, stackTrace: stackTrace);
      emit(BookingTripFailure("Unexpected error: $e"));
    }
  }
}
