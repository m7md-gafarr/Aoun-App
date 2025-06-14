import 'package:flutter/material.dart';

/// AppColorDark defines the dark theme color palette for the Aoun application.
/// This class contains static color definitions optimized for dark mode to reduce
/// eye strain while maintaining brand consistency and accessibility standards.
class AppColorDark {
  // Base branding colors
  /// The main brand color - bright green (#83cd20)
  /// Maintained from light theme for brand consistency
  /// Used for primary actions and key UI elements
  static Color primaryColor = const Color(0xff83cd20);

  /// The secondary brand color - deep forest green (#034833)
  /// Maintained from light theme for brand consistency
  /// Used for complementary UI elements
  static Color secondaryColor = const Color(0xff034833);

  // Status indicator colors
  /// Warning state color - deep orange (#f57c00)
  /// Darker variant of warning color for better dark mode visibility
  /// Used for alerts, warnings, and cautionary messages
  static Color warningColor = const Color(0xfff57c00);

  /// Error state color - red (#e53935)
  /// Adjusted red for dark theme visibility
  /// Used for error messages and critical alerts
  static Color errorColor = const Color(0xffe53935);

  /// Information state color - blue grey (#90a4ae)
  /// Muted tone for better dark mode readability
  /// Used for informational messages and neutral states
  static Color infoColor = const Color(0xff90a4ae);

  /// Success state color - green (#66bb6a)
  /// Softened green for dark theme harmony
  /// Used for success messages and completed states
  static Color successColor = const Color(0xff66bb6a);

  // Background colors
  /// Main background color - near black (#121212)
  /// Material Design recommended dark theme background
  /// Used as the primary background color for screens
  static Color backgroundColor = const Color(0xff121212);

  /// Secondary background color - slightly lighter black (#1e1e1e)
  /// Creates subtle elevation in dark mode
  /// Used for cards, containers, and elevated surfaces
  static Color containerBackgroundColor = const Color(0xff1e1e1e);

  // Text hierarchy colors
  /// Primary text color - pure white
  /// Maximum contrast for primary content
  /// Used for headings and important text
  static Color textPrimary = Colors.white;

  /// Secondary text color - off-white (#e0e0e0)
  /// Slightly reduced contrast for better eye comfort
  /// Used for body text and general content
  static Color textSecondary = const Color(0xffe0e0e0);

  /// Tertiary text color - light grey (#bdbdbd)
  /// Lower contrast for less important text
  /// Used for subtitles, captions, and supporting text
  static Color textTertiary = const Color(0xffbdbdbd);

  /// Disabled text color - medium grey (#757575)
  /// Reduced contrast for inactive elements
  /// Used for disabled states and placeholder text
  static Color textDisabled = const Color(0xff757575);

  // UI component colors
  /// AppBar background color - inherits from backgroundColor
  /// Maintains consistency with the main dark background
  static Color appBarColor = backgroundColor;

  /// Link text color - inherits from primaryColor
  /// Maintains brand color for interactive elements
  /// Used for clickable text and hyperlinks
  static Color linkTextColor = primaryColor;

  /// Primary icon color - inherits from primaryColor
  /// Maintains brand color for interactive elements
  /// Used for interactive icons and buttons
  static Color iconPrimaryColor = primaryColor;

  /// Divider color - dark grey (#616161)
  /// Subtle separation color for dark theme
  /// Used for borders and separators
  static Color dividerColor = const Color(0xff616161);
}
