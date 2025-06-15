import 'package:aoun_app/core/app_color/app_color_light.dart';
import 'package:aoun_app/core/utils/dialog/dialog_helper.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:aoun_app/presentation/widgets/common/appBar_widget.dart';
import 'package:aoun_app/presentation/widgets/common/divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:url_launcher/url_launcher.dart';

class DriverSafetyScreen extends StatelessWidget {
  const DriverSafetyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: S.of(context).driver_safety_title),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).driver_safety_emergency_title,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5.h),
              Text(S.of(context).driver_safety_emergency_subtitle,
                  style: Theme.of(context).textTheme.bodyMedium),
              SizedBox(height: 10.h),
              ElevatedButton(
                onPressed: () async {
                  final Uri phoneUri = Uri(scheme: 'tel', path: '122');
                  if (await canLaunchUrl(phoneUri)) {
                    await launchUrl(phoneUri);
                  } else {
                    DialogHelper(context).showErroeDialog(
                        message: S.of(context).driver_safety_call_error);
                  }
                },
                style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                      backgroundColor:
                          WidgetStatePropertyAll(AppColorLight.errorColor),
                    ),
                child: Text(S.of(context).driver_safety_call_now),
              ),
              DividerWidget(),
              Text(
                S.of(context).driver_safety_verification_title,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5.h),
              Text(S.of(context).driver_safety_verification_subtitle,
                  style: Theme.of(context).textTheme.bodyMedium),
              DividerWidget(),
              Text(
                S.of(context).driver_safety_tips_title,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Iconsax.tick_circle,
                    size: 22.w,
                  ),
                  SizedBox(width: 5.w),
                  Expanded(
                    child: Text(
                      S.of(context).driver_safety_tip_check_plate,
                      softWrap: true,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Iconsax.tick_circle,
                    size: 22.w,
                  ),
                  SizedBox(width: 5.w),
                  Expanded(
                    child: Text(
                      S.of(context).driver_safety_tip_share_trip,
                      softWrap: true,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Iconsax.tick_circle,
                    size: 22.w,
                  ),
                  SizedBox(width: 5.w),
                  Expanded(
                    child: Text(
                      S.of(context).driver_safety_tip_seatbelt,
                      softWrap: true,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
              DividerWidget(),
              Text(
                S.of(context).driver_safety_help_title,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5.h),
              Text(S.of(context).driver_safety_help_subtitle,
                  style: Theme.of(context).textTheme.bodyMedium),
              SizedBox(height: 10.h),
              ElevatedButton(
                onPressed: () async {
                  final Uri phoneUri =
                      Uri(scheme: 'tel', path: '+201013379651');
                  if (await canLaunchUrl(phoneUri)) {
                    await launchUrl(phoneUri);
                  } else {
                    DialogHelper(context).showErroeDialog(
                        message: S.of(context).driver_safety_call_error);
                  }
                },
                child: Text(S.of(context).driver_safety_contact_support),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
