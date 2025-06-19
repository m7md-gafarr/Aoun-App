import 'dart:io';
import 'package:aoun_app/core/app_images/app_images.dart';
import 'package:aoun_app/core/utils/dialog/dialog_helper.dart';
import 'package:aoun_app/data/model/user%20models/user_model/user_model.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:aoun_app/presentation/driver/profile/view_model/get_driver_data/get_driver_data_cubit.dart';
import 'package:aoun_app/presentation/user/profile/view_model/get_user_info/get_user_info_cubit.dart';
import 'package:aoun_app/presentation/user/profile/view_model/user_edit_profile_data/user_edit_profile_data_cubit.dart';
import 'package:aoun_app/presentation/widgets/common/appBar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class UserEditProfileScreen extends StatefulWidget {
  const UserEditProfileScreen({super.key});

  @override
  State<UserEditProfileScreen> createState() => _UserEditProfileScreenState();
}

class _UserEditProfileScreenState extends State<UserEditProfileScreen> {
  late var list;
  late TextEditingController _fullNameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  String? _phoneNumber;
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
    _phoneController.text = list[3];
    _phoneNumber = _phoneController.text;
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
                      color: Theme.of(context).colorScheme.primaryContainer,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: _personalImageFile?.path == null
                            ? (list[0] == null ||
                                    list[0].toString().isEmpty ||
                                    list[0] == "null" ||
                                    list[0] ==
                                        "https://studentpathapitest.runasp.net/null"
                                ? AssetImage(Assets.imageUser) as ImageProvider
                                : NetworkImage(
                                        "https://studentpathapitest.runasp.net/${list[0]!.replaceAll(r'\\', '/')}")
                                    as ImageProvider)
                            : FileImage(File(_personalImageFile!.path))
                                as ImageProvider,
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
                    initialCountryCode: 'EG',
                    languageCode: "en",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _phoneController,
                    decoration: InputDecoration(
                      hintText: S.of(context).login_phone_number,
                    ),
                    onChanged: (phone) {
                      _phoneNumber = phone.completeNumber;
                    },
                    validator: (value) {
                      if (value == null) {
                        return S.of(context).phone_number_required;
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20.h),
                ElevatedButton(
                  onPressed: () async {
                    context.read<UserEditProfileDataCubit>().updateUser(
                          UserModel(
                            email: _emailController.text,
                            userName: _fullNameController.text,
                            phoneNumber: _phoneNumber,
                            imgUrl: _personalImageFile?.path,
                          ),
                        );
                  },
                  child: BlocConsumer<UserEditProfileDataCubit,
                      UserEditProfileDataState>(
                    listener: (context, state) {
                      if (state is UserEditProfileDataSuccess) {
                        context
                            .read<GetUserInfoCubit>()
                            .getUserInformation(context, forceRefresh: true);
                        DialogHelper(context).showSuccessDialog(
                          message: "Updated Successfully",
                          title: "",
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
                      if (state is UserEditProfileDataLoading) {
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
