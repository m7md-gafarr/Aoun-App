import 'package:aoun_app/core/router/route_name.dart';
import 'package:aoun_app/presentation/driver/auth/views/driver_confirm_password_screen.dart';
import 'package:aoun_app/presentation/driver/auth/views/driver_login_screen.dart';
import 'package:aoun_app/presentation/driver/auth/views/driver_otp_screen.dart';
import 'package:aoun_app/presentation/driver/auth/views/driver_reset_password_screen.dart';
import 'package:aoun_app/presentation/introduction/select_type_screen.dart';
import 'package:aoun_app/presentation/user/auth/views/user_confirm_password_screen.dart';
import 'package:aoun_app/presentation/user/auth/views/user_register_screen.dart';
import 'package:aoun_app/presentation/user/auth/views/user_reset_password_screen.dart';
import 'package:aoun_app/presentation/driver/home/view/create_trip_screen.dart';
import 'package:aoun_app/presentation/driver/home/view/home_driver_screen.dart';
import 'package:aoun_app/presentation/driver/auth/views/driver_introduction_screen.dart';
import 'package:aoun_app/presentation/driver/auth/views/register_driver_screen.dart';
import 'package:aoun_app/presentation/user/home/views/screen/home_screen.dart';
import 'package:aoun_app/presentation/introduction/introduction_screen.dart';
import 'package:aoun_app/presentation/user/auth/views/user_login_screen.dart';
import 'package:aoun_app/presentation/user/auth/views/user_otp_screen.dart';
import 'package:aoun_app/presentation/splash/splash_screen.dart';
import 'package:animations/animations.dart';
import 'package:aoun_app/presentation/user/notification/view/user_notification_screen.dart';
import 'package:aoun_app/presentation/user/profile/view/user_edit_profile_screen.dart';
import 'package:aoun_app/presentation/user/profile/view/user_profile_screen.dart';
import 'package:aoun_app/presentation/user/transport/views/add_new_card_screen.dart';
import 'package:aoun_app/presentation/user/transport/views/book_trip_screen.dart';
import 'package:aoun_app/presentation/user/transport/views/mapSelectRoute_screen.dart';
import 'package:aoun_app/presentation/user/transport/views/mapViewRoute_screen.dart';
import 'package:aoun_app/presentation/user/transport/views/payment_screen.dart';
import 'package:aoun_app/presentation/user/transport/views/search_trip_screen.dart'
    show SearchTripScreen;
import 'package:aoun_app/presentation/user/transport/views/trip_details_screen.dart';
import 'package:flutter/material.dart';

import '../../presentation/user/auth/views/complet_user_data_screen.dart';

class AppRouter {
  Route generate_route(RouteSettings settings) {
    switch (settings.name) {
      //  Splash route
      case AppRoutesName.splashScreenRoute:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      //  introduction route
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

      //  Auth user route
      case AppRoutesName.userloginScreenRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const UserLoginScreen(),
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
      case AppRoutesName.userRegisterScreenRoute:
        return MaterialPageRoute(
            builder: (context) => const UserRegisterScreen());

      case AppRoutesName.userResetPasswordScreenRoute:
        return MaterialPageRoute(
            builder: (context) => const UserResetPasswordScreen());

      case AppRoutesName.userOTPScreenRoute:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const UserOtpScreen(),
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

      case AppRoutesName.userConfirmPasswordScreenRoute:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const UserConfirmPasswordScreen(),
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

      // Auth Driver route
      case AppRoutesName.driverloginScreenRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              DriverLoginScreen(),
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
      case AppRoutesName.driverResetPasswordScreenRoute:
        return MaterialPageRoute(
          builder: (context) => const DriverResetPasswordScreen(),
        );
      case AppRoutesName.driverOTPScreenRoute:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const DriverOTPScreen(),
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
      case AppRoutesName.driverConfirmPasswordScreenRoute:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const DriverConfirmPasswordScreen(),
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

      //   Home user Screen
      case AppRoutesName.homeUserScreenRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const HomeUserScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        );

      //   Home Driver Screen
      case AppRoutesName.homeDriverScreenRoute:
        return MaterialPageRoute(
          builder: (context) => HomeDriverScreen(),
        );

      //  Transport route
      case AppRoutesName.tripDetailsScreenRoute:
        return MaterialPageRoute(
            builder: (context) => const TripDetailsScreen());
      case AppRoutesName.mapViewRouteScreenRoute:
        return MaterialPageRoute(
            builder: (context) => const MapViewRouteScreen());
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

      /// User Profile Screen
      case AppRoutesName.userProfileScreenRoute:
        return MaterialPageRoute(builder: (context) => UserProfileScreen());
      case AppRoutesName.userEditProfileScreenRoute:
        return MaterialPageRoute(builder: (context) => UserEditProfileScreen());

      /// User Notification Screen
      case AppRoutesName.userNotificationScreenRoute:
        return MaterialPageRoute(
            builder: (context) => UserNotificationScreen());

      ///
      ////////////////////////////////////
      ///
      ///

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

      case AppRoutesName.createTripScreenRoute:
        return MaterialPageRoute(
          builder: (context) => CreateTripScreen(),
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
