import 'package:aoun_app/core/app_images/app_images.dart';
import 'package:aoun_app/core/utils/location/location_Provider.dart';
import 'package:aoun_app/core/utils/location/location_utils.dart';
import 'package:aoun_app/core/utils/map/google_map.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

//  Test ci cd
class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  late CameraPosition cameraPosition;
  Set<Marker> myMarker = {};

  @override
  void initState() {
    cameraPosition = CameraPosition(
      target: LatLng(26.74869101049492, 29.91485567756057),
      zoom: 5.65,
    );
    super.initState();
  }

  onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    initialMapStyle();

    getLocation(context);
  }

  void initialMapStyle() async {
    var loadString = await DefaultAssetBundle.of(context)
        .loadString("assets/map_styles/light_map_style.json");
    mapController.setMapStyle(loadString);
  }

  initialMarkers(LatLng lat) async {
    BitmapDescriptor makerIcon =
        await GoogleMapUtils.bitmapDescriptorFromSvgAsset(
      Assets.imageMapMakerMyMakerLive,
    );

    myMarker.add(
      Marker(
        markerId: MarkerId("mylocation"),
        position: lat,
      ),
    );

    setState(() {});
  }

  void getLocation(BuildContext context) async {
    LocationService.getLocationStream(context).listen(
      (position) {
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 19,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Map')),
      body: Stack(
        children: [
          Consumer(
            builder: (context, value, child) => GoogleMap(
              mapToolbarEnabled: false,
              zoomControlsEnabled: false,
              myLocationButtonEnabled: false,
              markers: myMarker,
              onMapCreated: onMapCreated,
              initialCameraPosition: cameraPosition,
              myLocationEnabled: true,
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: ElevatedButton(
              onPressed: () async {
                Position? position =
                    await LocationService.getCurrentLocation(context);
                mapController.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: LatLng(position!.latitude, position.longitude),
                      zoom: 19,
                    ),
                  ),
                );
              },
              child: Text("Change camera"),
            ),
          ),
          Positioned(
            bottom: 80,
            left: 16,
            right: 16,
            child: ElevatedButton(
              onPressed: () async {
                context.read<LocationProvider>().startListening(context);
                Placemark? placemark =
                    context.read<LocationProvider>().placemark;

                print(
                    "**********************${placemark?.subAdministrativeArea}");
              },
              child: Text("Print"),
            ),
          ),
        ],
      ),
    );
  }
}
