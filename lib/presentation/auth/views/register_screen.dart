import 'package:aoun_app/core/constant/constant.dart';
import 'package:aoun_app/core/router/route_name.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;
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
      appBar: AppBar(
        leading: InkWell(
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            isRTL(context) ? Iconsax.arrow_right_1 : Iconsax.arrow_left,
            size: 30,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        title: Text(
          S.of(context).create_account,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 70.h),
                  // Welcome message
                  Text(
                    S.of(context).intro_getstated_button,
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
                      prefixIcon: const Icon(Iconsax.user),
                      hintText: S.of(context).full_name,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  TextField(
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.send_1),
                      hintText: S.of(context).email,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  TextFormField(
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
                  SizedBox(height: 15.h),
                  TextFormField(
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.password_check),
                      hintText: S.of(context).confirm_password,
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
                          AppRoutesName.completUserDataScreenRoute,
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
                    child: Text(S.of(context).sign_up),
                  ),
                  SizedBox(height: 30.h),

                  // Sign up link for new users
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: S.of(context).already_have_account,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        TextSpan(
                          text: S.of(context).sign_in,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Theme.of(context).primaryColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pop(context);
                            },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.h),

                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: S.of(context).joining_terms,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        TextSpan(
                          text: S.of(context).terms_of_use,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Theme.of(context).primaryColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(
                                  context, AppRoutesName.homeScreenRoute);
                            },
                        ),
                        TextSpan(
                          text: S.of(context).and,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        TextSpan(
                          text: S.of(context).privacy_policy,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Theme.of(context).primaryColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(
                                  context, AppRoutesName.homeScreenRoute);
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
