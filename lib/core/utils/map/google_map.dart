import 'dart:math';
import 'dart:ui' as ui;

import 'package:aoun_app/data/model/map%20models/palce_autocomplete_model/palce_autocomplete_model.dart';
import 'package:aoun_app/data/model/map%20models/palce_latlng_model/palce_latlng_model.dart';
import 'package:aoun_app/data/model/map%20models/route_model/route_model.dart';
import 'package:aoun_app/data/repositories/remote/api_helper.dart';
import 'package:aoun_app/data/repositories/remote/api_response_handler.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapUtils {
  final Dio dio = Dio();
  final String? _apiKey = dotenv.env['SERVICE_MAP_API_KEY'];
  static CameraPosition intialCameraPosition = CameraPosition(
    target: LatLng(26.74869101049492, 29.91485567756057),
    zoom: 5.65,
  );
  static Future<BitmapDescriptor> bitmapDescriptorFromSvgAsset(
    String assetName, [
    ui.Size size = const ui.Size(50, 50),
  ]) async {
    final pictureInfo = await vg.loadPicture(SvgAssetLoader(assetName), null);

    double devicePixelRatio =
        ui.PlatformDispatcher.instance.views.first.devicePixelRatio;
    int width = (size.width * devicePixelRatio).toInt();
    int height = (size.height * devicePixelRatio).toInt();

    final scaleFactor = min(
      width / pictureInfo.size.width,
      height / pictureInfo.size.height,
    );

    final recorder = ui.PictureRecorder();
    final canvas = ui.Canvas(recorder);

    canvas.scale(scaleFactor, scaleFactor);

    canvas.drawPicture(pictureInfo.picture);

    final rasterPicture = recorder.endRecording();
    final image = await rasterPicture.toImage(width, height);
    final bytes = (await image.toByteData(format: ui.ImageByteFormat.png))!;

    return BitmapDescriptor.fromBytes(bytes.buffer.asUint8List());
  }

  static List<LatLng> decodePolyline(String encoded) {
    List<LatLng> points = [];
    int index = 0, len = encoded.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int b, shift = 0, result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
      lat += dlat;

      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
      lng += dlng;

      points.add(LatLng(lat / 1E5, lng / 1E5));
    }

    return points;
  }

  static LatLngBounds getBoundRoute(List<LatLng> list) {
    if (list.isEmpty) {
      return LatLngBounds(
        southwest: LatLng(0, 0),
        northeast: LatLng(0, 0),
      );
    }

    double minLat = list[0].latitude;
    double maxLat = list[0].latitude;
    double minLng = list[0].longitude;
    double maxLng = list[0].longitude;

    for (LatLng point in list) {
      minLat = min(point.latitude, minLat);
      maxLat = max(point.latitude, maxLat);
      minLng = min(point.longitude, minLng);
      maxLng = max(point.longitude, maxLng);
    }
    return LatLngBounds(
      southwest: LatLng(minLat, minLng),
      northeast: LatLng(maxLat, maxLng),
    );
  }

  Future<PalceAutocompleteModel> getSuggestionPlaces(
    String input,
    String sessiontoken,
  ) async {
    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request =
        '$baseURL?input=$input&key=$_apiKey&components=country:eg&sessiontoken=$sessiontoken';
    ApiResponse<Map<String, dynamic>> response =
        await ApiHelper().get(url: request);

    if (response.success) {
      return PalceAutocompleteModel.fromJson(response.data!);
    } else {
      throw Exception("Failed to load Suggestion: ${response.errors}");
    }
  }

  Future<PalceLatlngModel> getPlaceLatLng(
    String placeId,
    String sessiontoken,
  ) async {
    String baseURL = 'https://maps.googleapis.com/maps/api/place/details/json';
    String request =
        '$baseURL?place_id=$placeId&key=$_apiKey&sessiontoken=$sessiontoken';
    ApiResponse<Map<String, dynamic>> response =
        await ApiHelper().get(url: request);

    if (response.success) {
      return PalceLatlngModel.fromJson(response.data!['result']['geometry']);
    } else {
      throw Exception("Failed to load places: ${response.errors}");
    }
  }

  Future<RouteModel> getRoute(
    LatLng from,
    LatLng to,
  ) async {
    ApiResponse<Map<String, dynamic>> response = await ApiHelper().post(
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
          "Content-Type": "application/json",
          "X-Goog-FieldMask":
              "routes.duration,routes.distanceMeters,routes.polyline.encodedPolyline",
          "X-Goog-Api-Key": "$_apiKey"
        });

    if (response.success) {
      return RouteModel.fromJson(response.data!);
    } else {
      throw Exception("Failed to load route: ${response.errors}");
    }
  }
}
