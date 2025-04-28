import 'package:aoun_app/core/app_color/app_color_light.dart';
import 'package:aoun_app/core/app_images/app_images.dart';
import 'package:aoun_app/core/router/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class SelectTypeScreen extends StatelessWidget {
  const SelectTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              Assets.imageIntroductionIntroBackground,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 70.h),
                  Text(
                    "Welcome to  Aoun",
                    style: Theme.of(context).textTheme.headlineMedium!
                      ..copyWith(
                        color: AppColorLight.primaryColor,
                      ),
                  ),
                  SizedBox(height: 7.h),
                  // Enter details text
                  Text(
                    "Choose how you want to continue",
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  SizedBox(height: 440.h),
                  ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                          height: 150.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.r),
                              topRight: Radius.circular(30.r),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Sing In",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  selectType(
                                    context,
                                    icon: Iconsax.user,
                                    onTap: () {
                                      Navigator.pop(context);
                                      Navigator.pushNamed(
                                        context,
                                        AppRoutesName.loginScreenRoute,
                                        arguments: "user",
                                      );
                                    },
                                    text: "Passenger",
                                  ),
                                  selectType(
                                    context,
                                    icon: Iconsax.car,
                                    onTap: () {
                                      Navigator.pop(context);
                                      Navigator.pushNamed(
                                        context,
                                        AppRoutesName.loginScreenRoute,
                                        arguments: "driver",
                                      );
                                    },
                                    text: "Driver",
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: Text("Sing In"),
                  ),

                  SizedBox(height: 15.h),
                  OutlinedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                          height: 150.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.r),
                              topRight: Radius.circular(30.r),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Sing Up",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  selectType(
                                    context,
                                    icon: Iconsax.user,
                                    onTap: () {
                                      Navigator.pop(context);
                                      Navigator.pushNamed(
                                        context,
                                        AppRoutesName.userRegisterScreenRoute,
                                      );
                                    },
                                    text: "Passenger",
                                  ),
                                  selectType(
                                    context,
                                    icon: Iconsax.car,
                                    onTap: () {
                                      Navigator.pop(context);
                                      Navigator.pushNamed(
                                        context,
                                        AppRoutesName.driverRegisterScreenRoute,
                                      );
                                    },
                                    text: "Driver",
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: Text("Sing Up"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget selectType(
    BuildContext context, {
    required String text,
    required void Function()? onTap,
    required IconData? icon,
  }) {
    return InkWell(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        height: 100.w,
        width: 100.w,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              size: 25.h,
            ),
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(fontSize: 13.sp),
            )
          ],
        ),
      ),
    );
  }
}
