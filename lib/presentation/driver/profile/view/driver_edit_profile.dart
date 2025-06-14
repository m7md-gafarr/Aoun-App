import 'package:aoun_app/core/utils/dialog/dialog_helper.dart';
import 'package:aoun_app/data/model/driver_models/driver_model/data.dart';
import 'package:aoun_app/data/model/driver_models/driver_model/driver_model.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:aoun_app/presentation/driver/profile/view_model/driver_edit_profile_data/driver_edit_profile_data_cubit.dart';
import 'package:aoun_app/presentation/driver/profile/view_model/get_driver_data/get_driver_data_cubit.dart';
import 'package:aoun_app/presentation/widgets/common/appBar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class DriverEditProfile extends StatefulWidget {
  const DriverEditProfile({super.key});

  @override
  State<DriverEditProfile> createState() => _DriverEditProfileState();
}

class _DriverEditProfileState extends State<DriverEditProfile> {
  late var list;
  late TextEditingController _fullNameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;

  XFile? _personalImageFile;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    _fullNameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    list = ModalRoute.of(context)!.settings.arguments;
    _fullNameController.text = list[1];
    _emailController.text = list[2];
    _phoneController.text = list[3].substring(1);
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _fullNameController.dispose();
    _emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: S.of(context).driver_edit_profile_title,
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              children: [
                SizedBox(height: 30.h),
                InkWell(
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    final XFile? image = await ImagePicker().pickImage(
                      source: ImageSource.gallery,
                    );
                    if (image != null) {
                      setState(() {
                        _personalImageFile = image;
                      });
                    }
                  },
                  child: Container(
                    height: 120.h,
                    width: 120.h,
                    decoration: BoxDecoration(
                      color: Theme.of(context).secondaryHeaderColor,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(list[0]),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          right: 10,
                          bottom: 10,
                          child: Container(
                            height: 20.h,
                            width: 20.h,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Icon(
                                Iconsax.add,
                                size: 17.w,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                TextFormField(
                  controller: _fullNameController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  cursorColor: Theme.of(context).primaryColor,
                  decoration: InputDecoration(
                    errorMaxLines: 2,
                    hintText: S.of(context).driver_edit_profile_full_name_hint,
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
                    hintText: S.of(context).driver_edit_profile_email_hint,
                  ),
                  enabled: false,
                ),
                SizedBox(height: 15.h),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: IntlPhoneField(
                    onChanged: (phone) {
                      _phoneController.text = phone.completeNumber;
                    },
                    validator: (value) {
                      if (value == null) {
                        return S.of(context).phone_number_required;
                      }

                      return null;
                    },
                    languageCode: "en",
                    controller: _phoneController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      hintText: S.of(context).login_phone_number,
                    ),
                    initialCountryCode: 'EG',
                  ),
                ),
                SizedBox(height: 20.h),
                ElevatedButton(
                  onPressed: () async {
                    context.read<DriverEditProfileDataCubit>().updateDriver(
                          DriverModel(
                            data: Data(
                              imgUrl: _personalImageFile?.path,
                              userName: _fullNameController.text,
                              phoneNumber: _phoneController.text,
                            ),
                          ),
                        );
                  },
                  child: BlocConsumer<DriverEditProfileDataCubit,
                      DriverEditProfileDataState>(
                    listener: (context, state) {
                      if (state is DriverEditProfileDataSuccess) {
                        DialogHelper(context).showSuccessDialog(
                          message: "message",
                          title: "title",
                          actions: [
                            TextButton(
                                onPressed: () {
                                  context
                                      .read<GetDriverDataCubit>()
                                      .getDriverData(context,
                                          forceRefresh: true);

                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                                child: Text("Ok"))
                          ],
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is DriverEditProfileDataLoading) {
                        return SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                        );
                      } else {
                        return Text(
                            S.of(context).driver_edit_profile_update_button);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
