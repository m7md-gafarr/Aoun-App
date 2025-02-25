import 'package:aoun_app/core/app_color/app_color_light.dart';
import 'package:aoun_app/core/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData getThemeColorDark(BuildContext context) => ThemeData(
      primaryColor: AppColorLight.primaryColor,
      secondaryHeaderColor: AppColorLight.secondaryColor,
      scaffoldBackgroundColor: AppColorLight.backgroundColor,

      //
      colorScheme: const ColorScheme.light(
        outline: Color(0xff616161),
      ),
      //AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: AppColorLight.appBarColor,
      ),

      //Icon Button
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          iconColor: WidgetStatePropertyAll(AppColorLight.iconPrimaryColor),
          foregroundColor:
              WidgetStatePropertyAll(AppColorLight.backgroundColor),
        ),
      ),

      //Elevated Button
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          fixedSize: const WidgetStatePropertyAll(Size(double.maxFinite, 47)),
          shape: const WidgetStatePropertyAll(
            ContinuousRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(27)),
            ),
          ),
          textStyle: WidgetStatePropertyAll(
            TextStyle(
              letterSpacing: .7,
              fontFamily: isRTL(context) ? fontArabic : fontEnglish,
              // fontSize: 18 * ScaleSize.textScaleFactor(context),
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          elevation: const WidgetStatePropertyAll(0),
          backgroundColor: WidgetStateProperty.all(
              AppColorLight.primaryColor), // Button background color
          foregroundColor:
              WidgetStateProperty.all(AppColorLight.textPrimary), // Text color
        ),
      ),

      //Icon
      iconTheme: IconThemeData(
        color: AppColorLight.iconPrimaryColor,
        size: 27,
      ),

      // Text,
      textTheme: TextTheme(
        // Headline - Large Titles (Used for Page Titles or Important Headlines)
        headlineLarge: _getTextStyle(
            AppColorLight.textPrimary, 32, FontWeight.bold, context),
        headlineMedium: _getTextStyle(
            AppColorLight.textPrimary, 28, FontWeight.bold, context),
        headlineSmall: _getTextStyle(
            AppColorLight.textPrimary, 24, FontWeight.bold, context),

        // Title - Medium Titles (Used for Section Titles)
        titleLarge: _getTextStyle(
            AppColorLight.textPrimary, 22, FontWeight.w600, context),
        titleMedium: _getTextStyle(
            AppColorLight.textPrimary, 20, FontWeight.w600, context),
        titleSmall: _getTextStyle(
            AppColorLight.textPrimary, 18, FontWeight.w500, context),

        // Body - Normal Text (Used for Main Paragraphs and Content)
        bodyLarge: _getTextStyle(
            AppColorLight.textSecondary, 16, FontWeight.normal, context),
        bodyMedium: _getTextStyle(
            AppColorLight.textSecondary, 14, FontWeight.normal, context),
        bodySmall: _getTextStyle(
            AppColorLight.textSecondary, 12, FontWeight.normal, context),

        // Labels -   Small Captions
        labelLarge: _getTextStyle(
            AppColorLight.textTertiary, 16, FontWeight.w500, context),
        labelMedium: _getTextStyle(
            AppColorLight.textTertiary, 14, FontWeight.w500, context),
        labelSmall: _getTextStyle(
            AppColorLight.textTertiary, 12, FontWeight.w500, context),
      ),

      // Text Field
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColorLight.containerBackgroundColor,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColorLight.primaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColorLight.primaryColor),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColorLight.errorColor),
        ),
        prefixIconColor: AppColorLight.primaryColor,
        labelStyle: TextStyle(
          color: AppColorLight.primaryColor,
          fontSize: 16.0.sp,
        ),
        hintStyle: TextStyle(
          color: AppColorLight.textPrimary,
          fontSize: 17.sp,
          fontWeight: FontWeight.normal,
          fontFamily: isRTL(context) ? fontArabic : fontEnglish,
        ),
      ),

      //Bottom Sheet
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: AppColorLight.backgroundColor,
        dragHandleSize: const Size(double.infinity, 4),
        dragHandleColor: AppColorLight.primaryColor,
      ),

      // Progress Indicator
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: AppColorLight.primaryColor,
      ),

      //Text Button
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: WidgetStatePropertyAll(
            TextStyle(
              fontFamily: isRTL(context) ? fontArabic : fontEnglish,
              fontSize: 18.sp,
            ),
          ),
          foregroundColor: WidgetStatePropertyAll(
            AppColorLight.linkTextColor,
          ),
        ),
      ),

      //Divider
      dividerTheme: DividerThemeData(
        color: AppColorLight.dividerColor,
        thickness: 1.2,
        endIndent: 10,
        indent: 10,
      ),
      dialogTheme:
          DialogThemeData(backgroundColor: AppColorLight.backgroundColor),
    );

TextStyle _getTextStyle(
    Color color, double fontSize, FontWeight fontWeight, BuildContext context) {
  return TextStyle(
    color: color,
    fontFamily: isRTL(context) ? fontArabic : fontEnglish,
    // fontSize: fontSize * ScaleSize.textScaleFactor(context),
    fontSize: fontSize.sp,
    fontWeight: fontWeight,
  );
}
