import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSelectRouteScreen extends StatefulWidget {
  const MapSelectRouteScreen({super.key});

  @override
  State<MapSelectRouteScreen> createState() => _MapSelectRouteScreenState();
}

class _MapSelectRouteScreenState extends State<MapSelectRouteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        zoomControlsEnabled: false,
        initialCameraPosition: CameraPosition(
          target: LatLng(31.097804426099284, 30.944998274515168),
          zoom: 10,
        ),
      ),
    );
  }
}
