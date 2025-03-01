import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const String AUTH_TOKEN = "auth_token";
  static const String INTRODUCTION_COMPLETED = "introduction_completed";
  static const String IS_LOGGED_IN = "is_logged_in";

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
}
