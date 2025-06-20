import 'package:aoun_app/core/app_color/app_color_light.dart';
import 'package:aoun_app/core/constant/constant.dart';
import 'package:aoun_app/core/router/route_name.dart';
import 'package:aoun_app/core/utils/Theme/theme_provider.dart';
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
    final themeProvider = Provider.of<ThemeProvider>(context);
    final currentTheme = themeProvider.themeMode.name.toString();
    return Scaffold(
      appBar: AppbarWidget(title: S.of(context).driver_settings_title),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text(S.of(context).driver_settings_language,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.bold)),
                trailing: InkWell(
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () => _showLanguageBottomSheet(context, langProvider),
                  child: Consumer<LanguageProvider>(
                    builder: (context, value, child) => Text(
                        currentLang.toUpperCase(),
                        style: Theme.of(context).textTheme.titleSmall),
                  ),
                ),
              ),
              DividerWidget(),
              ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text(S.of(context).driver_settings_theme,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.bold)),
                trailing: InkWell(
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () => _showThemeBottomSheet(context, themeProvider),
                  child: Consumer<ThemeProvider>(
                    builder: (context, value, child) => Text(
                        currentTheme.toUpperCase(),
                        style: Theme.of(context).textTheme.titleSmall),
                  ),
                ),
              ),
              DividerWidget(),
              SizedBox(height: 10.h),
              InkWell(
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () => Navigator.pushNamed(
                    context, AppRoutesName.contactUsScreenRoute),
                child: Text(S.of(context).driver_settings_contact_us,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.bold)),
              ),
              InkWell(
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () => Navigator.pushNamed(
                    context, AppRoutesName.termsConditionsScreenRoute),
                child: Text(S.of(context).driver_settings_terms,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.bold)),
              ),
              InkWell(
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () => Navigator.pushNamed(
                    context, AppRoutesName.privacyPolicyScreenRoute),
                child: Text(S.of(context).driver_settings_privacy,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 10.h),
              DividerWidget(),
              InkWell(
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  Navigator.pushNamed(
                      context, AppRoutesName.resetPasswordScreenRoute);
                },
                child: Text(S.of(context).driver_settings_change_password,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.bold)),
              ),
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
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: AppColorLight.errorColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showThemeBottomSheet(BuildContext context, ThemeProvider provider) {
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
                Iconsax.sun_1,
                color: Theme.of(context).primaryColor,
              ),
              title: Text("Light"),
              onTap: () {
                provider.changeTheme(ThemeMode.light);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Iconsax.moon,
                color: Theme.of(context).primaryColor,
              ),
              title: Text("Dark"),
              onTap: () {
                provider.changeTheme(ThemeMode.dark);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
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
              title: Text(
                S.of(context).driver_settings_language_english,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontFamily: isArabicText(
                              S.of(context).driver_settings_language_english)
                          ? fontArabic
                          : fontEnglish,
                    ),
              ),
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
              title: Text(
                S.of(context).driver_settings_language_arabic,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontFamily: isArabicText(
                              S.of(context).driver_settings_language_arabic)
                          ? fontArabic
                          : fontEnglish,
                    ),
              ),
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
