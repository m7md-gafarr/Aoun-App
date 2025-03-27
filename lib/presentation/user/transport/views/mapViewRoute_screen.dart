import 'package:aoun_app/core/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax/iconsax.dart';

class MapViewRouteScreen extends StatefulWidget {
  const MapViewRouteScreen({super.key});

  @override
  State<MapViewRouteScreen> createState() => _MapViewRouteScreenState();
}

class _MapViewRouteScreenState extends State<MapViewRouteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            zoomControlsEnabled: false,
            initialCameraPosition: CameraPosition(
              target: LatLng(31.097804426099284, 30.944998274515168),
              zoom: 10,
            ),
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
