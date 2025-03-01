import 'package:aoun_app/core/app_images/app_images.dart';
import 'package:aoun_app/core/constant/constant.dart';
import 'package:aoun_app/core/router/route_name.dart';

import 'package:aoun_app/core/utils/location_utils.dart';
import 'package:aoun_app/data/model/auth_model/auth_model.dart';

import 'package:aoun_app/generated/l10n.dart';
import 'package:aoun_app/presentation/auth/view_model/login_cubit/login_cubit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool obscureText = true;
  _obscureText_fun() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  _checkPermissionsLocation() async {
    await LocationService.checkPermissions();
  }

  @override
  void initState() {
    _checkPermissionsLocation();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
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
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email';
                      } else if (!RegExp(
                              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                          .hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.send_1),
                      hintText: S.of(context).email,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  // Password input field
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      //else if (!RegExp(
                      //         r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*]).{8,}$')
                      //     .hasMatch(value)) {
                      //   return 'Password must contain at least one uppercase letter, one number, and one special character';
                      // }
                      return null;
                    },
                    obscureText: obscureText,
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: InputDecoration(
                      errorMaxLines: 2,
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
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        context.read<LoginCubit>().loginUser(
                              AuthModel(
                                email: _emailController.text.trim(),
                                password: _passwordController.text.trim(),
                              ),
                            );
                      }
                    },
                    child: BlocConsumer<LoginCubit, LoginState>(
                      listener: (context, state) {
                        if (state is LoginFailure) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(
                                "Warning",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              content: Text(state.errorMessage),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text("Cancel"),
                                ),
                              ],
                            ),
                          );
                        } else if (state is LoginSuccess) {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            AppRoutesName.homeScreenRoute,
                            (route) => false,
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is LoginLoading) {
                          return SizedBox(
                            height: 30,
                            width: 30,
                            child: CircularProgressIndicator(
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                          );
                        } else {
                          return Text(S.of(context).sign_in);
                        }
                      },
                    ),
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
                        child: Center(
                          child: SvgPicture.asset(
                            Assets.imageFacebook,
                            height: 30.h,
                            fit: BoxFit.contain,
                          ),
                        ),
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
