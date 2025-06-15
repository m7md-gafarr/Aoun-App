import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// SharedPreferencesService manages persistent key-value storage for app settings and user state.
///
/// This service implements the Singleton pattern to ensure a single instance manages all
/// shared preferences operations. It handles user authentication, app settings,
/// and session state persistence.
///
/// Features:
/// - Singleton implementation
/// - Lazy initialization
/// - Type-safe storage operations
/// - Session state management
/// - Language preferences
/// - User mode tracking
class SharedPreferencesService {
  static const String AUTH_TOKEN = "auth_token";

  static const String INTRODUCTION_COMPLETED = "introduction_completed";

  static const String IS_LOGGED_IN = "is_logged_in";

  static const String LANGUAGE = "language";

  static const String USERMODE = "user_mode";

  static const String THEME = "theme";

  static final SharedPreferencesService _instance =
      SharedPreferencesService._internal();

  late SharedPreferences _prefs;

  factory SharedPreferencesService() {
    return _instance;
  }

  SharedPreferencesService._internal();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> saveLoginState(String token) async {
    await _prefs.setString(AUTH_TOKEN, token);
    await _prefs.setBool(IS_LOGGED_IN, true);
  }

  Future<String?> getToken() async {
    return _prefs.getString(AUTH_TOKEN);
  }

  Future<void> removeToken() async {
    await _prefs.remove(AUTH_TOKEN);
  }

  Future<void> saveIntroductionStatus(bool isCompleted) async {
    await _prefs.setBool(INTRODUCTION_COMPLETED, isCompleted);
  }

  Future<bool> getIntroductionStatus() async {
    return _prefs.getBool(INTRODUCTION_COMPLETED) ?? false;
  }

  Future<bool> isUserLoggedIn() async {
    return _prefs.getBool(IS_LOGGED_IN) ?? false;
  }

  Future<void> logout() async {
    await _prefs.remove(AUTH_TOKEN);
    await _prefs.setBool(IS_LOGGED_IN, false);
  }

  Future<String?> loadSavedLanguage() async {
    return _prefs.getString(LANGUAGE);
  }

  Future<void> changeLanguage(String languageCode) async {
    await _prefs.setString(LANGUAGE, languageCode);
  }

  Future<String?> loadSavedTheme() async {
    return _prefs.getString(THEME);
  }

  Future<void> saveTheme(String themeMode) async {
    await _prefs.setString(THEME, themeMode);
  }

  Future<void> userMode(bool usermode) async {
    await _prefs.setBool(USERMODE, usermode);
  }

  Future<bool?> getUserMode() async {
    return _prefs.getBool(USERMODE) ?? true;
  }
}
