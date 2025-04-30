import 'package:aoun_app/core/router/route_name.dart';
import 'package:aoun_app/core/utils/location/location_Provider.dart';
import 'package:aoun_app/core/utils/location/location_utils.dart';
import 'package:aoun_app/data/model/auth%20models/user_auth_model/auth_model.dart';
import 'package:aoun_app/data/model/auth%20models/user_auth_model/location.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:aoun_app/presentation/auth/view_model/user_register_cubit/register_cubit.dart';
import 'package:aoun_app/presentation/widgets/common/appBar_widget.dart';
import 'package:aoun_app/presentation/widgets/common/error_dialog_widget.dart';
import 'package:aoun_app/presentation/widgets/common/success_dialog_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

class UserRegisterScreen extends StatefulWidget {
  const UserRegisterScreen({super.key});

  @override
  State<UserRegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<UserRegisterScreen> {
  GlobalKey<FormState> formKey = GlobalKey();

  late TextEditingController _dateController;
  late TextEditingController _fullNameController;
  late TextEditingController _emailController;

  late TextEditingController _passwordController;

  bool isPhoneValidated = false;
  int? _selectedGender;
  bool obscureTextPassword = true;
  Position? _position;
  Placemark? _placemark;
  int _age = 0;
  String? phoneNumber;
  @override
  void initState() {
    _dateController = TextEditingController();
    _fullNameController = TextEditingController();
    _emailController = TextEditingController();

    _passwordController = TextEditingController();
    _getLocation();
    super.initState();
  }

  _getLocation() async {
    _position = await LocationService.getCurrentLocation(context);
    _placemark = await LocationService.getAddressFromCoordinates(
        context, _position!.latitude, _position!.longitude);
  }

  _obscureTextPassword_fun() {
    setState(() {
      obscureTextPassword = !obscureTextPassword;
    });
  }

  @override
  void dispose() {
    _dateController.dispose();
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      body: Form(
        key: formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 13.0, right: 13),
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
                  SizedBox(height: 7.h),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _fullNameController,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).please_enter_name;
                      } else if (value.length < 5) {
                        return S.of(context).name_length_validation;
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
                      prefixIcon: const Icon(Iconsax.send_1),
                      hintText: S.of(context).email,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  FormBuilderRadioGroup<int>(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.user_tag),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    name: 'gender',
                    validator: (value) {
                      if (value == null) {
                        return S.of(context).select_gender;
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
                          value: 1, child: Text(S.of(context).male)),
                      FormBuilderFieldOption(
                          value: 2, child: Text(S.of(context).female)),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.datetime,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).select_birthdate;
                      } else if (_age < 5) {
                        return S.of(context).age_validation;
                      }
                      return null;
                    },
                    onTap: () async {
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
                    },
                    controller: _dateController,
                    readOnly: true,
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.calendar_1),
                      hintText: S.of(context).date_of_birth,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: IntlPhoneField(
                      onChanged: (phone) {
                        phoneNumber = phone.completeNumber;
                      },
                      validator: (value) {
                        if (value == null) {
                          return S.of(context).phone_number_required;
                        }

                        return null;
                      },
                      languageCode: "en",
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        hintText: S.of(context).login_phone_number,
                      ),
                      initialCountryCode: 'EG',
                    ),
                  ),
                  SizedBox(height: 15.h),
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
                    controller: _passwordController,
                  ),
                  SizedBox(height: 15.h),
                  ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();

                        context.read<UserRegisterCubit>().registerUser(
                              UserAuthModel(
                                fullName: _fullNameController.text.trim(),
                                email: _emailController.text.trim(),
                                userType: 0,
                                password: _passwordController.text.trim(),
                                confirmedPassword:
                                    _passwordController.text.trim(),
                                gender: _selectedGender,
                                registrationDate: DateTime.now(),
                                age: _age,
                                phoneNumber: phoneNumber?.trim() ?? '',
                              ),
                              LocationModel(
                                city: Provider.of<LocationProvider>(
                                  context,
                                  listen: false,
                                ).placemark!.subAdministrativeArea,
                                country: Provider.of<LocationProvider>(
                                  context,
                                  listen: false,
                                ).placemark!.country,
                                latitude: Provider.of<LocationProvider>(
                                  context,
                                  listen: false,
                                ).position!.latitude,
                                longitude: Provider.of<LocationProvider>(
                                  context,
                                  listen: false,
                                ).position!.longitude,
                              ),
                              context,
                            );
                      }
                    },
                    child: BlocConsumer<UserRegisterCubit, UserRegisterState>(
                      listener: (context, state) {
                        if (state is RegisterFailure) {
                          ErrorDialogWidget(message: state.errorMessage)
                              .show(context);
                        } else if (state is RegisterSuccess) {
                          SuccessDialogWidget(
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
                                child: Text(S.of(context).ok_AlertDialogt),
                              ),
                            ],
                          ).show(context);
                        }
                      },
                      builder: (context, state) {
                        if (state is RegisterLoading) {
                          return SizedBox(
                            height: 30,
                            width: 30,
                            child: CircularProgressIndicator(
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                          );
                        } else {
                          return Text(S.of(context).sign_up);
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 15.h),
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
                              Navigator.pushNamed(
                                  context, AppRoutesName.loginScreenRoute,
                                  arguments: "user");
                            },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
