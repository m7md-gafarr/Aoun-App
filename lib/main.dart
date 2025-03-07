import 'package:aoun_app/core/router/app_route.dart';
import 'package:aoun_app/core/utils/check_connection/check_connection_cubit.dart';
import 'package:aoun_app/core/utils/language.dart';
import 'package:aoun_app/data/repositories/local/shared_pref.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:aoun_app/presentation/auth/view_model/confirmPassword_cubit/confirm_password_cubit.dart';
import 'package:aoun_app/presentation/auth/view_model/login_cubit/login_cubit.dart';
import 'package:aoun_app/presentation/auth/view_model/register_cubit/register_cubit.dart';
import 'package:aoun_app/presentation/auth/view_model/sendOTPForPasswordReset_cubit/send_otp_for_password_reset_cubit.dart';
import 'package:aoun_app/presentation/auth/view_model/verifyOTP_cubit/verify_otp_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'core/Theme/app_theme_light.dart';
import 'core/router/route_name.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await ScreenUtil.ensureScreenSize();
  await SharedPreferencesService().init();

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
            create: (context) => RegisterCubit(CheckConnectionCubit())),
        BlocProvider(create: (context) => CheckConnectionCubit()),
      ],
      child: ChangeNotifierProvider(
        create: (context) => LanguageProvider(),
        child: AounApp(
          appRouter: AppRouter(),
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

          //Theme,
          theme: getThemeColorLight(context),

          // theme: MediaQuery.of(context).platformBrightness == Brightness.dark
          //     ? getThemeColorDark(context)
          //     : getThemeColorLight(context),
        );
      }),
    );
  }
}
