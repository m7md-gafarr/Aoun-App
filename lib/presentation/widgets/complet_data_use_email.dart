import 'package:aoun_app/core/router/route_name.dart';
import 'package:aoun_app/presentation/widgets/common/btn_filled.dart';
import 'package:aoun_app/presentation/widgets/phone_textfield.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class CompletDataUseEmailWidget extends StatefulWidget {
  const CompletDataUseEmailWidget({super.key});

  @override
  State<CompletDataUseEmailWidget> createState() =>
      _CompletDataUseEmailWidgetState();
}

class _CompletDataUseEmailWidgetState extends State<CompletDataUseEmailWidget> {
  TextEditingController? _controllerName;
  TextEditingController? _controllerEmail;
  TextEditingController? _Phone;
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

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30.w),
              Text(
                S.of(context).complete_your_information,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 20.w),
              Stack(
                children: [
                  CircleAvatar(
                    maxRadius: 60.w,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 37.w,
                      width: 37.w,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 5,
                              color: Theme.of(context).scaffoldBackgroundColor),
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
              SizedBox(height: 20.w),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return S.of(context).please_enter_name;
                  } else {
                    return null;
                  }
                },
                autovalidateMode: autovalidateMode,
                controller: _controllerName,
                decoration: InputDecoration(
                  hintText: S.of(context).name_label,
                  suffixIcon: Offstage(
                    offstage: _controllerName!.text.isEmpty,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          _controllerName!.clear();
                        });
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.w),
              TextField(
                controller: _controllerEmail,
                enabled: false,
              ),
              SizedBox(height: 15.w),
              PhoneTextfieldWidget(
                controller: _Phone,
                autovalidateMode: autovalidateMode!,
              ),
              SizedBox(height: 30.w),
              BtnfilledWidget(
                onPressed: () async {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    Navigator.pushNamed(
                      context,
                      AppRoutesName.oTPScreenRoute,
                    );
                    setState(() {
                      autovalidateMode = AutovalidateMode.disabled;
                    });
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                text: S.of(context).login_next,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
