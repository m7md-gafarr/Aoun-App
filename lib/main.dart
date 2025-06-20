import 'package:aoun_app/core/Theme/app_theme_dark.dart';
import 'package:aoun_app/core/router/app_route.dart';
import 'package:aoun_app/core/router/route_name.dart';
import 'package:aoun_app/core/utils/Theme/theme_provider.dart';
import 'package:aoun_app/core/utils/check_connection/check_connection_cubit.dart';
import 'package:aoun_app/core/utils/language/language.dart';
import 'package:aoun_app/core/utils/location/location_Provider.dart';
import 'package:aoun_app/data/model/payment%20models/debit_card_model/debit_card_model.dart';
import 'package:aoun_app/data/repositories/local/hive.dart';
import 'package:aoun_app/data/repositories/local/shared_pref.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:aoun_app/presentation/auth/view_model/driver_register_cubit/register_cubit.dart';
import 'package:aoun_app/presentation/auth/view_model/confirmPassword_cubit/confirm_password_cubit.dart';
import 'package:aoun_app/presentation/auth/view_model/login_cubit/login_cubit.dart';
import 'package:aoun_app/presentation/auth/view_model/user_register_cubit/register_cubit.dart';
import 'package:aoun_app/presentation/auth/view_model/sendOTPForPasswordReset_cubit/send_otp_for_password_reset_cubit.dart';
import 'package:aoun_app/presentation/auth/view_model/verifyOTP_cubit/verify_otp_cubit.dart';
import 'package:aoun_app/presentation/driver/history%20trips/view_model/driver_trips_history/driver_trips_history_cubit.dart';
import 'package:aoun_app/presentation/driver/home/view_model/cancel_trip/cancel_trip_cubit.dart';
import 'package:aoun_app/presentation/driver/home/view_model/complete_trip/complete_trip_cubit.dart';
import 'package:aoun_app/presentation/driver/home/view_model/delete%20trip/deletetrip_cubit.dart';
import 'package:aoun_app/presentation/driver/home/view_model/driver%20dashboard/driver_dashboard_cubit.dart';
import 'package:aoun_app/presentation/driver/home/view_model/textfeild%20search%20location/textfeild_search_location_cubit.dart';
import 'package:aoun_app/presentation/driver/home/view_model/active%20trip%20request/active_trip_requests_cubit.dart';
import 'package:aoun_app/presentation/driver/home/view_model/amenities/amenities_cubit.dart';
import 'package:aoun_app/presentation/driver/home/view_model/driver%20create%20trip%20or%20not/driver_create_trip_or_not_cubit.dart';
import 'package:aoun_app/presentation/driver/home/view_model/grate%20trip/create_trip_cubit.dart';
import 'package:aoun_app/presentation/driver/home/view_model/street%20name/street_name_cubit.dart';
import 'package:aoun_app/presentation/driver/profile/view_model/driver_edit_profile_data/driver_edit_profile_data_cubit.dart';
import 'package:aoun_app/presentation/driver/profile/view_model/get_driver_data/get_driver_data_cubit.dart';
import 'package:aoun_app/presentation/driver/wallet%20and%20earings/view_model/transactions/transactions_cubit.dart';
import 'package:aoun_app/presentation/driver/wallet%20and%20earings/view_model/withdraw_from_wallet/withdraw_from_wallet_cubit.dart';
import 'package:aoun_app/presentation/info_pages/view_model/contant_us/contant_us_cubit.dart';
import 'package:aoun_app/presentation/user/history%20booking/view_model/user_booking_history/user_booking_history_cubit.dart';
import 'package:aoun_app/presentation/user/profile/view_model/get_user_info/get_user_info_cubit.dart';
import 'package:aoun_app/presentation/user/profile/view_model/user_edit_profile_data/user_edit_profile_data_cubit.dart';
import 'package:aoun_app/presentation/user/transport/view_model/add_new_debit_card/add_new_debit_card_cubit.dart';
import 'package:aoun_app/presentation/user/transport/view_model/booking_trip/booking_trip_cubit.dart';
import 'package:aoun_app/presentation/user/transport/view_model/create_request_trip/create_request_trip_cubit.dart';
import 'package:aoun_app/presentation/user/transport/view_model/get_trips/get_trips_cubit.dart';
import 'package:aoun_app/presentation/user/transport/view_model/payment_card/payment_card_cubit.dart';
import 'package:aoun_app/presentation/user/transport/view_model/payment_wallet/payment_wallet_cubit.dart';
import 'package:aoun_app/presentation/user/transport/view_model/recommendation_trip/recommendation_trip_cubit.dart';
import 'package:aoun_app/presentation/user/transport/view_model/search_trip/search_trip_cubit.dart';
import 'package:aoun_app/presentation/user/transport/view_model/view_debit_card/view_all_debit_card_cubit.dart';
import 'package:aoun_app/presentation/user/transactions/view_model/transactions/transactions_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'core/Theme/app_theme_light.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  final String? apiUrl = dotenv.env['PUBLISHABLE_KEY_STRIPE'];
  Stripe.publishableKey = apiUrl!;
  await ScreenUtil.ensureScreenSize();
  await SharedPreferencesService().init();

  await Hive.initFlutter();
  Hive.registerAdapter(DebitCardModelAdapter());
  await Hive.openBox<DebitCardModel>(HiveService.DEBITCARDBOX);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit(CheckConnectionCubit())),
        BlocProvider(
            create: (context) =>
                SendOtpForPasswordResetCubit(CheckConnectionCubit())),
        BlocProvider(
            create: (context) => VerifyOtpCubit(CheckConnectionCubit())),
        BlocProvider(
            create: (context) => ConfirmPasswordCubit(CheckConnectionCubit())),
        BlocProvider(
            create: (context) => UserRegisterCubit(CheckConnectionCubit())),
        BlocProvider(create: (context) => CheckConnectionCubit()),
        BlocProvider(create: (context) => ViewAllDebitCardCubit()),
        BlocProvider(create: (context) => AddNewDebitCardCubit()),
        BlocProvider(create: (context) => PaymentWalletCubit()),
        BlocProvider(
            create: (context) => DriverRegisterCubit(CheckConnectionCubit())),
        BlocProvider(create: (context) => AmenitiesCubit()),
        BlocProvider(
            create: (context) => CreateTripCubit(CheckConnectionCubit())),
        BlocProvider(create: (context) => TextfeildSearchLocationCubit()),
        BlocProvider(create: (context) => StreetNameCubit()),
        BlocProvider(create: (context) => ActiveTripRequestsCubit()),
        BlocProvider(create: (context) => SearchTripCubit()),
        BlocProvider(create: (context) => CreateRequestTripCubit()),
        BlocProvider(create: (context) => GetDriverDataCubit()),
        BlocProvider(create: (context) => GetTripsCubit()),
        BlocProvider(create: (context) => CancelTripCubit()),
        BlocProvider(create: (context) => DeletetripCubit()),
        BlocProvider(create: (context) => TransactionsCubit()),
        BlocProvider(create: (context) => WithdrawFromWalletCubit()),
        BlocProvider(create: (context) => BookingTripCubit()),
        BlocProvider(create: (context) => ContantUsCubit()),
        BlocProvider(create: (context) => UserEditProfileDataCubit()),
        BlocProvider(create: (context) => GetUserInfoCubit()),
        BlocProvider(create: (context) => DriverDashboardCubit()),
        BlocProvider(create: (context) => DriverTripsHistoryCubit()),
        BlocProvider(create: (context) => DriverEditProfileDataCubit()),
        BlocProvider(create: (context) => RecommendationTripCubit()),
        BlocProvider(create: (context) => UserTransactionsCubit()),
        BlocProvider(create: (context) => UserBookingHistoryCubit()),
        BlocProvider(
            create: (context) => PaymentCardCubit(CheckConnectionCubit())),
        BlocProvider(create: (context) => CompleteTripCubit()),
        BlocProvider(
            create: (context) =>
                DriverCreateTripOrNotCubit(CheckConnectionCubit())),
      ],
      child: Builder(
        builder: (context) => MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => LocationProvider()),
            ChangeNotifierProvider(create: (_) => LanguageProvider()),
            ChangeNotifierProvider(create: (_) => ThemeProvider()),
          ],
          child: AounApp(
            appRouter: AppRouter(),
          ),
        ),
      ),
    ),
  );
}

class AounApp extends StatelessWidget {
  const AounApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (_, child) => Consumer<LanguageProvider>(
        builder: (context, languageProvider, child) {
          return Consumer<ThemeProvider>(
            builder: (context, themeProvider, _) {
              return MaterialApp(
                locale: languageProvider.locale,
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                debugShowCheckedModeBanner: false,
                onGenerateRoute: appRouter.generate_route,
                initialRoute: AppRoutesName.splashScreenRoute,
                themeMode: themeProvider.themeMode,
                theme: getThemeColorLight(context, languageProvider.locale),
                darkTheme: getThemeColorDark(context, languageProvider.locale),
              );
            },
          );
        },
      ),
    );
  }
}
