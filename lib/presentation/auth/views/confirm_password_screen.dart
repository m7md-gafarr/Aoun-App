import 'package:aoun_app/core/constant/constant.dart';
import 'package:aoun_app/core/router/route_name.dart';
import 'package:aoun_app/data/model/auth_model/auth_model.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:aoun_app/presentation/auth/view_model/confirmPassword_cubit/confirm_password_cubit.dart';
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
          S.of(context).reset_password_title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
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
                        return 'Please enter a password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      } else if (!RegExp(
                              r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*]).{8,}$')
                          .hasMatch(value)) {
                        return 'Password must contain at least one uppercase letter, one number, and one special character';
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
                        return 'Please enter a password';
                      } else if (value != _password.text) {
                        return 'The passwords do not match.';
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
                              AuthModel(
                                email: email,
                                password: _password.text.trim(),
                                confirmedPassword: _confirmPassword.text.trim(),
                              ),
                            );
                      }
                    },
                    child: BlocConsumer<ConfirmPasswordCubit,
                        ConfirmPasswordState>(
                      listener: (context, state) {
                        if (state is ConfirmPasswordFailure) {
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
                        } else if (state is ConfirmPasswordSuccess) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(
                                "Confirmed successfully!",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              content: Text(
                                  "Your password has been reset successfully. You can now log in."),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      AppRoutesName.loginScreenRoute,
                                      (route) => false,
                                    );
                                  },
                                  child: Text("Login"),
                                ),
                              ],
                            ),
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
