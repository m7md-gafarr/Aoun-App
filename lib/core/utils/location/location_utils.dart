import 'dart:developer';

import 'package:aoun_app/core/utils/snakbar/snackebar_helper.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationService {
  static Future<bool> checkPermissions(BuildContext context) async {
    if (!await Geolocator.isLocationServiceEnabled()) {
      SnackbarHelper.showError(context,
          title: "Location service is not enabled!");
      return false;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        _handlePermissionError(context, permission);
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      _handlePermissionError(context, permission);
      return false;
    }

    return true;
  }

  static void _handlePermissionError(
      BuildContext context, LocationPermission permission) {
    String message = permission == LocationPermission.deniedForever
        ? "Location permission is permanently denied, enable it from settings!"
        : "Site permission denied!";
    SnackbarHelper.showError(context, title: message);
  }

  static Future<Position?> getCurrentLocation(BuildContext context) async {
    if (!await checkPermissions(context)) return null;
    try {
      return await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    } catch (e) {
      log(e.toString());
      SnackbarHelper.showError(context, title: "Error getting location: $e");
      return null;
    }
  }

  static Stream<Position> getLocationStream(BuildContext context) async* {
    try {
      if (!await checkPermissions(context)) return;

      yield* Geolocator.getPositionStream(
        locationSettings: LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 2,
        ),
      ).handleError((error) {
        log(error);
        SnackbarHelper.showError(context,
            title: "Error getting location: ${error.toString()}");
      });
    } catch (e) {
      SnackbarHelper.showError(context,
          title: "Unexpected error: ${e.toString()}");
    }
  }

  static Future<Placemark?> getAddressFromCoordinates(
      BuildContext context, double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      return placemarks.isNotEmpty ? placemarks.first : null;
    } catch (e) {
      await Future.delayed(Duration(seconds: 1));
      try {
        List<Placemark> placemarks =
            await placemarkFromCoordinates(latitude, longitude);
        return placemarks.isNotEmpty ? placemarks.first : null;
      } catch (e) {
        return null;
      }
    }
  }
}
