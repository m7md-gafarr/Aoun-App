import 'package:aoun_app/core/router/route_name.dart';
import 'package:aoun_app/presentation/widgets/common/btn_filled.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompletDataUsePhoneWidget extends StatefulWidget {
  const CompletDataUsePhoneWidget({super.key});

  @override
  State<CompletDataUsePhoneWidget> createState() =>
      _CompletDataUsePhoneWidgetState();
}

class _CompletDataUsePhoneWidgetState extends State<CompletDataUsePhoneWidget> {
  late FocusNode _focusNode;
  TextEditingController? _controllerName;
  AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    _focusNode = FocusNode();
    _focusNode.requestFocus();
    _controllerName = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controllerName!.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          children: [
            SizedBox(height: 80.w),
            Text(
              S.of(context).welcome_message,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              S.of(context).introduce_yourself,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 50.w),
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
              focusNode: _focusNode,
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
            SizedBox(height: 40.w),
            BtnfilledWidget(
              onPressed: () {
                setState(() {
                  autovalidateMode = AutovalidateMode.always;
                });
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();

                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutesName.homeUserScreenRoute,
                    (route) => false,
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
    );
  }
}
