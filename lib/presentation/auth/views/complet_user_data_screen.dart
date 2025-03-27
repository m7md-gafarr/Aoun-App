import 'package:aoun_app/core/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:aoun_app/core/router/route_name.dart';
import 'package:aoun_app/presentation/widgets/phone_textfield.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompletUserDataScreen extends StatefulWidget {
  const CompletUserDataScreen({super.key});

  @override
  State<CompletUserDataScreen> createState() => _CompletUserDataScreenState();
}

class _CompletUserDataScreenState extends State<CompletUserDataScreen> {
  TextEditingController? _controllerName;
  TextEditingController? _controllerEmail;
  TextEditingController? _phone;
  AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    _controllerName = TextEditingController(text: "Mohammed");
    _controllerEmail = TextEditingController(text: "m7md.gafarr@gmail.com");
    _controllerName!.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _controllerEmail!.dispose();
    _controllerName!.dispose();
    _phone!.dispose();
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
          S.of(context).complete_your_information,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 70.h),
                Stack(
                  children: [
                    CircleAvatar(
                      maxRadius: 60.w,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 32.w,
                        width: 32.w,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2.w,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor),
                            color: Theme.of(context).primaryColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50))),
                        child: Icon(
                          Iconsax.add,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 30.h),
                TextField(
                  controller: _controllerEmail,
                  readOnly: true,
                ),
                SizedBox(height: 15.h),
                PhoneTextfieldWidget(
                  controller: _phone,
                  autovalidateMode: autovalidateMode!,
                ),
                SizedBox(height: 30.h),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, AppRoutesName.homeUserScreenRoute);
                  },
                  child: Text(S.of(context).intro_next_button),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
