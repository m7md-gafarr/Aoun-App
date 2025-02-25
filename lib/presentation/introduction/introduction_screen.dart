import 'package:aoun_app/core/app_color/app_color_light.dart';
import 'package:aoun_app/core/router/route_name.dart';
import 'package:aoun_app/data/model/introducation_model.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final _controllerImage = PageController(viewportFraction: 0.99);
  final _controllerText = PageController(viewportFraction: 0.99);
  bool _islastpage = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controllerImage.dispose();
    _controllerText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // Prevents the user from navigating back using the system back button
      onWillPop: () async {
        SystemNavigator.pop(); // Exits the app
        return false; // Prevents the default back action
      },

      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.all(13.0).r, // Adds padding around the content
            child: Column(
              children: [
                const Spacer(flex: 4),

                // Displays a list of introduction SVG images
                SizedBox(
                  height: 300.h, // Sets a fixed height for the image carousel
                  child: PageView.builder(
                    controller: _controllerImage, // Controls page navigation
                    physics:
                        const NeverScrollableScrollPhysics(), // Disables manual scrolling
                    itemCount: IntroductionModel.introDataModel(context)
                        .length, // Number of pages

                    // Handles page changes to check if it's the last page
                    onPageChanged: (value) {
                      if (value == 2) {
                        setState(() {
                          _islastpage = true;
                        });
                      } else {
                        setState(() {
                          _islastpage = false;
                        });
                      }
                    },

                    // Builds each page in the introduction slider
                    itemBuilder: (context, index) => Column(
                      children: [
                        SvgPicture.asset(
                          IntroductionModel.introDataModel(context)[index].path,
                          width: 300.h,
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(flex: 1),
                // Dots indicator for the introduction pages
                SmoothPageIndicator(
                  controller:
                      _controllerImage, // Connects to the image page controller
                  count: IntroductionModel.introDataModel(context)
                      .length, // Number of dots
                  effect: ExpandingDotsEffect(
                    dotHeight: 6,
                    dotWidth: 6,
                    activeDotColor:
                        AppColorLight.primaryColor, // Sets the active dot color
                  ),

                  // Allows clicking on dots to navigate pages
                  onDotClicked: (index) {
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

                // Displays a list of introduction text content
                SizedBox(
                  height: 120.h, // Sets a fixed height for the text carousel
                  child: PageView.builder(
                    controller:
                        _controllerText, // Controls text page navigation
                    physics:
                        const NeverScrollableScrollPhysics(), // Disables manual scrolling
                    itemCount: IntroductionModel.introDataModel(context)
                        .length, // Number of pages

                    // Builds each text page
                    itemBuilder: (context, index) => Column(
                      children: [
                        Text(
                          IntroductionModel.introDataModel(context)[index]
                              .title, // Page title
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall, // Uses theme styling
                        ),
                        SizedBox(
                            height:
                                15.h), // Adds spacing between title and text

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0)
                              .r, // Adds horizontal padding
                          child: Text(
                            IntroductionModel.introDataModel(context)[index]
                                .text, // Page description
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium, // Uses theme styling
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const Spacer(flex: 5),

                // Next Button for navigating through introduction pages
                ElevatedButton(
                  onPressed: () async {
                    if (_islastpage == true) {
                      // Navigate to the login screen when the last page is reached
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutesName.loginScreenRoute,
                        (route) => false, // Removes all previous routes
                      );

                      // Save introduction completion status in SharedPreferences
                      SharedPreferences pref =
                          await SharedPreferences.getInstance();
                      pref.setBool("introductionPref", true);
                    } else {
                      // Move to the next page in both text and image carousels
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

                  // Changes button text dynamically based on the last page status
                  child: Text(
                    _islastpage
                        ? S
                            .of(context)
                            .intro_getstated_button // "Get Started" text
                        : S.of(context).intro_next_button, // "Next" text
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

// //Link to  Terms and policy
//               RichText(
//                 textAlign: TextAlign.center,
//                 text: TextSpan(
//                   children: [
//                     TextSpan(
//                       text: S.of(context).joining_terms,
//                       style: Theme.of(context).textTheme.bodySmall,
//                     ),
//                     TextSpan(
//                       text: S.of(context).terms_of_use,
//                       style: Theme.of(context)
//                           .textTheme
//                           .bodySmall!
//                           .copyWith(color: Theme.of(context).primaryColor),
//                       recognizer: TapGestureRecognizer()
//                         ..onTap = () {
//                           Navigator.pushNamed(
//                               context, AppRoutesName.homeScreenRoute);
//                         },
//                     ),
//                     TextSpan(
//                       text: S.of(context).and,
//                       style: Theme.of(context).textTheme.bodySmall,
//                     ),
//                     TextSpan(
//                       text: S.of(context).privacy_policy,
//                       style:
//                           Theme.of(context).textTheme.labelMedium!.copyWith(
//                                 color: Theme.of(context).primaryColor,
//                               ),
//                     ),
//                   ],
//                 ),
//               )
