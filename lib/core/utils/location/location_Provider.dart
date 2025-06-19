import 'dart:async';
import 'dart:developer';
import 'package:aoun_app/core/utils/location/location_utils.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationProvider with ChangeNotifier {
  Position? _position;
  Placemark? _placemark;
  StreamSubscription<Position>? _positionStream;

  Position? get position => _position;
  Placemark? get placemark => _placemark;

  void startListening(BuildContext context) async {
    _positionStream = LocationService.getLocationStream(context).listen(
      (Position newPosition) async {
        _position = newPosition;

        _placemark = await LocationService.getAddressFromCoordinates(
          context,
          newPosition.latitude,
          newPosition.longitude,
        );

        notifyListeners();
      },
    );
  }

  @override
  void dispose() {
    _positionStream?.cancel();
    super.dispose();
  }
}
