import 'package:aoun_app/core/constant/constant.dart';
import 'package:aoun_app/core/router/route_name.dart';
import 'package:aoun_app/core/utils/location_utils.dart';
import 'package:aoun_app/data/model/auth_model/auth_model.dart';
import 'package:aoun_app/data/model/auth_model/location.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:aoun_app/presentation/auth/view_model/register_cubit/register_cubit.dart';
import 'package:aoun_app/presentation/widgets/phone_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> formKeyBacisInfo = GlobalKey();
  GlobalKey<FormState> formKeyContaintInfo = GlobalKey();
  GlobalKey<FormState> formKeyLoginInfo = GlobalKey();

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  bool isPhoneValidated = false;
  int _currentStep = 0;
  int? _selectedGender;
  bool obscureTextPassword = true;
  bool obscureTextConfirmPassword = true;
  int _age = 0;
  _obscureTextPassword_fun() {
    setState(() {
      obscureTextPassword = !obscureTextPassword;
    });
  }

  _obscureTextConfirmPassword_fun() {
    setState(() {
      obscureTextConfirmPassword = !obscureTextConfirmPassword;
    });
  }

  _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _dateController.text =
            "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";

        _age = DateTime.now().year - pickedDate.year;

        if (DateTime.now().month < pickedDate.month ||
            (DateTime.now().month == pickedDate.month &&
                DateTime.now().day < pickedDate.day)) {
          _age--;
        }
      });
    }
  }

  @override
  void dispose() {
    _dateController.dispose();
    _fullName.dispose();
    _email.dispose();

    _phone.dispose();
    _password.dispose();
    _confirmPassword.dispose();

    super.dispose();
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                S.of(context).intro_getstated_button,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 7.h),
              Text(
                S.of(context).login_enter_details,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Theme(
                data: Theme.of(context).copyWith(
                    colorScheme: ColorScheme.light(
                        primary: Theme.of(context).secondaryHeaderColor)),
                child: Stepper(
                  elevation: 0,
                  controlsBuilder: (context, details) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _currentStep == 1
                          ? SizedBox.shrink()
                          : BlocConsumer<RegisterCubit, RegisterState>(
                              listener: (context, state) {
                                if (state is RegisterFailure) {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text(
                                        "Warning",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                      content: Text(state.errorMessage),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text("Cancel"),
                                        ),
                                      ],
                                    ),
                                  );
                                } else if (state is RegisterSuccess) {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text(
                                        "Account Created Successfully!",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                      content: Text(
                                        "Your account has been created successfully. Please check your email to activate your account before logging in.",
                                      ),
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
                                          child: Text("OK"),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              },
                              builder: (context, state) {
                                return ElevatedButton(
                                  onPressed: details.onStepContinue,
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: Size(120.w, 40),
                                  ),
                                  child: _currentStep == 2
                                      ? (state is RegisterLoading
                                          ? SizedBox(
                                              height: 30,
                                              width: 30,
                                              child: CircularProgressIndicator(
                                                color: Theme.of(context)
                                                    .scaffoldBackgroundColor,
                                              ),
                                            )
                                          : Text(S.of(context).sign_up))
                                      : Text(S.of(context).intro_next_button),
                                );
                              },
                            ),
                      SizedBox(
                        width: 7.w,
                      ),
                      _currentStep == 0
                          ? SizedBox(width: 120.w)
                          : OutlinedButton(
                              onPressed: details.onStepCancel,
                              style: OutlinedButton.styleFrom(
                                  fixedSize: Size(120.w, 40)),
                              child: Text("back"),
                            ),
                    ],
                  ),
                  physics: ClampingScrollPhysics(),
                  type: StepperType.vertical,
                  currentStep: _currentStep,
                  steps: [
                    Step(
                      state: _currentStep <= 0
                          ? StepState.indexed
                          : StepState.complete,
                      isActive: _currentStep >= 0,
                      title: Text("Basic info"),
                      content: Form(
                        key: formKeyBacisInfo,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: _fullName,
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                              cursorColor: Theme.of(context).primaryColor,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Iconsax.user),
                                hintText: S.of(context).full_name,
                              ),
                            ),
                            SizedBox(height: 15.h),
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: _email,
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
                            FormBuilderRadioGroup<int>(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              name: 'gender',
                              validator: (value) {
                                if (value == null) {
                                  return 'Please select a gender';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  _selectedGender = value!;
                                });
                              },
                              options: [
                                FormBuilderFieldOption(
                                    value: 0, child: Text("Male")),
                                FormBuilderFieldOption(
                                    value: 1, child: Text("Female")),
                              ],
                            ),
                            SizedBox(height: 15.h),
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              keyboardType: TextInputType.datetime,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please select a Birthdate';
                                } else if (_age < 5) {
                                  return 'Age must be at least 5 years old';
                                }
                                return null;
                              },
                              controller: _dateController,
                              readOnly: true,
                              cursorColor: Theme.of(context).primaryColor,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: _selectDate,
                                    icon: Icon(Iconsax.calendar_1)),
                                hintText: "Date of birth",
                              ),
                            ),
                            SizedBox(height: 15.h),
                          ],
                        ),
                      ),
                    ),
                    Step(
                      state: _currentStep <= 1
                          ? StepState.indexed
                          : StepState.complete,
                      isActive: _currentStep >= 1,
                      title: Text("Contact info"),
                      content: Form(
                        key: formKeyContaintInfo,
                        child: Column(
                          children: [
                            IntlPhoneField(
                              onSubmitted: (p0) => setState(() {
                                _currentStep = 2;
                              }),
                              languageCode: "en",
                              onChanged: (phone) {
                                _phone.text = phone.completeNumber;
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                hintText: S.of(context).login_phone_number,
                              ),
                              initialCountryCode: 'EG',
                            )
                          ],
                        ),
                      ),
                    ),
                    Step(
                      state: _currentStep <= 2
                          ? StepState.indexed
                          : StepState.complete,
                      isActive: _currentStep >= 2,
                      title: Text("Login info"),
                      content: Form(
                        key: formKeyLoginInfo,
                        child: Column(
                          children: [
                            TextFormField(
                              obscureText: obscureTextPassword,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
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
                              controller: _password,
                            ),
                            SizedBox(height: 15.h),
                            TextFormField(
                              obscureText: obscureTextConfirmPassword,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
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
                            SizedBox(height: 15.h),
                          ],
                        ),
                      ),
                    ),
                  ],
                  onStepContinue: () async {
                    if (_currentStep == 0) {
                      if (formKeyBacisInfo.currentState!.validate()) {
                        formKeyBacisInfo.currentState!.save();

                        if (_currentStep < 2) {
                          setState(() {
                            _currentStep++;
                          });
                        }
                      }
                    } else if (_currentStep == 1) {
                      if (formKeyContaintInfo.currentState!.validate()) {
                        formKeyContaintInfo.currentState!.save();

                        if (_currentStep < 2 && isPhoneValidated == true) {
                          setState(() {
                            _currentStep++;
                          });
                        }
                      }
                    } else if (_currentStep == 2) {
                      if (formKeyLoginInfo.currentState!.validate()) {
                        formKeyLoginInfo.currentState!.save();
                        Position? position =
                            await LocationService.getCurrentLocation();
                        Placemark? placemark =
                            await LocationService.getAddressFromCoordinates(
                                position!.latitude, position.longitude);
                        print(_fullName.text.trim());

                        context.read<RegisterCubit>().registerUser(
                              AuthModel(
                                fullName: _fullName.text.trim(),
                                email: _email.text.trim(),
                                userType: 0,
                                password: _password.text.trim(),
                                confirmedPassword: _confirmPassword.text.trim(),
                                gender: _selectedGender,
                                registrationDate: DateTime.now(),
                                age: _age,
                                phoneNumber: _phone.text.trim(),
                              ),
                              LocationModel(
                                city: placemark!.subAdministrativeArea,
                                country: placemark.country,
                                latitude: position.latitude,
                                longitude: position.longitude,
                              ),
                            );
                      }
                    }
                  },
                  onStepCancel: () {
                    if (_currentStep > 0) {
                      setState(() {
                        _currentStep--;
                      });
                    }
                  },
                ),
              ),
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
              SizedBox(height: 13.h),
            ],
          ),
        ),
      ),
    );
  }
}
