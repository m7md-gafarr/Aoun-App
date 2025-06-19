import 'package:aoun_app/core/app_color/app_color_light.dart';
import 'package:aoun_app/core/app_images/app_images.dart';
import 'package:aoun_app/core/constant/constant.dart';
import 'package:aoun_app/core/router/route_name.dart';
import 'package:aoun_app/core/utils/Theme/theme_provider.dart';
import 'package:aoun_app/core/utils/language/language.dart';
import 'package:aoun_app/data/repositories/local/shared_pref.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:aoun_app/presentation/user/profile/view_model/get_user_info/get_user_info_cubit.dart';
import 'package:aoun_app/presentation/widgets/common/appBar_widget.dart';
import 'package:aoun_app/presentation/widgets/common/divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  void didChangeDependencies() {
    context.read<GetUserInfoCubit>().getUserInformation(context);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final langProvider = Provider.of<LanguageProvider>(context);
    final currentLang = langProvider.locale?.languageCode ?? "en";
    final themeProvider = Provider.of<ThemeProvider>(context);
    final currentTheme = themeProvider.themeMode.name.toString();

    return Scaffold(
      appBar: AppbarWidget(
        onBack: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20.h),
                BlocBuilder<GetUserInfoCubit, GetUserInfoState>(
                  builder: (context, state) {
                    if (state is GetUserInfoInitialSuccess) {
                      return Column(
                        children: [
                          CircleAvatar(
                            maxRadius: 45.w,
                            backgroundColor:
                                Theme.of(context).colorScheme.primaryContainer,
                            backgroundImage: state.userModel.imgUrl != null
                                ? NetworkImage(
                                    "https://studentpathapitest.runasp.net/${state.userModel.imgUrl!.replaceAll(r'\\', '/')}",
                                  )
                                : AssetImage(Assets.imageUser) as ImageProvider,
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            state.userModel.userName!,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontSize: 20.sp),
                          ),
                          SizedBox(height: 10.h),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                AppRoutesName.userEditProfileScreenRoute,
                                arguments: [
                                  state.userModel.imgUrl ?? "",
                                  state.userModel.userName,
                                  state.userModel.email,
                                  state.userModel.phoneNumber,
                                ],
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(210.w, double.infinity)),
                            child:
                                Text(S.of(context).driver_profile_edit_button),
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          Shimmer.fromColors(
                            baseColor:
                                Theme.of(context).colorScheme.primaryContainer,
                            highlightColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            child: Container(
                              width: 100.w,
                              height: 15.w,
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                                borderRadius: BorderRadius.circular(50.r),
                                border:
                                    Border.all(width: 1, color: Colors.black),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Shimmer.fromColors(
                            baseColor:
                                Theme.of(context).colorScheme.primaryContainer,
                            highlightColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            child: Container(
                              width: 100.w,
                              height: 15.w,
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                                borderRadius: BorderRadius.circular(7.r),
                                border:
                                    Border.all(width: 1, color: Colors.black),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(210.w, double.infinity)),
                            child:
                                Text(S.of(context).driver_profile_edit_button),
                          ),
                        ],
                      );
                    }
                  },
                ),
                SizedBox(height: 10.h),
                DividerWidget(),
                Align(
                  alignment: isRTL(context)
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: InkWell(
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () => Navigator.pushNamed(
                        context, AppRoutesName.userTransactionsScreenRoute),
                    child: Text(S.of(context).user_profile_transactions,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontWeight: FontWeight.bold)),
                  ),
                ),
                Align(
                  alignment: isRTL(context)
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: InkWell(
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () => Navigator.pushNamed(
                        context, AppRoutesName.userHistoryBokkingScreenRoute),
                    child: Text(S.of(context).user_profile_booking_history,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontWeight: FontWeight.bold)),
                  ),
                ),
                DividerWidget(),
                Align(
                  alignment: isRTL(context)
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: InkWell(
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
                ),
                Align(
                  alignment: isRTL(context)
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: InkWell(
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
                ),
                Align(
                  alignment: isRTL(context)
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: InkWell(
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
                ),
                SizedBox(height: 10.h),
                DividerWidget(),
                Align(
                  alignment: isRTL(context)
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: InkWell(
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () => Navigator.pushNamed(
                        context, AppRoutesName.resetPasswordScreenRoute),
                    child: Text(S.of(context).driver_settings_change_password,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontWeight: FontWeight.bold)),
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
                          S.of(context).user_profile_theme_light,
                          style: Theme.of(context).textTheme.titleSmall),
                    ),
                  ),
                ),
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
                    onTap: () =>
                        _showLanguageBottomSheet(context, langProvider),
                    child: Consumer<LanguageProvider>(
                      builder: (context, value, child) => Text(
                          currentLang.toUpperCase(),
                          style: Theme.of(context).textTheme.titleSmall),
                    ),
                  ),
                ),
                DividerWidget(),
                Align(
                  alignment: isRTL(context)
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: InkWell(
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () async {
                      SharedPreferencesService().logout();
                      Navigator.pushNamedAndRemoveUntil(
                          context,
                          AppRoutesName.selectTypeScreenRoute,
                          (route) => false);
                    },
                    child: Text(
                      S.of(context).driver_settings_logout,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: AppColorLight.errorColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
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
              title: Text(S.of(context).user_profile_theme_light),
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
              title: Text(S.of(context).user_profile_theme_dark),
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
