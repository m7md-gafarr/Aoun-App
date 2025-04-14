import 'package:aoun_app/core/router/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class AppbarWidgetWelcomeAndNotification extends StatelessWidget {
  const AppbarWidgetWelcomeAndNotification({super.key, required this.userName});
  final String userName;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: false,
      snap: true,
      floating: true,
      stretch: true,
      actions: [
        SizedBox(width: 13.w),
        Text(
          "Welcome $userName ,",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Spacer(
          flex: 1,
        ),
        InkWell(
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () => Navigator.pushNamed(
              context, AppRoutesName.userNotificationScreenRoute),
          child: Icon(
            Iconsax.notification,
            color: Theme.of(context).primaryColor,
          ),
        ),
        SizedBox(width: 13.w),
        InkWell(
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () => Navigator.pushNamed(
              context, AppRoutesName.userProfileScreenRoute),
          child: CircleAvatar(
            maxRadius: 13.w,
          ),
        ),
        SizedBox(width: 13.w),
      ],
    );
  }
}
