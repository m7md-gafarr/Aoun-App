import 'package:aoun_app/core/app_images/app_images.dart';
import 'package:aoun_app/core/constant/constant.dart';
import 'package:aoun_app/core/utils/map/google_map.dart';
import 'package:aoun_app/data/model/map%20models/route_model/route_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax/iconsax.dart';

class MapViewRouteScreen extends StatefulWidget {
  MapViewRouteScreen({super.key, this.routeModel});
  RouteModel? routeModel;
  @override
  State<MapViewRouteScreen> createState() => _MapViewRouteScreenState();
}

class _MapViewRouteScreenState extends State<MapViewRouteScreen> {
  late GoogleMapController _mapController;
  final Set<Polyline> _polylines = {};
  Set<Marker> marker = {};
  late CameraPosition cameraPosition;

  @override
  void initState() {
    super.initState();
    cameraPosition = GoogleMapUtils.intialCameraPosition;
  }

  onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    final route = widget.routeModel;
    final routes = route?.routes;
    if (routes != null && routes.isNotEmpty && routes[0].polyline != null) {
      _setPolyline(routes[0].polyline!.encodedPolyline.toString());
    }
  }

  void _setPolyline(String encodedPolyline) async {
    final List<LatLng> decodedPolyline =
        GoogleMapUtils.decodePolyline(encodedPolyline);
    BitmapDescriptor fromMarker =
        await GoogleMapUtils.bitmapDescriptorFromSvgAsset(
            Assets.imageMapMakerMyMakerLocation);
    BitmapDescriptor toMarker =
        await GoogleMapUtils.bitmapDescriptorFromSvgAsset(
            Assets.imageMapMakerMakerUser);
    setState(() {
      _polylines.add(
        Polyline(
          startCap: Cap.roundCap,
          endCap: Cap.roundCap,
          polylineId: const PolylineId('route'),
          points: decodedPolyline,
          width: 7,
          color: Theme.of(context).primaryColor,
        ),
      );

      marker.add(
        Marker(
          markerId: MarkerId("from"),
          icon: fromMarker,
          position: decodedPolyline.first,
          anchor: Offset(0.37, 0.95),
        ),
      );
      marker.add(
        Marker(
          markerId: MarkerId("to"),
          icon: toMarker,
          position: decodedPolyline.last,
          anchor: Offset(0.35, 0.95),
        ),
      );
    });
    LatLngBounds? bounds = GoogleMapUtils.getBoundRoute(decodedPolyline);
    _mapController.animateCamera(
      CameraUpdate.newLatLngBounds(
        LatLngBounds(southwest: bounds.southwest, northeast: bounds.northeast),
        100,
      ),
    );
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
            polylines: _polylines,
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
