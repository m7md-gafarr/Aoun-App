import 'package:aoun_app/data/model/driver%20models/greate_trip_model/greate_trip_model.dart';
import 'package:aoun_app/data/repositories/local/shared_pref.dart';
import 'package:aoun_app/data/repositories/remote/api_helper.dart';
import 'package:aoun_app/data/repositories/remote/api_response_handler.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class TripRepository {
  final String? _apiUrl = dotenv.env['API_URL'];

  Future<String> getToken() async {
    String? token = await SharedPreferencesService().getToken();
    if (token != null && token.isNotEmpty) {
      return token;
    } else {
      return "";
    }
  }

  Map<String, String> _headers(String token) {
    return {
      "Content-Type": "application/json",
      "Accept": "*/*",
      "Authorization": "Bearer $token",
    };
  }

  Future<ApiResponse<Map<String, dynamic>>> greateTrip({
    required CreateTripModel trip,
  }) async {
    String token = await getToken();
    return await ApiHelper().post<Map<String, dynamic>>(
      url: "$_apiUrl/Trips",
      body: trip.toJson(),
      headers: _headers(token),
    );
  }

  Future<ApiResponse<List<Map<String, dynamic>>>>
      getActiveTripRequests() async {
    return await ApiHelper().get<List<Map<String, dynamic>>>(
      url: "$_apiUrl/Trips/active-trip-requests",
    );
  }

  getDriverAllTrip() {}
  bookUserTrip() {}
  getUserAllTrip() {}
}
