import 'package:aoun_app/data/model/trip%20models/get_trip_route/get_trip_route.dart';
import 'package:aoun_app/data/model/trip%20models/greate_trip_model/greate_trip_model.dart';
import 'package:aoun_app/data/model/trip%20models/trip_location_model.dart';
import 'package:aoun_app/data/repositories/local/shared_pref.dart';
import 'package:aoun_app/data/repositories/remote/api_helper.dart';
import 'package:aoun_app/data/repositories/remote/api_response_handler.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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

  Future<GetTripRoute> getTripRoute(LatLng from, LatLng to) async {
    String? apiKey = dotenv.env['SERVICE_MAP_API_KEY'];
    ApiResponse<Map<String, dynamic>> response =
        await ApiHelper().post<Map<String, dynamic>>(
      url: "https://routes.googleapis.com/directions/v2:computeRoutes",
      body: {
        "origin": {
          "location": {
            "latLng": {"latitude": from.latitude, "longitude": from.longitude}
          }
        },
        "destination": {
          "location": {
            "latLng": {"latitude": to.latitude, "longitude": to.longitude}
          }
        },
        "travelMode": "DRIVE",
        "routingPreference": "TRAFFIC_AWARE",
        "computeAlternativeRoutes": false,
        "routeModifiers": {
          "avoidTolls": false,
          "avoidHighways": false,
          "avoidFerries": false
        },
        "languageCode": "en-US",
        "units": "METRIC"
      },
      headers: {
        'Content-Type': 'application/json',
        'X-Goog-Api-Key': '$apiKey',
        'X-Goog-FieldMask':
            'routes.duration,routes.distanceMeters,routes.polyline.encodedPolyline',
      },
    );

    return GetTripRoute.fromJson(response.data!);
  }

  Future<ApiResponse<Map<String, dynamic>>> searchTrip(
      String fromAddress, String toAddress) async {
    return await ApiHelper().get<Map<String, dynamic>>(
      url:
          "$_apiUrl/Trips/search?fromAddress=$fromAddress&toAddress=$toAddress",
    );
  }

  Future<ApiResponse<Map<String, dynamic>>> createTripRequest(
      TripLocationModel fromLocation, TripLocationModel toLocation) async {
    String token = await getToken();
    return await ApiHelper().post<Map<String, dynamic>>(
      url: "$_apiUrl/Trips/Create-or-request-trip",
      body: {
        "fromLocation": fromLocation.toJson(),
        "toLocation": toLocation.toJson()
      },
      headers: _headers(token),
    );
  }
}
