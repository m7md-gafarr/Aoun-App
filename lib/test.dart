import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  late CameraPosition cameraPosition;
  @override
  void initState() {
    super.initState();
    cameraPosition = CameraPosition(
      target: LatLng(31.097804426099284, 30.944998274515168),
      zoom: 10,
    );
  }

  onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Map')),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: onMapCreated,
            initialCameraPosition: cameraPosition,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: ElevatedButton(
              onPressed: () {
                mapController.moveCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: LatLng(38.06423492874064, 30.34873248072883),
                      zoom: 8,
                    ),
                  ),
                );
              },
              child: Text("Change camera"),
            ),
          ),
        ],
      ),
    );
  }
}
