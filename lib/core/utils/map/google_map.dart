import 'dart:math';
import 'dart:ui' as ui;

import 'package:aoun_app/data/model/map%20models/palce_autocomplete_model/palce_autocomplete_model.dart';
import 'package:aoun_app/data/model/map%20models/palce_latlng_model/palce_latlng_model.dart';
import 'package:aoun_app/data/repositories/remote/api_helper.dart';
import 'package:aoun_app/data/repositories/remote/api_response_handler.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapUtils {
  final Dio dio = Dio();

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

  static Future<PalceAutocompleteModel> getSuggestionPlaces(
      String input, String sessiontoken) async {
    final String? placesApiKey = dotenv.env['PLACES_API_KEY'];

    String baseURL = 'https://maps.gomaps.pro/maps/api/place/autocomplete/json';
    String request =
        '$baseURL?input=$input&key=$placesApiKey&components=country:eg&sessiontoken=$sessiontoken';
    ApiResponse<Map<String, dynamic>> response =
        await ApiHelper().get(url: request);

    if (response.success) {
      return PalceAutocompleteModel.fromJson(response.data!);
    } else {
      throw Exception("Failed to load places: ${response.errors}");
    }
  }

  static Future<PalceLatlngModel> getPlaceLatLng(
      String placeId, String sessiontoken) async {
    final String? placesApiKey = dotenv.env['PLACES_API_KEY'];

    String baseURL = 'https://maps.gomaps.pro/maps/api/place/details/json';
    String request =
        '$baseURL?place_id=$placeId&key=$placesApiKey&sessiontoken=$sessiontoken';
    ApiResponse<Map<String, dynamic>> response =
        await ApiHelper().get(url: request);

    if (response.success) {
      return PalceLatlngModel.fromJson(response.data!['result']['geometry']);
    } else {
      throw Exception("Failed to load places: ${response.errors}");
    }
  }
}
