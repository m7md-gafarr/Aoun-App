import 'package:animations/animations.dart';
import 'package:aoun_app/core/app_images/app_images.dart';
import 'package:aoun_app/data/model/map%20models/route_model/route_model.dart';
import 'package:aoun_app/presentation/user/transport/views/map_viewr_route_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TripMapWidget extends StatelessWidget {
  TripMapWidget({super.key, this.routeModel});
  RouteModel? routeModel;
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
          openBuilder: (context, action) => MapViewRouteScreen(
            routeModel: routeModel,
          ),
          closedBuilder: (context, action) => GestureDetector(
            onTap: action,
            child: Image.asset(
              Assets.imageMapMakerMap,
            ),
          ),
        ),
      ),
    );
  }
}
