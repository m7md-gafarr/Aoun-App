import 'package:aoun_app/data/model/country_model.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:flutter/material.dart';

String? validatePhoneNumber({
  required CountryModel? countryModel,
  required String? phoneNumber,
  required BuildContext context,
}) {
  if (countryModel == null) {
    return S.of(context).validation_select_country;
  }

  if (phoneNumber == null || phoneNumber.isEmpty) {
    return S.of(context).validation_phone_empty;
  }

  String cleanedPhoneNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');

  if (cleanedPhoneNumber.startsWith('0')) {
    cleanedPhoneNumber = cleanedPhoneNumber.substring(1);
  }

  // if (!RegExp(r'^(10|11|12|15)').hasMatch(cleanedPhoneNumber)) {
  //   return "${countryModel.dialCode} $phoneNumber\n${S.of(context).validation_invalid_number} ${countryModel.name}"; // رسالة رقم غير صالح
  // }

  if (cleanedPhoneNumber.length < (countryModel.count)) {
    return S.of(context).validation_phone_short;
  }

  if (cleanedPhoneNumber.length > (countryModel.count)) {
    return S.of(context).validation_phone_long;
  }

  return null;
}

String cleanPhoneNumber({
  required CountryModel? countryModel,
  required String? phoneNumber,
  required BuildContext context,
}) {
  String cleanedPhoneNumber = phoneNumber!.replaceAll(RegExp(r'\D'), '');
  if (cleanedPhoneNumber.startsWith('0')) {
    cleanedPhoneNumber = cleanedPhoneNumber.substring(1);
  }

  return cleanedPhoneNumber;
}

bool validateOTP({
  required CountryModel? countryModel,
  required String? phoneNumber,
  required BuildContext context,
}) {
  bool result = false;

  String cleanedPhoneNumber = phoneNumber!.replaceAll(RegExp(r'\D'), '');
  if (cleanedPhoneNumber.startsWith('0')) {
    cleanedPhoneNumber = cleanedPhoneNumber.substring(1);
  }

  if (RegExp(r'^(10|11|12|15)').hasMatch(cleanedPhoneNumber)) {
    if (cleanedPhoneNumber.length < 10) {
      // AlertDialogWidget(context, content: S.of(context).validation_phone_short);
    } else if (cleanedPhoneNumber.length > 10) {
      // AlertDialogWidget(context, content: S.of(context).validation_phone_long);
    } else {
      result = true;
    }
  } else {}

  return result;
}

String normalizePhone(String rawPhone) {
  String digitsOnly = rawPhone.replaceAll(RegExp(r'\D'), '');

  if (digitsOnly.startsWith('20')) {
    digitsOnly = digitsOnly.substring(2);
  } else if (digitsOnly.startsWith('00')) {
    digitsOnly = digitsOnly.substring(4);
  } else if (digitsOnly.startsWith('0')) {
    digitsOnly = digitsOnly.substring(1);
  }

  return digitsOnly;
}
