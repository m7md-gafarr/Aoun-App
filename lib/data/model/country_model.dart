import 'package:aoun_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class CountryModel {
  final String name;
  final String code;
  final String dialCode;
  final int count;

  CountryModel({
    required this.name,
    required this.code,
    required this.dialCode,
    required this.count,
  });

  static List<CountryModel> countries(BuildContext context) => [
        CountryModel(
          name: S.of(context).egypt,
          code: 'EG',
          dialCode: '+20',
          count: 10,
        ),
        CountryModel(
          name: S.of(context).saudi_Arabia,
          code: 'SA',
          dialCode: '+966',
          count: 9,
        ),
        CountryModel(
          name: S.of(context).libya,
          code: 'LY',
          dialCode: '+218',
          count: 9,
        ),
        CountryModel(
          name: S.of(context).sudan,
          code: 'SD',
          dialCode: '+249',
          count: 9,
        ),
        CountryModel(
          name: S.of(context).palestine,
          code: 'PS',
          dialCode: '+970',
          count: 9,
        ),
        CountryModel(
          name: S.of(context).jordan,
          code: 'JO',
          dialCode: '+962',
          count: 9,
        ),
      ];
}
