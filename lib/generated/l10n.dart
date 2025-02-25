// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Aoun`
  String get appName {
    return Intl.message(
      'Aoun',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Safe & Easy Rides`
  String get intro_transport_title {
    return Intl.message(
      'Safe & Easy Rides',
      name: 'intro_transport_title',
      desc: '',
      args: [],
    );
  }

  /// `Join reliable trips, book your seat, pay securely, and skip commuting hassles.`
  String get intro_transport_text {
    return Intl.message(
      'Join reliable trips, book your seat, pay securely, and skip commuting hassles.',
      name: 'intro_transport_text',
      desc: '',
      args: [],
    );
  }

  /// `Find Nearby Housing`
  String get intro_housing_title {
    return Intl.message(
      'Find Nearby Housing',
      name: 'intro_housing_title',
      desc: '',
      args: [],
    );
  }

  /// `Discover housing near your university, browse offers, and book securely with ease.`
  String get intro_housing_text {
    return Intl.message(
      'Discover housing near your university, browse offers, and book securely with ease.',
      name: 'intro_housing_text',
      desc: '',
      args: [],
    );
  }

  /// `Activities & Opportunities`
  String get intro_activities_title {
    return Intl.message(
      'Activities & Opportunities',
      name: 'intro_activities_title',
      desc: '',
      args: [],
    );
  }

  /// `Join student activities, attend sessions, or explore job opportunities alongside your studies.`
  String get intro_activities_text {
    return Intl.message(
      'Join student activities, attend sessions, or explore job opportunities alongside your studies.',
      name: 'intro_activities_text',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get intro_next_button {
    return Intl.message(
      'Next',
      name: 'intro_next_button',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get intro_getstated_button {
    return Intl.message(
      'Get Started',
      name: 'intro_getstated_button',
      desc: '',
      args: [],
    );
  }

  /// `Joining our app means you agree with our`
  String get joining_terms {
    return Intl.message(
      'Joining our app means you agree with our',
      name: 'joining_terms',
      desc: '',
      args: [],
    );
  }

  /// ` Terms of Use `
  String get terms_of_use {
    return Intl.message(
      ' Terms of Use ',
      name: 'terms_of_use',
      desc: '',
      args: [],
    );
  }

  /// ` and `
  String get and {
    return Intl.message(
      ' and ',
      name: 'and',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacy_policy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `Egypt`
  String get egypt {
    return Intl.message(
      'Egypt',
      name: 'egypt',
      desc: '',
      args: [],
    );
  }

  /// `Saudi Arabia`
  String get saudi_Arabia {
    return Intl.message(
      'Saudi Arabia',
      name: 'saudi_Arabia',
      desc: '',
      args: [],
    );
  }

  /// `Libya`
  String get libya {
    return Intl.message(
      'Libya',
      name: 'libya',
      desc: '',
      args: [],
    );
  }

  /// `Sudan`
  String get sudan {
    return Intl.message(
      'Sudan',
      name: 'sudan',
      desc: '',
      args: [],
    );
  }

  /// `Palestine`
  String get palestine {
    return Intl.message(
      'Palestine',
      name: 'palestine',
      desc: '',
      args: [],
    );
  }

  /// `Israel`
  String get israel {
    return Intl.message(
      'Israel',
      name: 'israel',
      desc: '',
      args: [],
    );
  }

  /// `Jordan`
  String get jordan {
    return Intl.message(
      'Jordan',
      name: 'jordan',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back!`
  String get login_welcome_back {
    return Intl.message(
      'Welcome Back!',
      name: 'login_welcome_back',
      desc: '',
      args: [],
    );
  }

  /// `Enter your details below`
  String get login_enter_details {
    return Intl.message(
      'Enter your details below',
      name: 'login_enter_details',
      desc: '',
      args: [],
    );
  }

  /// `Forget your password?`
  String get login_forgot_password {
    return Intl.message(
      'Forget your password?',
      name: 'login_forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Or continue with`
  String get login_or_continue_with {
    return Intl.message(
      'Or continue with',
      name: 'login_or_continue_with',
      desc: '',
      args: [],
    );
  }

  /// `Select Country`
  String get login_select_country {
    return Intl.message(
      'Select Country',
      name: 'login_select_country',
      desc: '',
      args: [],
    );
  }

  /// `Search by country name`
  String get login_hint_search {
    return Intl.message(
      'Search by country name',
      name: 'login_hint_search',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account? `
  String get login_dont_have_account {
    return Intl.message(
      'Don\'t have an account? ',
      name: 'login_dont_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get sign_up {
    return Intl.message(
      'Sign Up',
      name: 'sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get sign_in {
    return Intl.message(
      'Sign In',
      name: 'sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Reset your Password`
  String get reset_password_title {
    return Intl.message(
      'Reset your Password',
      name: 'reset_password_title',
      desc: '',
      args: [],
    );
  }

  /// `We need your Email so we can send you the password reset code.`
  String get reset_password_description {
    return Intl.message(
      'We need your Email so we can send you the password reset code.',
      name: 'reset_password_description',
      desc: '',
      args: [],
    );
  }

  /// `Send Code`
  String get reset_password_send_code {
    return Intl.message(
      'Send Code',
      name: 'reset_password_send_code',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password`
  String get reset_password_forget_password {
    return Intl.message(
      'Forget Password',
      name: 'reset_password_forget_password',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Create New Password`
  String get create_new_password {
    return Intl.message(
      'Create New Password',
      name: 'create_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Create a new password, please don’t forget this one too.`
  String get create_password_instruction {
    return Intl.message(
      'Create a new password, please don’t forget this one too.',
      name: 'create_password_instruction',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get full_name {
    return Intl.message(
      'Full Name',
      name: 'full_name',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? `
  String get already_have_account {
    return Intl.message(
      'Already have an account? ',
      name: 'already_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get create_account {
    return Intl.message(
      'Create Account',
      name: 'create_account',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get login_phone_number {
    return Intl.message(
      'Phone Number',
      name: 'login_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get login_next {
    return Intl.message(
      'Next',
      name: 'login_next',
      desc: '',
      args: [],
    );
  }

  /// `Select a country.`
  String get validation_select_country {
    return Intl.message(
      'Select a country.',
      name: 'validation_select_country',
      desc: '',
      args: [],
    );
  }

  /// `Phone number required.`
  String get validation_phone_empty {
    return Intl.message(
      'Phone number required.',
      name: 'validation_phone_empty',
      desc: '',
      args: [],
    );
  }

  /// `Phone number too short.`
  String get validation_phone_short {
    return Intl.message(
      'Phone number too short.',
      name: 'validation_phone_short',
      desc: '',
      args: [],
    );
  }

  /// `Phone number too long.`
  String get validation_phone_long {
    return Intl.message(
      'Phone number too long.',
      name: 'validation_phone_long',
      desc: '',
      args: [],
    );
  }

  /// `Validation successful.`
  String get validation_success {
    return Intl.message(
      'Validation successful.',
      name: 'validation_success',
      desc: '',
      args: [],
    );
  }

  /// `Invalid number for this country.`
  String get validation_invalid_number {
    return Intl.message(
      'Invalid number for this country.',
      name: 'validation_invalid_number',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok_AlertDialogt {
    return Intl.message(
      'Ok',
      name: 'ok_AlertDialogt',
      desc: '',
      args: [],
    );
  }

  /// `Verification Code`
  String get verification_title {
    return Intl.message(
      'Verification Code',
      name: 'verification_title',
      desc: '',
      args: [],
    );
  }

  /// `You need to enter 4-digit code we send to your Email`
  String get verification_instruction {
    return Intl.message(
      'You need to enter 4-digit code we send to your Email',
      name: 'verification_instruction',
      desc: '',
      args: [],
    );
  }

  /// `Didn't receive the code?`
  String get did_not_receive_code {
    return Intl.message(
      'Didn\'t receive the code?',
      name: 'did_not_receive_code',
      desc: '',
      args: [],
    );
  }

  /// `Resend Code`
  String get resend_code {
    return Intl.message(
      'Resend Code',
      name: 'resend_code',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message(
      'Verify',
      name: 'verify',
      desc: '',
      args: [],
    );
  }

  /// `Complete your information`
  String get complete_your_information {
    return Intl.message(
      'Complete your information',
      name: 'complete_your_information',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name_label {
    return Intl.message(
      'Name',
      name: 'name_label',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Aoun!`
  String get welcome_message {
    return Intl.message(
      'Welcome to Aoun!',
      name: 'welcome_message',
      desc: '',
      args: [],
    );
  }

  /// `Please introduce yourself`
  String get introduce_yourself {
    return Intl.message(
      'Please introduce yourself',
      name: 'introduce_yourself',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your name`
  String get please_enter_name {
    return Intl.message(
      'Please enter your name',
      name: 'please_enter_name',
      desc: '',
      args: [],
    );
  }

  /// `Safe & Easy Rides`
  String get safe_easy_rides {
    return Intl.message(
      'Safe & Easy Rides',
      name: 'safe_easy_rides',
      desc: '',
      args: [],
    );
  }

  /// `Find Nearby Housing`
  String get find_nearby_housing {
    return Intl.message(
      'Find Nearby Housing',
      name: 'find_nearby_housing',
      desc: '',
      args: [],
    );
  }

  /// `Activities & Opportunities`
  String get activities_opportunities {
    return Intl.message(
      'Activities & Opportunities',
      name: 'activities_opportunities',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
