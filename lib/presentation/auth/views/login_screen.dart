import 'package:aoun_app/core/app_images/app_images.dart';
import 'package:aoun_app/core/constant/constant.dart';
import 'package:aoun_app/core/router/route_name.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Auto-validation mode for the form
  AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;
  // Form key for validation
  GlobalKey<FormState> formKey = GlobalKey();
  bool obscureText = true;
  _obscureText_fun() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // App logo
                  Padding(
                    padding: EdgeInsets.only(right: 23.w),
                    child: SvgPicture.asset(
                      Assets.imageLogoLogoLogin,
                      width: 170.w,
                    ),
                  ),
                  // Welcome message
                  Text(
                    S.of(context).login_welcome_back,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 7.h),
                  // Enter details text
                  Text(
                    S.of(context).login_enter_details,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  SizedBox(height: 30.h),
                  // Email or phone number input field
                  TextField(
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.send_1),
                      hintText: S.of(context).email,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  // Password input field
                  TextField(
                    obscureText: obscureText,
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.password_check),
                      hintText: S.of(context).password,
                      suffixIcon: IconButton(
                        onPressed: () {
                          _obscureText_fun();
                        },
                        icon: obscureText
                            ? const Icon(Iconsax.eye_slash)
                            : const Icon(Iconsax.eye),
                      ),
                    ),
                  ),
                  SizedBox(height: 7.h),
                  // Forgot password link
                  Align(
                    alignment: isRTL(context)
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () => Navigator.pushNamed(
                        context,
                        AppRoutesName.ResetPasswordScreenRoute,
                      ),
                      child: Text(
                        S.of(context).login_forgot_password,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  // Login button
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();

                        // Navigate to OTP verification screen
                        Navigator.pushNamed(
                          context,
                          AppRoutesName.oTPScreenRoute,
                        );
                        setState(() {
                          autovalidateMode = AutovalidateMode.disabled;
                        });
                      } else {
                        setState(
                          () {
                            autovalidateMode = AutovalidateMode.always;
                          },
                        );
                      }
                    },
                    child: Text(S.of(context).sign_in),
                  ),
                  SizedBox(height: 30.h),
                  // Divider with "or continue with" text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 100.w,
                        child: const Divider(),
                      ),
                      Text(S.of(context).login_or_continue_with,
                          style: Theme.of(context).textTheme.bodyMedium),
                      SizedBox(
                        width: 100.w,
                        child: const Divider(),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width / 15),
                  // Social media login buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 50.w,
                        width: 100.w,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).colorScheme.outline),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15))),
                      ),
                      Container(
                        height: 50.w,
                        width: 100.w,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).colorScheme.outline),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15))),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width / 13),
                  // Sign up link for new users
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: S.of(context).login_dont_have_account,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        TextSpan(
                          text: S.of(context).sign_up,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Theme.of(context).primaryColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(
                                  context, AppRoutesName.RegisterScreenRoute);
                            },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
