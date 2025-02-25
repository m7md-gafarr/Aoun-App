import 'package:aoun_app/core/app_color/app_color_light.dart';
import 'package:aoun_app/core/constant/constant.dart';
import 'package:aoun_app/core/router/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pinput/pinput.dart';
import '../../../generated/l10n.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  late final TextEditingController pinController;
  late final FocusNode focusNode;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    pinController = TextEditingController();

    focusNode = FocusNode();
    focusNode.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.light;

    PinTheme defaultPinTheme = PinTheme(
      width: 55,
      height: 55,
      textStyle: Theme.of(context).textTheme.titleLarge,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 2,
          ),
        ),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).secondaryHeaderColor,
            width: 2,
          ),
        ),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).primaryColor.withOpacity(0),
          ),
        ),
      ),
    );
    // final args = ModalRoute.of(context)!.settings.arguments as Map;
    // final dialCode = args['dialCode'] ?? "Unknown Dial Code";
    // final phoneNumber = args['phoneNumber'] ?? "Unknown Phone Number";

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
          S.of(context).reset_password_forget_password,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: SafeArea(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 70.h),
                  Text(
                    S.of(context).verification_title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    S.of(context).verification_instruction,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Text(
                      // "$dialCode $phoneNumber",
                      "Email@gmail.com",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Pinput(
                    focusNode: focusNode,
                    controller: pinController,
                    length: 4,
                    closeKeyboardWhenCompleted: true,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    submittedPinTheme: submittedPinTheme,
                    showCursor: true,
                    cursor: Container(
                      width: 2,
                      height: 20,
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onCompleted: (pin) async {
                      Navigator.pushNamed(
                        context,
                        AppRoutesName.ConfirmPasswordScreenRoute,
                      );
                    },
                  ),
                  const SizedBox(height: 60),
                  Text(
                    S.of(context).did_not_receive_code,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(
                      textButtonTheme: TextButtonThemeData(
                        style: ButtonStyle(
                          foregroundColor: WidgetStatePropertyAll(
                            isDarkMode
                                ? AppColorLight.primaryColor
                                : AppColorLight.primaryColor,
                          ),
                          textStyle: WidgetStatePropertyAll(
                            TextStyle(
                              fontSize: 18,
                              decoration: TextDecoration.underline,
                              decorationColor: isDarkMode
                                  ? AppColorLight.primaryColor
                                  : AppColorLight.primaryColor,
                              decorationThickness: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        S.of(context).resend_code,
                      ),
                    ),
                  ),
                  const Spacer(flex: 1),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
