import 'dart:io';
import 'package:aoun_app/generated/l10n.dart';
import 'package:aoun_app/presentation/widgets/common/appBar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

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
  File? _personalImageFile;

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
        title: "Edit Profile",
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              children: [
                SizedBox(height: 30.h),
                Container(
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
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                TextFormField(
                  controller: _fullNameController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  cursorColor: Theme.of(context).primaryColor,
                  decoration: InputDecoration(
                    errorMaxLines: 2,
                    hintText: "Full name",
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
                    hintText: "Email",
                  ),
                  enabled: false,
                ),
                SizedBox(height: 15.h),
                TextField(),
                SizedBox(height: 20.h),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Update"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
