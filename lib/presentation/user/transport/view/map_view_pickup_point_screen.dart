import 'package:aoun_app/core/app_images/app_images.dart';
import 'package:aoun_app/core/constant/constant.dart';
import 'package:aoun_app/core/utils/location/location_utils.dart';
import 'package:aoun_app/core/utils/map/google_map.dart';
import 'package:aoun_app/data/model/trip_models/trip_location_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax/iconsax.dart';

class MapViewPickupPointScreen extends StatefulWidget {
  MapViewPickupPointScreen({super.key, required this.locationModel});
  TripLocationModel locationModel;
  @override
  State<MapViewPickupPointScreen> createState() => _MapViewRouteScreenState();
}

class _MapViewRouteScreenState extends State<MapViewPickupPointScreen> {
  late GoogleMapController _mapController;
  Set<Marker> marker = {};
  late CameraPosition cameraPosition;

  @override
  void initState() {
    super.initState();
    cameraPosition = GoogleMapUtils.intialCameraPosition;
  }

  onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    getMyLocation();
  }

  getMyLocation() async {
    Position? position = await LocationService.getCurrentLocation(context);
    BitmapDescriptor pickupPointMarker =
        await GoogleMapUtils.bitmapDescriptorFromSvgAsset(
            Assets.imageMapMakerMakerPickupPoint);
    BitmapDescriptor myLocationMarker =
        await GoogleMapUtils.bitmapDescriptorFromSvgAsset(
            Assets.imageMapMakerMyMakerLive);
    marker.add(
      Marker(
        markerId: MarkerId("pickupPointMarker"),
        icon: pickupPointMarker,
        position: LatLng(
          widget.locationModel.latitude!,
          widget.locationModel.longitude!,
        ),
      ),
    );
    marker.add(
      Marker(
        markerId: MarkerId("myLocationMarker"),
        icon: myLocationMarker,
        position: LatLng(position!.latitude, position.longitude),
      ),
    );
    LatLngBounds? bounds = GoogleMapUtils.getBoundRoute([
      LatLng(position.latitude, position.longitude),
      LatLng(widget.locationModel.latitude!, widget.locationModel.longitude!)
    ]);
    _mapController.animateCamera(
      CameraUpdate.newLatLngBounds(
        LatLngBounds(southwest: bounds.southwest, northeast: bounds.northeast),
        100,
      ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            markers: marker,
            zoomControlsEnabled: false,
            initialCameraPosition: cameraPosition,
            onMapCreated: onMapCreated,
          ),
          Positioned(
            top: 20.h,
            left: isRTL(context) ? null : 20,
            right: isRTL(context) ? 20 : null,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                isRTL(context) ? Iconsax.arrow_right_1 : Iconsax.arrow_left,
                size: 30,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
