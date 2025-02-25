import 'package:aoun_app/core/app_images/app_images.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class ServiceModel {
  final String path;
  final String text;
  ServiceModel({required this.path, required this.text});

  static List<ServiceModel> service(BuildContext context) => [
        ServiceModel(
          path: Assets.imageServiceService1,
          text: S.of(context).safe_easy_rides,
        ),
        ServiceModel(
          path: Assets.imageServiceService2,
          text: S.of(context).find_nearby_housing,
        ),
        ServiceModel(
          path: Assets.imageServiceService3,
          text: S.of(context).activities_opportunities,
        ),
      ];
}
