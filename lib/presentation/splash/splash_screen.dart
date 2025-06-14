import 'package:aoun_app/core/app_images/app_images.dart';
import 'package:aoun_app/core/router/route_name.dart';
import 'package:aoun_app/data/repositories/local/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// SplashScreen serves as the initial loading screen of the application.
/// It handles the app's initialization logic and determines the appropriate
/// navigation route based on the user's authentication state and preferences.
///
/// Key features:
/// - Displays app logo during initialization
/// - Checks user's authentication status
/// - Verifies if introduction screens have been shown
/// - Routes to appropriate screen based on user state
/// - Handles both user and driver modes
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

/// State class for SplashScreen that includes animation capabilities
/// through SingleTickerProviderStateMixin
class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    // Start loading preferences and determining navigation route
    _loadIntroductionPref();
  }

  /// Loads user preferences and determines the appropriate navigation route
  ///
  /// This method checks three key pieces of state:
  /// 1. Whether the user has seen the introduction screens
  /// 2. Whether the user is logged in
  /// 3. Whether the app is in user or driver mode
  ///
  /// Based on these states, it navigates to one of:
  /// - Introduction screen (for first-time users)
  /// - Select type screen (for logged-out users)
  /// - User home screen (for logged-in users)
  /// - Driver home screen (for logged-in drivers)
  Future<void> _loadIntroductionPref() async {
    // Check if user has seen introduction screens
    bool? seen = await SharedPreferencesService().getIntroductionStatus();
    // Check if user is logged in
    bool? loggedIn = await SharedPreferencesService().isUserLoggedIn();
    // Check if app is in user mode (as opposed to driver mode)
    bool? isUserMode = await SharedPreferencesService().getUserMode();

    // Prevent navigation if widget is disposed
    if (!mounted) return;

    // Add a small delay for splash screen visibility
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        // Navigate and remove all previous routes
        Navigator.pushNamedAndRemoveUntil(
          context,
          // Determine the appropriate route based on user state:
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
      // Use theme's secondary header color for background
      backgroundColor: Theme.of(context).secondaryHeaderColor,

      body: Stack(
        children: [
          // Container that spans full width of screen
          SizedBox(
            // Use MediaQuery to get screen width
            width: MediaQuery.of(context).size.width,

            child: Column(
              children: [
                // Top spacing that takes 4/9 of available space
                const Spacer(flex: 4),

                // Logo display
                // Height is screen width minus 180 for proportional scaling
                SvgPicture.asset(
                  Assets.imageLogoLogo,
                  height: MediaQuery.of(context).size.width - 180,
                ),

                // Bottom spacing that takes 4/9 of available space
                // This centers the logo vertically when combined with top Spacer
                const Spacer(flex: 4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
