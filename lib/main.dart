import 'package:aoun_app/core/Theme/app_theme_dark.dart';
import 'package:aoun_app/core/router/app_route.dart';
import 'package:aoun_app/core/router/route_name.dart';
import 'package:aoun_app/core/utils/check_connection/check_connection_cubit.dart';
import 'package:aoun_app/core/utils/language/language.dart';
import 'package:aoun_app/core/utils/location/location_Provider.dart';
import 'package:aoun_app/data/model/debit_card_model/debit_card_model.dart';
import 'package:aoun_app/data/repositories/local/hive.dart';
import 'package:aoun_app/data/repositories/local/shared_pref.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:aoun_app/presentation/auth/view_model/driver_register_cubit/register_cubit.dart';
import 'package:aoun_app/presentation/auth/view_model/confirmPassword_cubit/confirm_password_cubit.dart';
import 'package:aoun_app/presentation/auth/view_model/login_cubit/login_cubit.dart';
import 'package:aoun_app/presentation/auth/view_model/user_register_cubit/register_cubit.dart';
import 'package:aoun_app/presentation/auth/view_model/sendOTPForPasswordReset_cubit/send_otp_for_password_reset_cubit.dart';
import 'package:aoun_app/presentation/auth/view_model/verifyOTP_cubit/verify_otp_cubit.dart';
import 'package:aoun_app/presentation/user/transport/view_model/add%20new%20debit%20card/add_new_debit_card_cubit.dart';
import 'package:aoun_app/presentation/user/transport/view_model/payment%20wallet/payment_wallet_cubit.dart';
import 'package:aoun_app/presentation/user/transport/view_model/view%20debit%20card/view_all_debit_card_cubit.dart';
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
      ],
      child: Builder(
        builder: (context) => MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => LocationProvider(context),
            ),
            ChangeNotifierProvider(
              create: (_) => LanguageProvider(),
            ),
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
        return MaterialApp(
          locale: languageProvider.locale,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            ...S.delegate.supportedLocales,
          ],
          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRouter.generate_route,

          //Route,
          initialRoute: AppRoutesName.splashScreenRoute,
          // home: MapScreen(),

          // //Theme,
          // theme: getThemeColorLight(context),

          theme: MediaQuery.of(context).platformBrightness == Brightness.dark
              ? getThemeColorDark(context)
              : getThemeColorLight(context),
        );
      }),
    );
  }
}
