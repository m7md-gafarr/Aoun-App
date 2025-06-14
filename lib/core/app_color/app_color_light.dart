import 'package:flutter/material.dart';

/// AppColorLight defines the light theme color palette for the Aoun application.
/// This class contains static color definitions that are used throughout the app
/// to maintain consistent styling in light mode.
class AppColorLight {
  // Primary branding colors
  /// The main brand color - bright green (#83cd20)
  /// Used for primary actions, key UI elements, and brand identity
  static Color primaryColor = const Color(0xff83cd20);

  /// The secondary brand color - deep forest green (#034833)
  /// Used for complementary UI elements and text that needs emphasis
  static Color secondaryColor = const Color(0xff034833);

  // Status indicator colors
  /// Warning state color - orange (#fb8c00)
  /// Used for alerts, warnings, and cautionary messages
  static Color warningColor = const Color(0xfffb8c00);

  /// Error state color - red (#ff0000)
  /// Used for error messages, failed states, and critical alerts
  static Color errorColor = const Color(0xffff0000);

  /// Information state color - grey (#b8b8b8)
  /// Used for informational messages and neutral states
  static Color infoColor = const Color(0xffb8b8b8);

  /// Success state color - green (#43a047)
  /// Used for success messages and completed states
  static Color successColor = const Color(0xff43a047);

  // Background colors
  /// Main background color - white (#ffffff)
  /// Used as the primary background color for screens and large containers
  static Color backgroundColor = const Color(0xffffffff);

  /// Secondary background color - light green (#f1f5eb)
  /// Used for cards, sections, and to create visual hierarchy
  static Color containerBackgroundColor = const Color(0xfff1f5eb);

  // Text hierarchy colors
  /// Primary text color - inherits from secondaryColor
  /// Used for headings and important text
  static Color textPrimary = secondaryColor;

  /// Secondary text color - near black (#111214)
  /// Used for body text and general content
  static Color textSecondary = const Color(0xff111214);

  /// Tertiary text color - medium grey (#727272)
  /// Used for subtitles, captions, and less emphasized text
  static Color textTertiary = const Color(0xff727272);

  /// Disabled text color - light grey (#bdbdbd)
  /// Used for disabled states and placeholder text
  static Color textDisabled = const Color(0xffbdbdbd);

  // UI component colors
  /// AppBar background color - inherits from backgroundColor
  /// Maintains consistency with the main background
  static Color appBarColor = backgroundColor;

  /// Link text color - inherits from primaryColor
  /// Used for clickable text and hyperlinks
  static Color linkTextColor = primaryColor;

  /// Primary icon color - inherits from primaryColor
  /// Used for interactive icons and buttons
  static Color iconPrimaryColor = primaryColor;

  /// Divider color - inherits from primaryColor
  /// Used for separators and borders
  static Color dividerColor = primaryColor;
}
