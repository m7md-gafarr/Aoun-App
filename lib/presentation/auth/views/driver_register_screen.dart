import 'dart:io';

import 'package:aoun_app/core/constant/constant.dart';
import 'package:aoun_app/core/router/route_name.dart';
import 'package:aoun_app/core/utils/dialog/dialog_helper.dart';
import 'package:aoun_app/core/utils/location/location_Provider.dart';
import 'package:aoun_app/core/utils/snakbar/snackebar_helper.dart';
import 'package:aoun_app/core/utils/validation_utils.dart';
import 'package:aoun_app/data/model/auth%20models/driver_auth_model/driver_auth_model.dart';
import 'package:aoun_app/data/model/auth%20models/driver_auth_model/locations_json.dart';
import 'package:aoun_app/data/model/auth%20models/driver_auth_model/vehicle_info_json.dart';
import 'package:aoun_app/data/model/auth%20models/register_driver_model/register_driver_model.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:aoun_app/presentation/auth/view_model/driver_register_cubit/register_cubit.dart';
import 'package:aoun_app/presentation/auth/views/driver_image_register_detail.dart';
import 'package:aoun_app/presentation/widgets/common/appBar_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

class DriverRegisterScreen extends StatefulWidget {
  const DriverRegisterScreen({super.key});

  @override
  State<DriverRegisterScreen> createState() => _RegisterDriverScreenState();
}

class _RegisterDriverScreenState extends State<DriverRegisterScreen> {
  late PageController _pageController;
  late TextEditingController _dateOfBirthController;
  late TextEditingController _dateExpirationDateController;
  late TextEditingController _fullNameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _idController;
  late TextEditingController _licenseController;
  late TextEditingController _vehicleBrandController;
  late TextEditingController _vehicleModelController;
  late TextEditingController _vehicleColorController;
  late TextEditingController _vehicleYearController;
  late TextEditingController _plateNumberController;
  late TextEditingController _seatsNumberController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  GlobalKey<FormState> personalInformationFormKey = GlobalKey();
  GlobalKey<FormState> driverLicenseFormKey = GlobalKey();
  GlobalKey<FormState> personalDocumentsFormKey = GlobalKey();
  GlobalKey<FormState> vehicleInformationFormKey = GlobalKey();
  GlobalKey<FormState> loginInformationFormKey = GlobalKey();

  int _currentPage = 1;
  File? _personalImageFile;
  File? _driverLicenseFront;
  File? _driverLicenseBack;
  File? _selfieWithLicense;
  File? _nationalID;
  File? _nationalIDBack;
  File? _criminalStatusRecord;
  File? _vehiclePicture;
  File? _vehicleRegistrationCertificate;
  File? _vehicleRegistrationBack;
  int? _selectedGender;
  int _age = 0;
  String? phoneNumber;

  void _goToNextStep() {
    _pageController.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    setState(() {
      _currentPage++;
    });
  }

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
    _pageController = PageController();
    _dateOfBirthController = TextEditingController();
    _dateExpirationDateController = TextEditingController();
    _fullNameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _idController = TextEditingController();
    _licenseController = TextEditingController();
    _vehicleBrandController = TextEditingController();
    _vehicleModelController = TextEditingController();
    _vehicleColorController = TextEditingController();
    _vehicleYearController = TextEditingController();
    _plateNumberController = TextEditingController();
    _seatsNumberController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    context.read<LocationProvider>().startListening(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _phoneController.dispose();
    _fullNameController.dispose();
    _emailController.dispose();
    _dateOfBirthController.dispose();
    _dateExpirationDateController.dispose();
    _idController.dispose();
    _licenseController.dispose();
    _vehicleBrandController.dispose();
    _vehicleModelController.dispose();
    _vehicleColorController.dispose();
    _vehicleYearController.dispose();
    _plateNumberController.dispose();
    _seatsNumberController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: S.of(context).driver_register_title,
      ),
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                _currentPage = index + 1;
              });
            },
            controller: _pageController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              _personalInformationWidget(),
              _driverLicenseWidget(),
              _personalDocumentsWidget(),
              _vehicleInformationWidget(),
              _LoginInformationWidget()
            ],
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(
              "$_currentPage",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              " of ",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
            Text(
              "5",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Spacer(),
            SizedBox(
              width: 50.w,
              child: OutlinedButton(
                onPressed: () {
                  _pageController.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: Icon(
                  isRTL(context) ? Iconsax.backward : Iconsax.arrow_left_2,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            SizedBox(width: 10.w),
            SizedBox(
              width: 160.w,
              child: ElevatedButton(
                onPressed: () {
                  switch (_currentPage - 1) {
                    case 0: // Personal Information
                      print(phoneNumber);
                      if (personalInformationFormKey.currentState!.validate()) {
                        if (_personalImageFile?.path != null) {
                          personalInformationFormKey.currentState!.save();
                          _goToNextStep();
                        } else {
                          SnackbarHelper.showError(
                            context,
                            title:
                                S.of(context).driver_register_picture_required,
                          );
                        }
                      }
                      break;

                    case 1: // Driver License
                      if (driverLicenseFormKey.currentState!.validate()) {
                        if (_driverLicenseFront?.path != null &&
                            _driverLicenseBack?.path != null &&
                            _selfieWithLicense?.path != null) {
                          driverLicenseFormKey.currentState!.save();
                          _goToNextStep();
                        } else {
                          SnackbarHelper.showError(
                            context,
                            title: S
                                .of(context)
                                .driver_register_license_images_required,
                          );
                        }
                      }
                      break;

                    case 2: // Personal Documents
                      if (personalDocumentsFormKey.currentState!.validate()) {
                        if (_nationalID?.path != null &&
                            _nationalIDBack?.path != null &&
                            _criminalStatusRecord?.path != null) {
                          personalDocumentsFormKey.currentState!.save();
                          _goToNextStep();
                        } else {
                          SnackbarHelper.showError(
                            context,
                            title: S
                                .of(context)
                                .driver_register_documents_required,
                          );
                        }
                      }
                      break;

                    case 3: // Vehicle Information
                      if (vehicleInformationFormKey.currentState!.validate()) {
                        if (_vehiclePicture?.path != null &&
                            _vehicleRegistrationBack?.path != null &&
                            _vehicleRegistrationCertificate?.path != null) {
                          vehicleInformationFormKey.currentState!.save();
                          _goToNextStep();
                        } else {
                          SnackbarHelper.showError(
                            context,
                            title: S
                                .of(context)
                                .driver_register_vehicle_images_required,
                          );
                        }
                      }
                      break;

                    case 4: // Login Information
                      if (loginInformationFormKey.currentState!.validate()) {
                        loginInformationFormKey.currentState!.save();
                        context.read<DriverRegisterCubit>().registerUser(
                              DriverAuthModel(
                                fullName: _fullNameController.text.trim(),
                                email: _emailController.text.trim(),
                                password: _passwordController.text.trim(),
                                confirmedPassword:
                                    _confirmPasswordController.text.trim(),
                                phoneNumber: "+20${phoneNumber}" ?? '',
                                idNumber: _idController.text.trim(),
                                drivingLicense: _licenseController.text.trim(),
                                licenseNumber:
                                    _plateNumberController.text.trim(),
                                licenseExpiryDate:
                                    _dateExpirationDateController.text.trim(),
                                gender: _selectedGender,
                                age: _age,
                                registrationDate: DateTime.now(),
                                userType: 2,
                                locationsJson: [
                                  LocationsJson(
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
                                  )
                                ],
                                vehicleInfoJson: [
                                  VehicleInfoJson(
                                    vehicleBrand:
                                        _vehicleBrandController.text.trim(),
                                    vehicleModel:
                                        _vehicleModelController.text.trim(),
                                    vehicleColor:
                                        _vehicleColorController.text.trim(),
                                    productionYear: int.tryParse(
                                        _vehicleYearController.text.trim()),
                                    plateNumber:
                                        _plateNumberController.text.trim(),
                                    seatingCapacity: int.tryParse(
                                        _seatsNumberController.text.trim()),
                                  ),
                                ],
                                imgUrlFile: _personalImageFile?.path ?? "",
                                licenseFront: _driverLicenseFront?.path ?? "",
                                licenseBack: _driverLicenseBack?.path ?? "",
                                licenseSelfie: _selfieWithLicense?.path ?? "",
                                idFront: _nationalID?.path ?? "",
                                idBack: _nationalIDBack?.path ?? "",
                                criminalRecord:
                                    _criminalStatusRecord?.path ?? "",
                                vehiclePicture0: _vehiclePicture?.path ?? "",
                                vehicleRegistrationFront0:
                                    _vehicleRegistrationCertificate?.path ?? "",
                                vehicleRegistrationBack0:
                                    _vehicleRegistrationBack?.path ?? "",
                              ),
                              context,
                            );
                      }
                      break;
                  }
                },
                child: BlocConsumer<DriverRegisterCubit, DriverRegisterState>(
                  listener: (context, state) {
                    if (state is DriverRegisterFailure) {
                      DialogHelper(context)
                          .showErroeDialog(message: state.errorMessage);
                    } else if (state is DriverRegisterSuccess) {
                      DialogHelper(context).showSuccessDialog(
                        message:
                            "Your account has been successfully registered and is now under review.\nThe review process may take between 5 to 10 hours.\nThank you for your patience!",
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
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is DriverRegisterLoading) {
                      return SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                      );
                    } else {
                      return Text(_currentPage == 5
                          ? S.of(context).driver_register_sign_in
                          : S.of(context).driver_register_next);
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _personalInformationWidget() {
    return Form(
      key: personalInformationFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.h),
              Text(
                S.of(context).driver_register_personal_info_title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 20.h),
              Center(
                child: _containerAddImageWidget(
                  onTap: () async {
                    final File? image = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DriverImageDetailScreen(
                          model: RegisterDriverModel.personalPicture(context),
                        ),
                      ),
                    );

                    if (image != null) {
                      setState(() {
                        _personalImageFile = image;
                      });
                    }
                  },
                  title: S.of(context).driver_register_personal_picture,
                  imageFile: _personalImageFile,
                ),
              ),
              SizedBox(height: 40.h),
              TextFormField(
                controller: _fullNameController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  errorMaxLines: 2,
                  hintText: S.of(context).full_name,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).please_enter_name;
                  } else if (value.length < 5) {
                    return S.of(context).name_length_validation;
                  }
                  return null;
                },
              ),
              SizedBox(height: 15.h),
              TextFormField(
                controller: _emailController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  errorMaxLines: 2,
                  hintText: S.of(context).email,
                ),
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
              ),
              SizedBox(height: 15.h),
              FormBuilderRadioGroup<int>(
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).select_birthdate;
                  } else if (_age < 18) {
                    return "Age must be at least 18 years old";
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
                      _dateOfBirthController.text =
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
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.datetime,
                controller: _dateOfBirthController,
                readOnly: true,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  hintText: S.of(context).date_of_birth,
                ),
              ),
              SizedBox(height: 15.h),
              Directionality(
                textDirection: TextDirection.ltr,
                child: IntlPhoneField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  onChanged: (phone) {
                    final normalized = normalizePhone(phone.completeNumber);

                    _phoneController.value = TextEditingValue(
                      text: normalized,
                      selection:
                          TextSelection.collapsed(offset: normalized.length),
                    );

                    phoneNumber = normalized;
                  },
                  validator: (value) {
                    if (value == null || value.number.isEmpty) {
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _driverLicenseWidget() {
    return Form(
      key: driverLicenseFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.h),
              Text(
                S.of(context).driver_register_license_title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 20.h),
              Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _containerAddImageWidget(
                    onTap: () async {
                      final File? image = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DriverImageDetailScreen(
                            model:
                                RegisterDriverModel.driverLicense(context)[0],
                          ),
                        ),
                      );

                      if (image != null) {
                        setState(() {
                          _driverLicenseFront = image;
                        });
                      }
                    },
                    imageFile: _driverLicenseFront,
                    title: S.of(context).driver_register_license_title,
                  ),
                  _containerAddImageWidget(
                    onTap: () async {
                      final File? image = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DriverImageDetailScreen(
                            model:
                                RegisterDriverModel.driverLicense(context)[1],
                          ),
                        ),
                      );

                      if (image != null) {
                        setState(() {
                          _driverLicenseBack = image;
                        });
                      }
                    },
                    imageFile: _driverLicenseBack,
                    title: S.of(context).driver_register_license_title,
                  ),
                  _containerAddImageWidget(
                      onTap: () async {
                        final File? image = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DriverImageDetailScreen(
                              model:
                                  RegisterDriverModel.driverLicense(context)[2],
                            ),
                          ),
                        );

                        if (image != null) {
                          setState(() {
                            _selfieWithLicense = image;
                          });
                        }
                      },
                      imageFile: _selfieWithLicense,
                      title: S.of(context).driver_register_license_title),
                ],
              )),
              SizedBox(height: 40.h),
              TextFormField(
                maxLength: 14,
                controller: _licenseController,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  errorMaxLines: 2,
                  hintText: S.of(context).driver_register_license_number,
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S
                        .of(context)
                        .driver_register_license_number_required;
                  }

                  if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return S.of(context).driver_register_license_digits_only;
                  }

                  if (value.length != 14) {
                    return S.of(context).driver_register_license_length;
                  }

                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              SizedBox(height: 15.h),
              TextFormField(
                keyboardType: TextInputType.datetime,
                controller: _dateExpirationDateController,
                readOnly: true,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  hintText: S.of(context).driver_register_expiration_date,
                ),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(Duration(days: 3650)),
                  );

                  if (pickedDate != null) {
                    setState(() {
                      _dateExpirationDateController.text =
                          "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
                    });
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).select_birthdate;
                  } else if (_age < 5) {
                    return S.of(context).age_validation;
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              SizedBox(height: 15.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _personalDocumentsWidget() {
    return Form(
      key: personalDocumentsFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.h),
              Text(
                S.of(context).driver_register_documents_title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 20.h),
              Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _containerAddImageWidget(
                    onTap: () async {
                      final File? image = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DriverImageDetailScreen(
                            model: RegisterDriverModel.personalDocuments(
                                context)[0],
                          ),
                        ),
                      );

                      if (image != null) {
                        setState(() {
                          _nationalID = image;
                        });
                      }
                    },
                    imageFile: _nationalID,
                    title: S.of(context).driver_register_national_id,
                  ),
                  _containerAddImageWidget(
                      onTap: () async {
                        final File? image = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DriverImageDetailScreen(
                              model: RegisterDriverModel.personalDocuments(
                                  context)[1],
                            ),
                          ),
                        );

                        if (image != null) {
                          setState(() {
                            _nationalIDBack = image;
                          });
                        }
                      },
                      imageFile: _nationalIDBack,
                      title: S.of(context).driver_register_id_back),
                  _containerAddImageWidget(
                      onTap: () async {
                        final File? image = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DriverImageDetailScreen(
                              model: RegisterDriverModel.personalDocuments(
                                  context)[2],
                            ),
                          ),
                        );

                        if (image != null) {
                          setState(() {
                            _criminalStatusRecord = image;
                          });
                        }
                      },
                      imageFile: _criminalStatusRecord,
                      title: S.of(context).driver_register_criminal_record),
                ],
              )),
              SizedBox(height: 40.h),
              TextFormField(
                maxLength: 14,
                controller: _idController,
                keyboardType: TextInputType.number,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  errorMaxLines: 2,
                  hintText: S.of(context).driver_register_id_number,
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).driver_register_id_required;
                  }

                  if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return S.of(context).driver_register_id_digits_only;
                  }

                  if (value.length != 14) {
                    return S.of(context).driver_register_id_length;
                  }

                  return null;
                },
              ),
              SizedBox(height: 15.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _vehicleInformationWidget() {
    return Form(
      key: vehicleInformationFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.h),
              Text(
                S.of(context).driver_register_vehicle_title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 20.h),
              Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _containerAddImageWidget(
                      onTap: () async {
                        final File? image = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DriverImageDetailScreen(
                              model: RegisterDriverModel.vehicleInformation(
                                  context)[0],
                            ),
                          ),
                        );
                        if (image != null) {
                          setState(() {
                            _vehiclePicture = image;
                          });
                        }
                      },
                      imageFile: _vehiclePicture,
                      title: S.of(context).driver_register_vehicle_picture),
                  _containerAddImageWidget(
                      onTap: () async {
                        final File? image = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DriverImageDetailScreen(
                              model: RegisterDriverModel.vehicleInformation(
                                  context)[1],
                            ),
                          ),
                        );
                        if (image != null) {
                          setState(() {
                            _vehicleRegistrationCertificate = image;
                          });
                        }
                      },
                      imageFile: _vehicleRegistrationCertificate,
                      title: S.of(context).driver_register_vehicle_certificate),
                  _containerAddImageWidget(
                      onTap: () async {
                        final File? image = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DriverImageDetailScreen(
                              model: RegisterDriverModel.vehicleInformation(
                                  context)[2],
                            ),
                          ),
                        );
                        if (image != null) {
                          setState(() {
                            _vehicleRegistrationBack = image;
                          });
                        }
                      },
                      imageFile: _vehicleRegistrationBack,
                      title: S.of(context).driver_register_certificate_back),
                ],
              )),
              SizedBox(height: 40.h),
              TextFormField(
                controller: _vehicleBrandController,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  errorMaxLines: 2,
                  hintText: S.of(context).driver_register_vehicle_brand,
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return S.of(context).driver_register_brand_required;
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              SizedBox(height: 15.h),
              TextFormField(
                controller: _vehicleModelController,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  errorMaxLines: 2,
                  hintText: S.of(context).driver_register_vehicle_model,
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return S.of(context).driver_register_model_required;
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              SizedBox(height: 15.h),
              TextFormField(
                controller: _vehicleColorController,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  errorMaxLines: 2,
                  hintText: S.of(context).driver_register_vehicle_color,
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return S.of(context).driver_register_color_required;
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              SizedBox(height: 15.h),
              TextFormField(
                maxLength: 4,
                controller: _vehicleYearController,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  errorMaxLines: 2,
                  hintText: S.of(context).driver_register_production_year,
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return S.of(context).driver_register_year_required;
                  }
                  final year = int.tryParse(value);
                  if (year == null ||
                      year < 2000 ||
                      year > DateTime.now().year) {
                    return "${S.of(context).driver_register_year_range(DateTime.now().year)}.";
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              SizedBox(height: 15.h),
              TextFormField(
                controller: _plateNumberController,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  errorMaxLines: 2,
                  hintText: S.of(context).driver_register_plate_number,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).driver_register_plate_required;
                  }

                  final letters = value.replaceAll(RegExp(r'[^a-zA-Zء-ي]'), '');
                  final numbers = value.replaceAll(RegExp(r'[^0-9]'), '');

                  if (value.length > 7) {
                    return S.of(context).driver_register_plate_length;
                  }

                  if (!RegExp(r'^[a-zA-Zء-ي]+[0-9]+$').hasMatch(value)) {
                    return S.of(context).driver_register_plate_format;
                  }

                  if (letters.length > 3) {
                    return S.of(context).driver_register_plate_letters;
                  }

                  if (numbers.length > 4) {
                    return S.of(context).driver_register_plate_digits;
                  }

                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              SizedBox(height: 15.h),
              TextFormField(
                controller: _seatsNumberController,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  errorMaxLines: 2,
                  hintText: S.of(context).driver_register_seats_number,
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return S.of(context).driver_register_seats_required;
                  }
                  final seats = int.tryParse(value);
                  if (seats == null || seats < 1 || seats > 20) {
                    return S.of(context).driver_register_seats_range;
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              SizedBox(height: 15.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _LoginInformationWidget() {
    return Form(
      key: loginInformationFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.h),
              Text(
                S.of(context).driver_register_login_title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 20.h),
              TextFormField(
                controller: _passwordController,
                obscureText: obscureTextPassword,
                autovalidateMode: AutovalidateMode.onUserInteraction,
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
              ),
              SizedBox(height: 15.h),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: obscureTextConfirmPassword,
                autovalidateMode: AutovalidateMode.onUserInteraction,
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return S.of(context).enter_password;
                  } else if (value != _passwordController.text) {
                    return S.of(context).passwords_do_not_match;
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _containerAddImageWidget({
    required String title,
    required void Function()? onTap,
    File? imageFile,
  }) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Column(
          children: [
            InkWell(
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: onTap,
              child: Container(
                height: 120.h,
                width: 100.w,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.outline.withOpacity(.1),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: imageFile != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Image.file(
                          imageFile,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      )
                    : Icon(
                        Iconsax.add,
                        size: 35.w,
                      ),
              ),
            ),
            SizedBox(
              width: 100.w,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            )
          ],
        ),
      ],
    );
  }
}
