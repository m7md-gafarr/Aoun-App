import 'package:aoun_app/core/router/route_name.dart';
import 'package:aoun_app/presentation/driver/help%20and%20feedback/view/help_and_feedback_screen.dart';
import 'package:aoun_app/presentation/driver/history%20trips/view/driver_history_trips.dart';
import 'package:aoun_app/presentation/driver/home/view/created_trip_details_screen.dart';
import 'package:aoun_app/presentation/driver/home/view/select_route_on_map_screen.dart';
import 'package:aoun_app/presentation/driver/profile/view/driver_edit_profile.dart';
import 'package:aoun_app/presentation/driver/profile/view/driver_profile_screen.dart';
import 'package:aoun_app/presentation/driver/safety/view/driver_safety_screen.dart';
import 'package:aoun_app/presentation/driver/setting/view/driver_setting_screen.dart';
import 'package:aoun_app/presentation/driver/wallet%20and%20earings/view/wallet_and_earnings_screen.dart';
import 'package:aoun_app/presentation/info_pages/contact_us_page.dart';
import 'package:aoun_app/presentation/info_pages/privacy_policy_page.dart';
import 'package:aoun_app/presentation/info_pages/terms_conditions_page.dart';

import 'package:aoun_app/presentation/introduction/select_type_screen.dart';
import 'package:aoun_app/presentation/auth/views/confirm_password_screen.dart';
import 'package:aoun_app/presentation/auth/views/user_register_screen.dart';
import 'package:aoun_app/presentation/auth/views/reset_password_screen.dart';
import 'package:aoun_app/presentation/driver/home/view/create_trip_screen.dart';
import 'package:aoun_app/presentation/driver/home/view/home_driver_screen.dart';
import 'package:aoun_app/presentation/auth/views/driver_introduction_screen.dart';
import 'package:aoun_app/presentation/auth/views/driver_register_screen.dart';
import 'package:aoun_app/presentation/user/history%20booking/view/user_history_booking.dart';
import 'package:aoun_app/presentation/user/home/view/screen/home_screen.dart';
import 'package:aoun_app/presentation/introduction/introduction_screen.dart';
import 'package:aoun_app/presentation/auth/views/login_screen.dart';
import 'package:aoun_app/presentation/auth/views/otp_screen.dart';
import 'package:aoun_app/presentation/splash/splash_screen.dart';
import 'package:animations/animations.dart';
import 'package:aoun_app/presentation/user/notification/view/user_notification_screen.dart';
import 'package:aoun_app/presentation/user/profile/view/user_edit_profile_screen.dart';
import 'package:aoun_app/presentation/user/profile/view/user_profile_screen.dart';
import 'package:aoun_app/presentation/user/transport/view/add_new_card_screen.dart';
import 'package:aoun_app/presentation/user/transport/view/book_trip_screen.dart';
import 'package:aoun_app/presentation/user/transport/view/map_select_route_screen.dart';
import 'package:aoun_app/presentation/user/transport/view/map_view_route_screen.dart';
import 'package:aoun_app/presentation/user/transport/view/payment_screen.dart';
import 'package:aoun_app/presentation/user/transport/view/search_trip_screen.dart'
    show SearchTripScreen;
import 'package:aoun_app/presentation/user/transport/view/trip_details_screen.dart';
import 'package:aoun_app/presentation/user/transactions/view/UserTransactionsScreen.dart';
import 'package:flutter/material.dart';

import '../../presentation/auth/views/complet_user_data_screen.dart';

class AppRouter {
  Route generate_route(RouteSettings settings) {
    switch (settings.name) {
      //TODO :  Splash route
      case AppRoutesName.splashScreenRoute:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      //TODO :  introduction route
      case AppRoutesName.introductionScreenRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const IntroductionScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
      case AppRoutesName.selectTypeScreenRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              SelectTypeScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );

      //TODO :  Auth Routes

      case AppRoutesName.loginScreenRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const LoginScreen(),
        );
      case AppRoutesName.userRegisterScreenRoute:
        return MaterialPageRoute(
            builder: (context) => const UserRegisterScreen());
      case AppRoutesName.resetPasswordScreenRoute:
        return MaterialPageRoute(
            builder: (context) => const ResetPasswordScreen());
      case AppRoutesName.oTPScreenRoute:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const OtpScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.horizontal,
              fillColor: Theme.of(context).scaffoldBackgroundColor,
              child: child,
            );
          },
        );
      case AppRoutesName.confirmPasswordScreenRoute:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const ConfirmPasswordScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.horizontal,
              fillColor: Theme.of(context).scaffoldBackgroundColor,
              child: child,
            );
          },
        );
      case AppRoutesName.completeUserDataScreenRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const CompletUserDataScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.horizontal,
              fillColor: Theme.of(context).scaffoldBackgroundColor,
              child: child,
            );
          },
        );
      case AppRoutesName.driverRegisterScreenRoute:
        return MaterialPageRoute(
            builder: (context) => const DriverRegisterScreen());

      //TODO : User Routes

      //   Home route

      case AppRoutesName.homeUserScreenRoute:
        return MaterialPageRoute(builder: (context) => const HomeUserScreen());

      //  Transport route
      case AppRoutesName.tripDetailsScreenRoute:
        return MaterialPageRoute(builder: (context) => TripDetailsScreen());

      case AppRoutesName.mapViewRouteScreenRoute:
        return MaterialPageRoute(builder: (context) => MapViewRouteScreen());

      case AppRoutesName.userTransactionsScreenRoute:
        return MaterialPageRoute(
            builder: (context) => UserTransactionsScreen());

      case AppRoutesName.userHistoryBokkingScreenRoute:
        return MaterialPageRoute(
            builder: (context) => UserHistoryBokkingScreen());

      case AppRoutesName.mapSelectRouteScreenRoute:
        return MaterialPageRoute(
            builder: (context) => const MapSelectRouteScreen());

      case AppRoutesName.searchTripScreenRoute:
        return MaterialPageRoute(
            builder: (context) => const SearchTripScreen());

      case AppRoutesName.bookTripScreenRoute:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const BookTripScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.horizontal,
              fillColor: Theme.of(context).scaffoldBackgroundColor,
              child: child,
            );
          },
        );
      case AppRoutesName.paymentScreenRoute:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              PaymentScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.horizontal,
              fillColor: Theme.of(context).scaffoldBackgroundColor,
              child: child,
            );
          },
        );
      case AppRoutesName.addNewCardScreenRoute:
        return MaterialPageRoute(
            builder: (context) => const AddNewCardScreen());

      //  Profile route
      case AppRoutesName.userProfileScreenRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => UserProfileScreen(),
        );
      case AppRoutesName.userEditProfileScreenRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => UserEditProfileScreen(),
        );

      //  Notification route
      case AppRoutesName.userNotificationScreenRoute:
        return MaterialPageRoute(
            builder: (context) => UserNotificationScreen());

      ////////////////////////////////////////////////////////

      //TODO :  Driver Routes

      //   Home route
      case AppRoutesName.homeDriverScreenRoute:
        return MaterialPageRoute(builder: (context) => HomeDriverScreen());

      //  Introduction before login or register route
      case AppRoutesName.driverIntroductionScreenRoute:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const DriverIntroductionScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.horizontal,
              fillColor: Theme.of(context).scaffoldBackgroundColor,
              child: child,
            );
          },
        );

      //  Trip route
      case AppRoutesName.driverCreateTripScreenRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => CreateTripScreen(),
        );
      case AppRoutesName.driverSelectRouteOnMapScreenRoute:
        return MaterialPageRoute(
          builder: (context) => SelectRouteOnMapScreen(),
        );
      case AppRoutesName.createdTripDetailsScreenRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => CreatedTripDetailsScreen(),
        );

      // Driver profile
      case AppRoutesName.driverProfileScreenRoute:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const DriverProfileScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.horizontal,
              fillColor: Theme.of(context).scaffoldBackgroundColor,
              child: child,
            );
          },
        );
      case AppRoutesName.driverEditProfileScreenRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => DriverEditProfile(),
        );
      case AppRoutesName.driverWalletAndEarningsScreenRoute:
        return MaterialPageRoute(
          builder: (context) => DriverWalletAndEarningsScreen(),
        );

      case AppRoutesName.driverHistoryTripsScreenRoute:
        return MaterialPageRoute(
          builder: (context) => DriverHistoryTripsScreen(),
        );

      // case AppRoutesName.notificationScreenRoute:
      //   return MaterialPageRoute(
      //     builder: (context) => NotificationScreen(),
      //   );

      case AppRoutesName.driverSafetyScreenRoute:
        return MaterialPageRoute(
          builder: (context) => DriverSafetyScreen(),
        );

      case AppRoutesName.driverHelpFeedbackScreenRoute:
        return MaterialPageRoute(
          builder: (context) => HelpAndFeedbackScreen(),
        );

      case AppRoutesName.driverSettingScreenRoute:
        return MaterialPageRoute(
          builder: (context) => DriverSettingScreen(),
        );
      //todo:   info_pages

      case AppRoutesName.contactUsScreenRoute:
        return MaterialPageRoute(
          builder: (context) => ContactUsScreen(),
        );
      case AppRoutesName.privacyPolicyScreenRoute:
        return MaterialPageRoute(
          builder: (context) => PrivacyPolicyScreen(),
        );
      case AppRoutesName.termsConditionsScreenRoute:
        return MaterialPageRoute(
          builder: (context) => TermsConditionsScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("The Route Not Found"),
            ),
          ),
        );
    }
  }
}
