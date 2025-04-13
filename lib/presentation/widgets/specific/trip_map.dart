import 'package:animations/animations.dart';
import 'package:aoun_app/core/app_images/app_images.dart';
import 'package:aoun_app/presentation/user/transport/views/mapViewRoute_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            child: Image.asset(
              Assets.imageMap,
            ),
          ),
        ),
      ),
    );
  }
}
