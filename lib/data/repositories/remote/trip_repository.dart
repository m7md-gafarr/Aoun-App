import 'dart:developer';

import 'package:aoun_app/data/model/driver%20models/greate_trip_model/greate_trip_model.dart';
import 'package:aoun_app/data/repositories/local/shared_pref.dart';
import 'package:aoun_app/data/repositories/remote/api_helper.dart';
import 'package:aoun_app/data/repositories/remote/api_response_handler.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class TripRepository {
  final String? _apiUrl = dotenv.env['API_URL'];
  String? _token;

  Future<void> getToken() async {
    String? token = await SharedPreferencesService().getToken();
    if (token != null && token.isNotEmpty) {
      log(token);
      _token = token;
    }
  }

  Map<String, String> get _headers {
    return {
      "Content-Type": "application/json",
      "Accept": "*/*",
      "Authorization": "Bearer $_token",
    };
  }

  Future<ApiResponse<Map<String, dynamic>>> greateTrip({
    required CreateTripModel trip,
  }) async {
    await getToken();
    try {
      return await ApiHelper().post(
        url: "$_apiUrl/Trips",
        body: trip.toJson(),
        headers: _headers,
      );
    } on DioException catch (e) {
      return ApiResponseHandler.handleDioError<Map<String, dynamic>>(e);
    } catch (e) {
      log(e.toString());
      return ApiResponseHandler.handleGenericError<Map<String, dynamic>>(e);
    }
  }

  chancelTrip() {}
  getDriverAllTrip() {}
  bookUserTrip() {}
  getUserAllTrip() {}
}
