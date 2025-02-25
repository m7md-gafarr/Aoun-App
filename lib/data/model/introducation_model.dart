import 'package:aoun_app/core/app_images/app_images.dart';
import 'package:flutter/material.dart';
import '../../generated/l10n.dart';

class IntroductionModel {
  final String path;
  final String title;
  final String text;
  IntroductionModel({
    required this.title,
    required this.text,
    required this.path,
  });

  static List<IntroductionModel> introDataModel(BuildContext context) {
    return [
      IntroductionModel(
        title: S.of(context).intro_transport_title,
        text: S.of(context).intro_transport_text,
        path: Assets.imageIntroductionIntro1,
      ),
      IntroductionModel(
        title: S.of(context).intro_housing_title,
        text: S.of(context).intro_housing_text,
        path: Assets.imageIntroductionIntro2,
      ),
      IntroductionModel(
        title: S.of(context).intro_activities_title,
        text: S.of(context).intro_activities_text,
        path: Assets.imageIntroductionIntro3,
      ),
    ];
  }
}
