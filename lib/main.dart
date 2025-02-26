import 'package:aoun_app/core/router/app_route.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/Theme/app_theme_light.dart';
import 'core/router/route_name.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await ScreenUtil.ensureScreenSize();
  // runApp(
  //   DevicePreview(
  //     enabled: !kReleaseMode,
  //     builder: (context) => AounApp(
  //       appRouter: AppRouter(),
  //     ),
  //   ),
  // );

  runApp(
    AounApp(
      appRouter: AppRouter(),
    ),
  );
}

class AounApp extends StatelessWidget {
  const AounApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (_, child) => MaterialApp(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
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

        //Theme,
        theme: getThemeColorLight(context),

        // theme: MediaQuery.of(context).platformBrightness == Brightness.dark
        //     ? getThemeColorDark(context)
        //     : getThemeColorLight(context),
      ),
    );
  }
}
