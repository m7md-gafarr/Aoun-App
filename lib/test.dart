import 'dart:math';
import 'dart:typed_data' show ByteData;
import 'dart:ui' as ui;

import 'package:aoun_app/core/app_images/app_images.dart';
import 'package:aoun_app/core/utils/location/location_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  late CameraPosition cameraPosition;
  Set<Marker> myMarker = {};
  @override
  void initState() {
    cameraPosition = CameraPosition(
      target: LatLng(31.097804426099284, 30.944998274515168),
      zoom: 10,
    );
    initialMarkers();
    super.initState();
  }

  onMapCreated(GoogleMapController controller) {
    mapController = controller;
    initialMapStyle();
  }

  void initialMapStyle() async {
    var loadString = await DefaultAssetBundle.of(context)
        .loadString("assets/map_styles/light_map_style.json");
    mapController.setMapStyle(loadString);
  }

  initialMarkers() async {
    BitmapDescriptor makerIcon = await _bitmapDescriptorFromSvgAsset(
      Assets.imageMaker,
    );
    myMarker = places
        .map(
          (e) => Marker(
            markerId: MarkerId(e.id.toString()),
            position: e.position,
            infoWindow: InfoWindow(
              title: e.name,
            ),
            icon: makerIcon,
          ),
        )
        .toSet();
    setState(() {});
  }

  Future<BitmapDescriptor> _bitmapDescriptorFromSvgAsset(
    String assetName, [
    Size size = const Size(50, 50),
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

    canvas.translate(0, height.toDouble());
    canvas.scale(scaleFactor, -scaleFactor);

    canvas.drawPicture(pictureInfo.picture);

    final rasterPicture = recorder.endRecording();
    final image = await rasterPicture.toImage(width, height);
    final bytes = (await image.toByteData(format: ui.ImageByteFormat.png))!;

    return BitmapDescriptor.fromBytes(bytes.buffer.asUint8List());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Map')),
      body: Stack(
        children: [
          GoogleMap(
            mapToolbarEnabled: false,
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
            markers: myMarker,
            onMapCreated: onMapCreated,
            initialCameraPosition: cameraPosition,
            myLocationEnabled: true,
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: ElevatedButton(
              onPressed: () async {
                Position? position = await LocationService.getCurrentLocation();
                mapController.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: LatLng(position!.latitude, position.longitude),
                      zoom: 15,
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

class PlaceModel {
  final int id;
  final String name;
  final LatLng position;

  PlaceModel({
    required this.id,
    required this.name,
    required this.position,
  });
}

List<PlaceModel> places = [
  PlaceModel(
    id: 1,
    name: "جامعة كفر الشيخ",
    position: LatLng(31.1114, 30.9406),
  ),
  PlaceModel(
    id: 2,
    name: "حديقة صنعاء",
    position: LatLng(31.1132, 30.9390),
  ),
  PlaceModel(
    id: 3,
    name: "مسجد الاستاد",
    position: LatLng(31.1165, 30.9418),
  ),
  PlaceModel(
    id: 4,
    name: "ميدان النصر",
    position: LatLng(31.1111, 30.9455),
  ),
  PlaceModel(
    id: 5,
    name: "مستشفى كفر الشيخ العام",
    position: LatLng(31.1123, 30.9371),
  ),
  PlaceModel(
    id: 6,
    name: "مول كفر الشيخ بلازا",
    position: LatLng(31.1098, 30.9325),
  ),
  PlaceModel(
    id: 7,
    name: "كوبري القنطرة",
    position: LatLng(31.1147, 30.9429),
  ),
  PlaceModel(
    id: 8,
    name: "حديقة الأسرة والطفولة",
    position: LatLng(31.1159, 30.9354),
  ),
  PlaceModel(
    id: 9,
    name: "كورنيش النيل",
    position: LatLng(31.1182, 30.9476),
  ),
  PlaceModel(
    id: 10,
    name: "مديرية الأمن",
    position: LatLng(31.1105, 30.9441),
  ),
];
