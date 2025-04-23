import 'package:aoun_app/data/model/payment%20models/debit_card_model/debit_card_model.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:aoun_app/presentation/user/transport/view_model/add%20new%20debit%20card/add_new_debit_card_cubit.dart';
import 'package:aoun_app/presentation/user/transport/view_model/view%20debit%20card/view_all_debit_card_cubit.dart';
import 'package:aoun_app/presentation/widgets/common/success_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';

import 'package:aoun_app/core/app_color/app_color_light.dart';
import 'package:aoun_app/core/app_images/app_images.dart';
import 'package:aoun_app/presentation/widgets/common/appBar_widget.dart';

class AddNewCardScreen extends StatefulWidget {
  const AddNewCardScreen({super.key});

  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
  late FlipCardController _flipCardController;

  final _focusNodes = {
    'cvv': FocusNode(),
    'number': FocusNode(),
    'expiry': FocusNode(),
    'name': FocusNode(),
  };

  String _cardNumberText = "XXXX XXXX XXXX XXXX";
  String _fullnameText = "Cardholder";
  String _expiryDateText = "MM/YY";
  String _cvvText = "XXX";
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    _flipCardController = FlipCardController();

    _focusNodes['cvv']!.addListener(() {
      if (_focusNodes['cvv']!.hasFocus) _flipCardController.flipcard();
    });

    for (var key in ['number', 'expiry', 'name']) {
      _focusNodes[key]!.addListener(() {
        if (_focusNodes[key]!.hasFocus && !_flipCardController.state!.isFront) {
          _flipCardController.flipcard();
        }
      });
    }
  }

  @override
  void dispose() {
    for (var node in _focusNodes.values) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(title: "Add new card"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13.0),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            _buildFlipCard(),
            SizedBox(height: 40.h),
            Expanded(child: _buildForm(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildFlipCard() {
    return SizedBox(
      height: 160.h,
      width: double.infinity,
      child: FlipCard(
        rotateSide: RotateSide.bottom,
        onTapFlipping: false,
        axis: FlipAxis.vertical,
        controller: _flipCardController,
        frontWidget: _frontCard(),
        backWidget: _backCard(),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildTextField(
              (value) {
                if (value == null || value.isEmpty) {
                  return "S.of(context).enter_card_number";
                } else if (value.length != 19) {
                  return "S.of(context).invalid_card_number_lengt";
                }

                return null;
              },
              _focusNodes['number']!,
              Iconsax.card,
              "Card number",
              TextInputType.number,
              (value) {
                setState(() {
                  _cardNumberText = value;
                });
              },
              [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(16),
                CardNumberFormatter(),
              ],
            ),
            SizedBox(height: 15.h),
            _buildTextField(
              (value) {
                if (value == null || value.isEmpty) {
                  return "S.of(context).enter_full_name";
                } else if (!RegExp(r'^[A-Za-z]+(?: [A-Za-z]+){2}$')
                    .hasMatch(value)) {
                  return "S.of(context).invalid_name_format";
                }

                return null;
              },
              _focusNodes['name']!,
              Iconsax.user,
              "Full name",
              TextInputType.name,
              (value) {
                setState(() {
                  _fullnameText =
                      value.isEmpty ? "CARDHOLDER" : value.toUpperCase();
                });
              },
              [],
            ),
            SizedBox(height: 15.h),
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter expiry date";
                      }

                      final cleaned = value.replaceAll(RegExp(r'[^0-9]'), '');
                      if (cleaned.length != 4) {
                        return "Enter 4 digits (MMYY)";
                      }

                      final month = int.tryParse(cleaned.substring(0, 2));
                      final year = int.tryParse('20${cleaned.substring(2)}');

                      if (month == null || month < 1 || month > 12) {
                        return "Invalid month";
                      }

                      final now = DateTime.now();
                      final inputDate = DateTime(year!, month);

                      if (inputDate.isBefore(DateTime(now.year, now.month))) {
                        return "Card expired";
                      }

                      return null;
                    },
                    _focusNodes['expiry']!,
                    Iconsax.calendar_1,
                    "MM/YY",
                    TextInputType.number,
                    (value) {
                      setState(() {
                        _expiryDateText = value;
                      });
                    },
                    [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4),
                      ExpiryDateFormatter(),
                    ],
                  ),
                ),
                SizedBox(width: 15.w),
                Expanded(
                  child: _buildTextField(
                    (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter CVV";
                      }
                      if (!RegExp(r'^\d{3}$').hasMatch(value)) {
                        return "CVV must be 3 digits";
                      }
                      return null;
                    },
                    _focusNodes['cvv']!,
                    Iconsax.lock_1,
                    "CVV",
                    TextInputType.number,
                    (value) {
                      setState(() {
                        _cvvText = value;
                      });
                    },
                    [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(3),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            ElevatedButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();

                  await context.read<AddNewDebitCardCubit>().addDebitCard(
                        DebitCardModel(
                          cardNumber: _cardNumberText,
                          fullName: _fullnameText,
                          cvv: _cvvText,
                          validThru: _expiryDateText,
                        ),
                      );
                }
              },
              child: BlocConsumer<AddNewDebitCardCubit, AddNewDebitCardState>(
                listener: (context, state) {
                  if (state is AddNewDebitCardSuccess) {
                    SuccessDialogWidget(
                      message: "Success Add Card",
                      title: S.of(context).confirmed_successfully,
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: Text(S.of(context).ok_AlertDialogt),
                        ),
                      ],
                    ).show(context);

                    context.read<ViewAllDebitCardCubit>().fetchDebitcard();
                  }
                },
                builder: (context, state) {
                  if (state is AddNewDebitCardLoading) {
                    return SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                    );
                  } else {
                    return Text("Add card");
                  }
                },
              ),
            ),
            SizedBox(height: 15.h),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    String? Function(String?)? validator,
    FocusNode focusNode,
    IconData icon,
    String hint,
    TextInputType keyboardType,
    Function(String) onChanged,
    List<TextInputFormatter>? inputFormatters,
  ) {
    return TextFormField(
      validator: validator,
      focusNode: focusNode,
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hint,
        errorMaxLines: 2,
      ),
      onChanged: onChanged,
      inputFormatters: inputFormatters,
    );
  }

  Widget _frontCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(7.r),
      child: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(Assets.imageDebitCard, fit: BoxFit.cover),
          Positioned(
              top: 5,
              left: 5,
              child: SizedBox(
                  height: 55.h,
                  width: 55.h,
                  child: SvgPicture.asset(Assets.imageLogoLogo))),
          Positioned(
            bottom: 10,
            left: 7,
            child: Row(
              children: [
                SizedBox(
                  width: 215.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildCardText(_cardNumberText, 17.sp),
                      _buildCardText(_fullnameText, 17.sp),
                    ],
                  ),
                ),
                SizedBox(width: 35.w),
                _buildCardLabelValue('VALID\nTHRU', _expiryDateText),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _backCard() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: AppColorLight.secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(7.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildText("http://www.Aoun.com", Colors.white38),
          SizedBox(height: 5.h),
          Container(height: 35.h, color: Colors.black),
          SizedBox(height: 5.h),
          _buildText("Authorized Signature", Colors.white),
          SizedBox(height: 5.h),
          _buildSignatureField(),
        ],
      ),
    );
  }

  Widget _buildSignatureField() {
    return Container(
      height: 35.h,
      width: 200.w,
      color: Colors.white54,
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 8.0),
      child: Text(_cvvText,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.black)),
    );
  }

  Widget _buildCardText(String text, double fontSize) {
    return Text(text.toUpperCase(),
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: fontSize));
  }

  Widget _buildCardLabelValue(String label, String value) {
    return Row(
      children: [
        Text(label, style: TextStyle(color: Colors.white, fontSize: 10.sp)),
        SizedBox(width: 5.w),
        _buildCardText(value, 12.sp),
      ],
    );
  }

  Widget _buildText(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Text(text,
          style:
              Theme.of(context).textTheme.labelSmall!.copyWith(color: color)),
    );
  }
}

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text.replaceAll(RegExp(r'\D'), '');
    String formatted = '';

    for (int i = 0; i < text.length; i++) {
      if (i > 0 && i % 4 == 0) formatted += ' ';
      formatted += text[i];
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

class ExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    String formatted = text;

    if (text.length >= 2) {
      formatted = '${text.substring(0, 2)}/${text.substring(2)}';
    }

    return newValue.copyWith(
        text: formatted,
        selection: TextSelection.collapsed(offset: formatted.length));
  }
}

String formatCardNumber(String value) {
  return value
      .replaceAllMapped(RegExp(r'.{1,4}'), (match) => '${match.group(0)} ')
      .trim();
}

String formatExpiryDate(String value) {
  if (value.length >= 2) {
    return '${value.substring(0, 2)}/${value.substring(2)}';
  }
  return value;
}
