import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationService {
  static Future<void> checkPermissions() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print("❌ Location service is not enabled!");
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print("🚫 Site permission denied!");
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print(
          "❗ Location permission is permanently denied, enable it from settings!");
      return;
    }
  }

  static Future<Position?> getCurrentLocation() async {
    await checkPermissions();
    try {
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    } catch (e) {
      print("⚠️ Error getting location: $e");
      return null;
    }
  }

  static Future<Placemark?> getAddressFromCoordinates(
      double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      return placemarks.isNotEmpty ? placemarks.first : null;
    } catch (e) {
      print("⚠️ Error fetching address: $e");
      return null;
    }
  }
}
