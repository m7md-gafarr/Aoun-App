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
  /// Storage key for authentication token
  static const String AUTH_TOKEN = "auth_token";

  /// Storage key for tracking if introduction screens were shown
  static const String INTRODUCTION_COMPLETED = "introduction_completed";

  /// Storage key for user login state
  static const String IS_LOGGED_IN = "is_logged_in";

  /// Storage key for app language preference
  static const String LANGUAGE = "language";

  /// Storage key for user/driver mode selection
  static const String USERMODE = "user_mode";

  /// Singleton instance of the service
  /// Created once and reused throughout the app lifecycle
  static final SharedPreferencesService _instance =
      SharedPreferencesService._internal();

  /// Instance of SharedPreferences used for storage operations
  /// Initialized in [init] method
  late SharedPreferences _prefs;

  /// Factory constructor that returns the singleton instance
  /// This ensures only one instance of the service exists
  factory SharedPreferencesService() {
    return _instance;
  }

  /// Private constructor for singleton implementation
  /// Prevents direct instantiation of additional instances
  SharedPreferencesService._internal();

  /// Initializes the shared preferences instance
  /// Must be called before any storage operations
  ///
  /// This is typically called during app startup
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Saves the user's authentication state and token
  ///
  /// [token] The authentication token to store
  /// Also sets the logged-in flag to true
  Future<void> saveLoginState(String token) async {
    await _prefs.setString(AUTH_TOKEN, token);
    await _prefs.setBool(IS_LOGGED_IN, true);
  }

  /// Retrieves the stored authentication token
  ///
  /// Returns null if no token is stored
  /// Used for authenticated API requests
  Future<String?> getToken() async {
    return _prefs.getString(AUTH_TOKEN);
  }

  /// Removes the stored authentication token
  ///
  /// Used during logout or token invalidation
  /// Does not affect the logged-in state
  Future<void> removeToken() async {
    await _prefs.remove(AUTH_TOKEN);
  }

  /// Updates the introduction screens completion status
  ///
  /// [isCompleted] Whether the user has completed the introduction
  /// Used to determine if introduction should be shown
  Future<void> saveIntroductionStatus(bool isCompleted) async {
    await _prefs.setBool(INTRODUCTION_COMPLETED, isCompleted);
  }

  /// Checks if the user has completed the introduction screens
  ///
  /// Returns false if status has never been set
  /// Used for first-time user experience flow
  Future<bool> getIntroductionStatus() async {
    return _prefs.getBool(INTRODUCTION_COMPLETED) ?? false;
  }

  /// Checks if a user is currently logged in
  ///
  /// Returns false if status has never been set
  /// Used for authentication flow decisions
  Future<bool> isUserLoggedIn() async {
    return _prefs.getBool(IS_LOGGED_IN) ?? false;
  }

  /// Performs a complete logout operation
  ///
  /// - Removes the authentication token
  /// - Sets logged-in status to false
  /// Used when user explicitly logs out
  Future<void> logout() async {
    await _prefs.remove(AUTH_TOKEN);
    await _prefs.setBool(IS_LOGGED_IN, false);
  }

  /// Retrieves the user's preferred language setting
  ///
  /// Returns null if no language preference is set
  /// Used for app localization
  Future<String?> loadSavedLanguage() async {
    return _prefs.getString(LANGUAGE);
  }

  /// Updates the user's language preference
  ///
  /// [languageCode] The ISO language code to store
  /// Used when user changes app language
  Future<void> changeLanguage(String languageCode) async {
    await _prefs.setString(LANGUAGE, languageCode);
  }

  /// Sets the user/driver mode preference
  ///
  /// [usermode] true for user mode, false for driver mode
  /// Used to persist user type selection
  Future<void> userMode(bool usermode) async {
    await _prefs.setBool(USERMODE, usermode);
  }

  /// Retrieves the current user/driver mode setting
  ///
  /// Returns true (user mode) if not explicitly set
  /// Used to determine which interface to show
  Future<bool?> getUserMode() async {
    return _prefs.getBool(USERMODE) ?? true;
  }
}
