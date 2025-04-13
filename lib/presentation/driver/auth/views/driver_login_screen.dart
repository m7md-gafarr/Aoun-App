import 'package:aoun_app/core/app_images/app_images.dart';
import 'package:aoun_app/core/constant/constant.dart';
import 'package:aoun_app/core/router/route_name.dart';

import 'package:aoun_app/core/utils/location/location_utils.dart';
import 'package:aoun_app/data/model/auth_model/auth_model.dart';

import 'package:aoun_app/generated/l10n.dart';
import 'package:aoun_app/presentation/user/auth/view_model/login_cubit/login_cubit.dart';
import 'package:aoun_app/presentation/widgets/common/appBar_widget.dart';
import 'package:aoun_app/presentation/widgets/common/error_dialog_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';

class DriverLoginScreen extends StatefulWidget {
  const DriverLoginScreen({super.key});

  @override
  State<DriverLoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<DriverLoginScreen> {
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
    await LocationService.checkPermissions(context);
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
      appBar: AppbarWidget(),
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
                    padding: EdgeInsets.only(
                      right: 23.w,
                    ),
                    child: SvgPicture.asset(
                      Assets.imageLogoLogoLogin,
                      width: 160.w,
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
                        return S.of(context).enter_email;
                      } else if (!RegExp(
                              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                          .hasMatch(value)) {
                        return S.of(context).enter_valid_email;
                      }
                      return null;
                    },
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: InputDecoration(
                      prefixIcon: isRTL(context)
                          ? Icon(Iconsax.direct_left)
                          : Icon(Iconsax.direct_right),
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
                        return S.of(context).enter_password;
                      } else if (value.length < 6) {
                        return S.of(context).password_length_validation;
                      }

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
                        AppRoutesName.driverResetPasswordScreenRoute,
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
                              context,
                            );
                      }
                    },
                    child: BlocConsumer<LoginCubit, LoginState>(
                      listener: (context, state) {
                        if (state is LoginFailure) {
                          ErrorDialogWidget(message: state.errorMessage)
                              .show(context);
                        } else if (state is LoginSuccess) {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            AppRoutesName.homeUserScreenRoute,
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

                  SizedBox(height: MediaQuery.of(context).size.width / 3),
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
                              Navigator.pushNamed(context,
                                  AppRoutesName.driverRegisterScreenRoute);
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
