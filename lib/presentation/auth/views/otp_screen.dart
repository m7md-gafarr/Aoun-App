import 'dart:async';

import 'package:aoun_app/core/router/route_name.dart';
import 'package:aoun_app/data/model/auth%20models/user_auth_model/auth_model.dart';
import 'package:aoun_app/presentation/auth/view_model/sendOTPForPasswordReset_cubit/send_otp_for_password_reset_cubit.dart';
import 'package:aoun_app/presentation/auth/view_model/verifyOTP_cubit/verify_otp_cubit.dart';
import 'package:aoun_app/presentation/widgets/common/appBar_widget.dart';
import 'package:aoun_app/presentation/widgets/common/error_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import '../../../generated/l10n.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OtpScreen> {
  int _secondsRemaining = 60;
  Timer? _timer;
  bool _isButtonDisabled = true;
  late final TextEditingController pinController;
  late final FocusNode focusNode;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    pinController = TextEditingController();
    focusNode = FocusNode();
    focusNode.requestFocus();
    _startTimer();
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    pinController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _isButtonDisabled = true;
    _secondsRemaining = 60;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        setState(() {
          _isButtonDisabled = false;
        });
        _timer?.cancel();
      }
    });
  }

  String get formattedTime {
    int minutes = _secondsRemaining ~/ 60;
    int seconds = _secondsRemaining % 60;
    return "$minutes:${seconds.toString().padLeft(2, '0')}"; // عرض الوقت بشكل 0:30
  }

  @override
  Widget build(BuildContext context) {
    PinTheme defaultPinTheme = PinTheme(
      width: 55.w,
      height: 55.h,
      textStyle: Theme.of(context).textTheme.titleLarge,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 2.w,
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

    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final email = args?['email'] ?? "Unknown Email";

    return Scaffold(
      appBar: AppbarWidget(),
      body: Form(
        key: formKey,
        child: SafeArea(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 70.h),
                    Text(
                      S.of(context).verification_title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      S.of(context).verification_instruction,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20.h),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Text(
                        email.toString(),
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    BlocListener<VerifyOtpCubit, VerifyOtpState>(
                      listener: (context, state) {
                        if (state is VerifyOtpFailure) {
                          ErrorDialogWidget(message: state.errorMessage)
                              .show(context);
                        } else if (state is VerifyOtpSuccess) {
                          Navigator.pushNamed(
                            context,
                            AppRoutesName.confirmPasswordScreenRoute,
                            arguments: {'email': email},
                          );
                        }
                      },
                      child: Pinput(
                        focusNode: focusNode,
                        controller: pinController,
                        length: 6,
                        closeKeyboardWhenCompleted: true,
                        defaultPinTheme: defaultPinTheme,
                        focusedPinTheme: focusedPinTheme,
                        submittedPinTheme: submittedPinTheme,
                        showCursor: true,
                        cursor: Container(
                          width: 2.w,
                          height: 20.h,
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        onCompleted: (pin) async {
                          context.read<VerifyOtpCubit>().verfiyOtp(
                              UserAuthModel(
                                email: email,
                              ),
                              pinController.text,
                              context);
                        },
                      ),
                    ),
                    SizedBox(height: 60.h),
                    Text(
                      S.of(context).did_not_receive_code,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextButton(
                      onPressed: _isButtonDisabled
                          ? null
                          : () {
                              _startTimer();
                              context
                                  .read<SendOtpForPasswordResetCubit>()
                                  .sendOtp(
                                    UserAuthModel(
                                      email: email,
                                    ),
                                    context,
                                  );
                            },
                      child: Text(
                        "${S.of(context).resend_code} ( $formattedTime )",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: _isButtonDisabled
                                  ? Theme.of(context).colorScheme.outline
                                  : Theme.of(context).primaryColor,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
