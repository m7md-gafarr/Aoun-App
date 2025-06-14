import 'package:aoun_app/core/router/route_name.dart';
import 'package:aoun_app/core/utils/dialog/dialog_helper.dart';
import 'package:aoun_app/data/model/auth%20models/user_auth_model/auth_model.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:aoun_app/presentation/auth/view_model/confirmPassword_cubit/confirm_password_cubit.dart';
import 'package:aoun_app/presentation/widgets/common/appBar_widget.dart'
    show AppbarWidget;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class ConfirmPasswordScreen extends StatefulWidget {
  const ConfirmPasswordScreen({super.key});

  @override
  State<ConfirmPasswordScreen> createState() => _ConfirmPasswordScreenState();
}

class _ConfirmPasswordScreenState extends State<ConfirmPasswordScreen> {
  late final TextEditingController _password;
  late final TextEditingController _confirmPassword;
  late final FocusNode focusNode;
  GlobalKey<FormState> formKey = GlobalKey();

  bool obscureTextPassword = true;
  _obscureTextPassword_fun() {
    setState(() {
      obscureTextPassword = !obscureTextPassword;
    });
  }

  bool obscureTextConfirmPassword = true;
  _obscureTextConfirmPassword_fun() {
    setState(() {
      obscureTextConfirmPassword = !obscureTextConfirmPassword;
    });
  }

  @override
  void initState() {
    _password = TextEditingController();
    _confirmPassword = TextEditingController();

    focusNode = FocusNode();
    focusNode.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final email = args?['email'] ?? "Unknown Email";

    return Scaffold(
      appBar: AppbarWidget(),
      body: Form(
        key: formKey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 70.h),
                  Text(
                    S.of(context).create_new_password,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 7.h),
                  // Enter details text
                  Text(
                    S.of(context).create_password_instruction,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  SizedBox(height: 50.h),

                  TextFormField(
                    obscureText: obscureTextPassword,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).enter_password;
                      } else if (value.length < 6) {
                        return S.of(context).password_length_validation;
                      } else if (!RegExp(
                              r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*]).{8,}$')
                          .hasMatch(value)) {
                        return S.of(context).password_complexity_validation;
                      }
                      return null;
                    },
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.password_check),
                      hintText: S.of(context).password,
                      errorMaxLines: 2,
                      suffixIcon: IconButton(
                        onPressed: () {
                          _obscureTextPassword_fun();
                        },
                        icon: obscureTextPassword
                            ? const Icon(Iconsax.eye_slash)
                            : const Icon(Iconsax.eye),
                      ),
                    ),
                    focusNode: focusNode,
                    controller: _password,
                  ),
                  SizedBox(height: 15.h),
                  TextFormField(
                    obscureText: obscureTextConfirmPassword,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).enter_password;
                      } else if (value != _password.text) {
                        return S.of(context).passwords_do_not_match;
                      }
                      return null;
                    },
                    controller: _confirmPassword,
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.password_check),
                      hintText: S.of(context).confirm_password,
                      errorMaxLines: 2,
                      suffixIcon: IconButton(
                        onPressed: () {
                          _obscureTextConfirmPassword_fun();
                        },
                        icon: obscureTextConfirmPassword
                            ? const Icon(Iconsax.eye_slash)
                            : const Icon(Iconsax.eye),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        context.read<ConfirmPasswordCubit>().confirmPassword(
                              UserAuthModel(
                                email: email,
                                password: _password.text.trim(),
                                confirmedPassword: _confirmPassword.text.trim(),
                              ),
                              context,
                            );
                      }
                    },
                    child: BlocConsumer<ConfirmPasswordCubit,
                        ConfirmPasswordState>(
                      listener: (context, state) {
                        if (state is ConfirmPasswordFailure) {
                          DialogHelper(context)
                              .showErroeDialog(message: state.errorMessage);
                        } else if (state is ConfirmPasswordSuccess) {
                          DialogHelper(context).showSuccessDialog(
                            message: state.message,
                            title: S.of(context).confirmed_successfully,
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    AppRoutesName.selectTypeScreenRoute,
                                    (route) => false,
                                  );
                                },
                                child: Text(S.of(context).sign_in),
                              ),
                            ],
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is ConfirmPasswordLoading) {
                          return SizedBox(
                            height: 30,
                            width: 30,
                            child: CircularProgressIndicator(
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                          );
                        } else {
                          return Text(S.of(context).create_new_password);
                        }
                      },
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
