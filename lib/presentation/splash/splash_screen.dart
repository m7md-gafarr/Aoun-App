import 'package:aoun_app/core/app_images/app_images.dart';
import 'package:aoun_app/core/router/route_name.dart';
import 'package:aoun_app/data/repositories/local/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    _loadIntroductionPref();
  }

  Future<void> _loadIntroductionPref() async {
    bool? seen = await SharedPreferencesService().getIntroductionStatus();

    bool? loggedIn = await SharedPreferencesService().isUserLoggedIn();

    bool? isUserMode = await SharedPreferencesService().getUserMode();

    if (!mounted) return;

    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        Navigator.pushNamedAndRemoveUntil(
          context,

          seen
              ? (loggedIn
                  ? (isUserMode!
                      ? AppRoutesName.homeUserScreenRoute // Logged in user
                      : AppRoutesName.homeDriverScreenRoute) // Logged in driver
                  : AppRoutesName.selectTypeScreenRoute) // Not logged in
              : AppRoutesName.introductionScreenRoute, // First time user
          (Route<dynamic> route) => false, // Remove all previous routes
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                const Spacer(flex: 4),
                SvgPicture.asset(
                  Assets.imageLogoLogo,
                  height: MediaQuery.of(context).size.width - 180,
                ),
                const Spacer(flex: 4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
