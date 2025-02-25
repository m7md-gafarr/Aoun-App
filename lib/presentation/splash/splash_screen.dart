import 'package:aoun_app/core/app_images/app_images.dart';
import 'package:aoun_app/core/constant/constant.dart';
import 'package:aoun_app/core/router/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  bool? _seen;

  @override
  void initState() {
    super.initState();
    _loadIntroductionPref();
  }

  Future<void> _loadIntroductionPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _seen = prefs.getBool(introductionPref) ?? false;

    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          _seen!
              ? AppRoutesName.loginScreenRoute
              : AppRoutesName.introductionScreenRoute,
          (Route<dynamic> route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Set the background color based on the theme
      backgroundColor: Theme.of(context).secondaryHeaderColor,

      body: Stack(
        children: [
          // Full-width container using SizedBox
          SizedBox(
            width: MediaQuery.of(context)
                .size
                .width, // Make it as wide as the screen

            child: Column(
              children: [
                // Creates flexible spacing above the logo
                const Spacer(flex: 4),

                // Displays the logo from assets
                SvgPicture.asset(
                  Assets.imageLogoLogo,
                  height: MediaQuery.of(context).size.width - 180,
                ),

                // Creates flexible spacing below the logo
                const Spacer(flex: 4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
