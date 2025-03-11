import 'package:animations/animations.dart';
import 'package:aoun_app/presentation/transport/views/mapViewRoute_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TripMapWidget extends StatelessWidget {
  const TripMapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(15.r)),
        child: OpenContainer(
          closedElevation: 0,
          openElevation: 0,
          transitionType: ContainerTransitionType.fadeThrough,
          openBuilder: (context, action) => MapViewRouteScreen(),
          closedBuilder: (context, action) => GestureDetector(
            onTap: action,
            child: AbsorbPointer(
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(31.097804426099284, 30.944998274515168),
                  zoom: 10,
                ),
                zoomControlsEnabled: false,
                scrollGesturesEnabled: false,
                zoomGesturesEnabled: false,
                rotateGesturesEnabled: false,
                tiltGesturesEnabled: false,
                myLocationButtonEnabled: false,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
