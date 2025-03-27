import 'dart:async';

import 'package:aoun_app/core/utils/location/location_utils.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationProvider with ChangeNotifier {
  Position? _position;
  Placemark? _placemark;

  Position? get position => _position;
  Placemark? get placemark => _placemark;

  LocationProvider() {
    Future.microtask(() => fetchLocation());
    startLocationUpdates();
  }

  Future<void> fetchLocation() async {
    _position = await LocationService.getCurrentLocation();
    _placemark = await LocationService.getAddressFromCoordinates(
        _position!.latitude, _position!.longitude);
    notifyListeners();
  }

  void startLocationUpdates() {
    Timer.periodic(
      Duration(minutes: 1),
      (timer) async {
        await fetchLocation();
      },
    );
  }
}
