import 'package:aoun_app/core/app_color/app_color_light.dart';
import 'package:aoun_app/core/app_images/app_images.dart';
import 'package:aoun_app/core/router/route_name.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

/// SelectTypeScreen is the initial screen where users choose their role (Passenger or Driver)
/// and authentication method (Sign In or Sign Up).
///
/// This screen features:
/// - A background image
/// - Welcome message
/// - Sign In button with role selection modal
/// - Sign Up button with role selection modal and terms acceptance
class SelectTypeScreen extends StatelessWidget {
  const SelectTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Background container with decorative image
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
                  // Top spacing for status bar
                  SizedBox(height: 70.h),

                  // Welcome header text
                  Text(
                    S.of(context).select_type_welcome,
                    style: Theme.of(context).textTheme.headlineMedium!
                      ..copyWith(
                        color: AppColorLight.primaryColor,
                      ),
                  ),
                  SizedBox(height: 7.h),

                  // Instruction text
                  Text(
                    S.of(context).select_type_instruction,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Colors.white,
                        ),
                  ),

                  // Spacing before buttons
                  SizedBox(height: 440.h),

                  // Sign In Button - Opens bottom sheet for role selection
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
                              // Modal title
                              Text(
                                S.of(context).select_type_sign_in,
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              // Role selection buttons row
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  // Passenger sign in option
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
                                    text: S.of(context).select_type_passenger,
                                  ),
                                  // Driver sign in option
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
                                    text: S.of(context).select_type_driver,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: Text(S.of(context).select_type_sign_in),
                  ),

                  SizedBox(height: 15.h),

                  // Sign Up Button - Opens bottom sheet with role selection and terms
                  OutlinedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                          height: 200.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.r),
                              topRight: Radius.circular(30.r),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Modal title
                              Text(
                                S.of(context).select_type_sign_up,
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              // Role selection buttons row
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  // Passenger sign up option
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
                                    text: S.of(context).select_type_passenger,
                                  ),
                                  // Driver sign up option
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
                                    text: S.of(context).select_type_driver,
                                  ),
                                ],
                              ),
                              // Terms and Privacy Policy text
                              Padding(
                                padding: const EdgeInsets.all(13.0),
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    children: [
                                      // Terms of use agreement text
                                      TextSpan(
                                        text: S.of(context).joining_terms,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                      // Clickable Terms of Use link
                                      TextSpan(
                                        text: S.of(context).terms_of_use,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .primaryColor),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.pushNamed(
                                                context,
                                                AppRoutesName
                                                    .homeUserScreenRoute);
                                          },
                                      ),
                                      // Conjunction text
                                      TextSpan(
                                        text: S.of(context).and,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                      // Clickable Privacy Policy link
                                      TextSpan(
                                        text: S.of(context).privacy_policy,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .primaryColor),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.pushNamed(
                                                context,
                                                AppRoutesName
                                                    .homeUserScreenRoute);
                                          },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: Text(S.of(context).select_type_sign_up),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  /// Creates a selectable role type button with an icon and label
  ///
  /// Parameters:
  /// - [context]: Build context for theming
  /// - [text]: Label text for the role type
  /// - [onTap]: Callback function when the role is selected
  /// - [icon]: Icon to display above the role text
  ///
  /// Returns a styled container with icon and text, responding to tap gestures
  Widget selectType(
    BuildContext context, {
    required String text,
    required void Function()? onTap,
    required IconData? icon,
  }) {
    return InkWell(
      // Disable ripple effects for clean UI
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
