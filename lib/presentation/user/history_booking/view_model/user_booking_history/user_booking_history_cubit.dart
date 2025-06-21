import 'package:aoun_app/data/model/user_models/user_booking/user_response_bookings_model/user_response_bookings_model.dart';
import 'package:aoun_app/data/repositories/remote/api_response_handler.dart';
import 'package:aoun_app/data/repositories/remote/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'user_booking_history_state.dart';

class UserBookingHistoryCubit extends Cubit<UserBookingHistoryState> {
  UserBookingHistoryCubit() : super(UserBookingHistoryInitial());

  List<UserResponseBookingsModel> _list = [];

  getBookingTrips({bool forceRefresh = false}) async {
    if (!forceRefresh && _list.isNotEmpty) {
      emit(UserBookingHistorySuccess(_list.toList()));
      return;
    }

    try {
      emit(UserBookingHistoryLoading());

      ApiResponse<Map<String, dynamic>> response =
          await UserRepository().getBookingTrip();

      if (response.success) {
        if (response.data! == null || response.data!.isEmpty) {
          emit(UserBookingHistorySuccess([]));
        } else {
          _list.clear();
          for (var element in response.data!['data']!) {
            _list.add(UserResponseBookingsModel.fromJson(element));
          }

          emit(UserBookingHistorySuccess(_list.toList()));
        }
      } else {
        String error = response.errors;

        emit(UserBookingHistoryFailure(error));
      }
    } on DioException catch (e) {
      emit(UserBookingHistoryFailure("Network error: ${e.message}"));
    } catch (e) {
      emit(UserBookingHistoryFailure("Unexpected error login: $e"));
    }
  }
}
