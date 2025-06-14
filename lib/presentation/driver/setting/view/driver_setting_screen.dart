import 'package:aoun_app/core/app_color/app_color_light.dart';
import 'package:aoun_app/core/router/route_name.dart';
import 'package:aoun_app/core/utils/language/language.dart';
import 'package:aoun_app/data/repositories/local/shared_pref.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:aoun_app/presentation/widgets/common/appBar_widget.dart';
import 'package:aoun_app/presentation/widgets/common/divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class DriverSettingScreen extends StatelessWidget {
  const DriverSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final langProvider = Provider.of<LanguageProvider>(context);
    final currentLang = langProvider.locale?.languageCode ?? "en";
    return Scaffold(
      appBar: AppbarWidget(title: S.of(context).driver_settings_title),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              InkWell(
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  Navigator.pushNamed(
                      context, AppRoutesName.resetPasswordScreenRoute);
                },
                child: Text(S.of(context).driver_settings_change_password,
                    style: Theme.of(context).textTheme.titleMedium),
              ),
              SizedBox(height: 10.h),
              DividerWidget(),
              ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text(S.of(context).driver_settings_language,
                    style: Theme.of(context).textTheme.titleMedium),
                trailing: InkWell(
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () =>
                        _showLanguageBottomSheet(context, langProvider),
                    child: Consumer(
                      builder: (context, value, child) => Text(
                          currentLang.toUpperCase(),
                          style: Theme.of(context).textTheme.titleSmall),
                    )),
              ),
              DividerWidget(),
              ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text(S.of(context).driver_settings_theme,
                    style: Theme.of(context).textTheme.titleMedium),
                trailing: InkWell(
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {},
                  child: Text(S.of(context).driver_settings_dark_mode,
                      style: Theme.of(context).textTheme.titleSmall),
                ),
              ),
              DividerWidget(),
              SizedBox(height: 10.h),
              Text(S.of(context).driver_settings_contact_us,
                  style: Theme.of(context).textTheme.titleMedium),
              Text(S.of(context).driver_settings_terms,
                  style: Theme.of(context).textTheme.titleMedium),
              Text(S.of(context).driver_settings_privacy,
                  style: Theme.of(context).textTheme.titleMedium),
              Text(S.of(context).driver_settings_rate,
                  style: Theme.of(context).textTheme.titleMedium),
              SizedBox(height: 10.h),
              DividerWidget(),
              InkWell(
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () async {
                  SharedPreferencesService().logout();
                  Navigator.pushNamedAndRemoveUntil(context,
                      AppRoutesName.selectTypeScreenRoute, (route) => false);
                },
                child: Text(
                  S.of(context).driver_settings_logout,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColorLight.errorColor,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLanguageBottomSheet(
      BuildContext context, LanguageProvider provider) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(
                Iconsax.language_circle,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(S.of(context).driver_settings_language_english),
              onTap: () {
                provider.changeLanguage("en");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Iconsax.language_circle,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(S.of(context).driver_settings_language_arabic),
              onTap: () {
                provider.changeLanguage("ar");
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
