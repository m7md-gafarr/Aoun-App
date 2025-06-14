import 'package:aoun_app/core/app_color/app_color_light.dart';
import 'package:aoun_app/core/router/route_name.dart';
import 'package:aoun_app/data/model/introducation_model.dart';
import 'package:aoun_app/data/repositories/local/shared_pref.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

/// IntroductionScreen is the onboarding screen shown to users when they first open the app.
/// It displays a series of introduction pages with images and text, and a button to proceed.
///
/// Features:
/// - Synchronized image and text carousels
/// - Dot indicators for navigation
/// - Next/Get Started button that adapts to the current page
/// - System back button handling to prevent accidental exits
/// - Shared preferences integration to track onboarding completion
class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  /// Controls the image carousel with a slight overlap between pages
  final _controllerImage = PageController(viewportFraction: 0.99);

  /// Controls the text carousel, synchronized with the image carousel
  final _controllerText = PageController(viewportFraction: 0.99);

  /// Flag to track when user reaches the last introduction page
  /// Used to change button text and behavior
  bool _islastpage = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Clean up resources by disposing PageControllers
    _controllerImage.dispose();
    _controllerText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // Handle system back button to prevent accidental exits during onboarding
      onWillPop: () async {
        // Exit the app completely instead of navigating back
        SystemNavigator.pop();
        return false; // Prevent default back navigation
      },

      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(13.0).r,
            child: Column(
              children: [
                // Top spacing to position content properly
                const Spacer(flex: 4),

                // =========================
                // Image Carousel Section
                // =========================
                SizedBox(
                  height: 300.h,
                  child: PageView.builder(
                    controller: _controllerImage,
                    // Prevent manual swiping to maintain sync with text carousel
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: IntroductionModel.introDataModel(context).length,
                    onPageChanged: (value) {
                      setState(() {
                        // Update last page flag when reaching the final page
                        _islastpage = (value == 2);
                      });
                    },
                    itemBuilder: (context, index) => Column(
                      children: [
                        // Display SVG illustration for current page
                        SvgPicture.asset(
                          IntroductionModel.introDataModel(context)[index].path,
                          width: 300.h,
                        ),
                      ],
                    ),
                  ),
                ),

                const Spacer(flex: 1),

                // =========================
                // Page Indicator Section
                // =========================
                SmoothPageIndicator(
                  controller: _controllerImage,
                  count: IntroductionModel.introDataModel(context).length,
                  // Animated dots that expand to show current page
                  effect: ExpandingDotsEffect(
                    dotHeight: 6,
                    dotWidth: 6,
                    activeDotColor: AppColorLight.primaryColor,
                  ),
                  // Enable dot navigation with synchronized carousels
                  onDotClicked: (index) {
                    // Animate both carousels simultaneously to maintain sync
                    _controllerImage.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                    _controllerText.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  },
                ),

                const Spacer(flex: 5),

                // =========================
                // Text Content Section
                // =========================
                SizedBox(
                  height: 120.h,
                  child: PageView.builder(
                    controller: _controllerText,
                    // Prevent manual swiping to maintain sync with image carousel
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: IntroductionModel.introDataModel(context).length,
                    itemBuilder: (context, index) => Column(
                      children: [
                        // Title text for current page
                        Text(
                          IntroductionModel.introDataModel(context)[index]
                              .title,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        SizedBox(height: 15.h),
                        // Description text with horizontal padding
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 16.0).r,
                          child: Text(
                            IntroductionModel.introDataModel(context)[index]
                                .text,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const Spacer(flex: 5),

                // =========================
                // Navigation Button Section
                // =========================
                ElevatedButton(
                  onPressed: () async {
                    if (_islastpage) {
                      // On last page: Complete onboarding
                      // Navigate to type selection and prevent back navigation
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutesName.selectTypeScreenRoute,
                        (route) => false,
                      );
                      // Mark introduction as completed in preferences
                      SharedPreferencesService().saveIntroductionStatus(true);
                    } else {
                      // Not last page: Advance both carousels simultaneously
                      _controllerText.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      );
                      _controllerImage.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      );
                    }
                  },
                  // Dynamic button text based on page position
                  child: Text(
                    _islastpage
                        ? S.of(context).intro_getstated_button // "Get Started"
                        : S.of(context).intro_next_button, // "Next"
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Terms and Policy Implementation Reference
/// This commented section provides a template for implementing
/// Terms and Privacy Policy links using RichText and TapGestureRecognizer.
/// Can be used as a reference for future implementation.
/*
// //Link to  Terms and policy
// RichText(
//   textAlign: TextAlign.center,
//   text: TextSpan(
//     children: [
//       TextSpan(
//         text: S.of(context).joining_terms,
//         style: Theme.of(context).textTheme.bodySmall,
//       ),
//       TextSpan(
//         text: S.of(context).terms_of_use,
//         style: Theme.of(context)
//             .textTheme
//             .bodySmall!
//             .copyWith(color: Theme.of(context).primaryColor),
//         recognizer: TapGestureRecognizer()
//           ..onTap = () {
//             Navigator.pushNamed(
//                 context, AppRoutesName.homeScreenRoute);
//           },
//       ),
//       TextSpan(
//         text: S.of(context).and,
//         style: Theme.of(context).textTheme.bodySmall,
//       ),
//       TextSpan(
//         text: S.of(context).privacy_policy,
//         style:
//             Theme.of(context).textTheme.labelMedium!.copyWith(
//                   color: Theme.of(context).primaryColor,
//                 ),
//       ),
//     ],
//   ),
// )
*/
