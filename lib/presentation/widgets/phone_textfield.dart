import 'package:aoun_app/core/utils/validation_utils.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../data/model/country_model.dart';

class PhoneTextfieldWidget extends StatefulWidget {
  const PhoneTextfieldWidget(
      {super.key, required this.autovalidateMode, required this.controller});
  final AutovalidateMode autovalidateMode;
  final TextEditingController? controller;
  @override
  State<PhoneTextfieldWidget> createState() => _PhoneTextfieldWidgetState();
}

class _PhoneTextfieldWidgetState extends State<PhoneTextfieldWidget> {
  List<CountryModel> _filteredCountries = [];
  CountryModel? _countryModelSelected;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _filteredCountries = CountryModel.countries(context);
    if (_countryModelSelected == null) {
      setState(() {
        _countryModelSelected = CountryModel.countries(context).first;
      });
    }
  }

  void _filterCountriesFun(String query) {
    if (query.isEmpty) {
      setState(() {
        _filteredCountries = CountryModel.countries(context);
      });
    } else {
      setState(() {
        _filteredCountries = CountryModel.countries(context)
            .where((country) =>
                country.name.toLowerCase().contains(query.toLowerCase()) ||
                country.dialCode.contains(query))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SizedBox(
        height: 82.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                _BottmonModelWidget();
                setState(() {
                  _countryModelSelected;
                });
              },
              child: Flag.fromString(
                _countryModelSelected!.code,
                height: 23.h,
                width: 35.w,
                fit: BoxFit.fill,
              ),
            ),
            const Icon(Icons.arrow_drop_down, size: 20),
            SizedBox(
              width: 5.w,
            ),
            Expanded(
              child: TextFormField(
                controller: widget.controller,
                style: TextStyle(
                  fontSize: 20.sp,
                  height: 1,
                ),
                autovalidateMode: widget.autovalidateMode,
                validator: (value) {
                  return validatePhoneNumber(
                    countryModel: _countryModelSelected,
                    phoneNumber: value,
                    context: context,
                  );
                },
                keyboardAppearance: MediaQuery.of(context).platformBrightness,
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                  errorMaxLines: 2,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: Text(
                      _countryModelSelected!.dialCode,
                      style: Theme.of(context)
                          .inputDecorationTheme
                          .hintStyle!
                          .copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.sp,
                          ),
                    ),
                  ),
                  hintText: S.of(context).login_phone_number,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  dynamic _BottmonModelWidget() {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: SizedBox(
              height: MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(height: 5.h),
                  Container(
                    height: 2.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    S.of(context).login_select_country,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Iconsax.search_normal),
                        hintText: S.of(context).login_hint_search,
                      ),
                      onChanged: (value) {
                        setState(() {
                          _filterCountriesFun(value);
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _filteredCountries.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            setState(() {
                              _countryModelSelected = _filteredCountries[index];
                            });
                            Navigator.pop(context);
                          },
                          leading: Flag.fromString(
                            _filteredCountries[index].code,
                            height: 30.h,
                            width: 50.w,
                            fit: BoxFit.fill,
                          ),
                          title: Text(
                            _filteredCountries[index].name,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          trailing: Directionality(
                            textDirection: TextDirection.ltr,
                            child: Text(
                              _filteredCountries[index].dialCode,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
