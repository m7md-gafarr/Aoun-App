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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Aoun`
  String get appName {
    return Intl.message('Aoun', name: 'appName', desc: '', args: []);
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
    return Intl.message('Next', name: 'intro_next_button', desc: '', args: []);
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
    return Intl.message(' and ', name: 'and', desc: '', args: []);
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
    return Intl.message('Egypt', name: 'egypt', desc: '', args: []);
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
    return Intl.message('Libya', name: 'libya', desc: '', args: []);
  }

  /// `Sudan`
  String get sudan {
    return Intl.message('Sudan', name: 'sudan', desc: '', args: []);
  }

  /// `Palestine`
  String get palestine {
    return Intl.message('Palestine', name: 'palestine', desc: '', args: []);
  }

  /// `Israel`
  String get israel {
    return Intl.message('Israel', name: 'israel', desc: '', args: []);
  }

  /// `Jordan`
  String get jordan {
    return Intl.message('Jordan', name: 'jordan', desc: '', args: []);
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
    return Intl.message('Sign Up', name: 'sign_up', desc: '', args: []);
  }

  /// `Sign In`
  String get sign_in {
    return Intl.message('Sign In', name: 'sign_in', desc: '', args: []);
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
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
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

  /// `Create a new password, please don't forget this one too.`
  String get create_password_instruction {
    return Intl.message(
      'Create a new password, please don\'t forget this one too.',
      name: 'create_password_instruction',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get full_name {
    return Intl.message('Full Name', name: 'full_name', desc: '', args: []);
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
    return Intl.message('Next', name: 'login_next', desc: '', args: []);
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
    return Intl.message('Ok', name: 'ok_AlertDialogt', desc: '', args: []);
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

  /// `You need to enter 6-digit code we send to your Email`
  String get verification_instruction {
    return Intl.message(
      'You need to enter 6-digit code we send to your Email',
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
    return Intl.message('Resend Code', name: 'resend_code', desc: '', args: []);
  }

  /// `Verify`
  String get verify {
    return Intl.message('Verify', name: 'verify', desc: '', args: []);
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
    return Intl.message('Name', name: 'name_label', desc: '', args: []);
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

  /// `No internet connection`
  String get no_internet_connection {
    return Intl.message(
      'No internet connection',
      name: 'no_internet_connection',
      desc: '',
      args: [],
    );
  }

  /// `Email not confirmed Please check your inbox.`
  String get email_not_confirmed {
    return Intl.message(
      'Email not confirmed Please check your inbox.',
      name: 'email_not_confirmed',
      desc: '',
      args: [],
    );
  }

  /// `Email not found Please make sure the email is correct.`
  String get email_not_found {
    return Intl.message(
      'Email not found Please make sure the email is correct.',
      name: 'email_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Wrong Password or Email`
  String get wrong_password_or_email {
    return Intl.message(
      'Wrong Password or Email',
      name: 'wrong_password_or_email',
      desc: '',
      args: [],
    );
  }

  /// `Login successful`
  String get login_successful {
    return Intl.message(
      'Login successful',
      name: 'login_successful',
      desc: '',
      args: [],
    );
  }

  /// `Invalid or expired OTP.`
  String get invalid_or_expired_otp {
    return Intl.message(
      'Invalid or expired OTP.',
      name: 'invalid_or_expired_otp',
      desc: '',
      args: [],
    );
  }

  /// `Password reset successful You can now log in with your new password.`
  String get password_reset_successful {
    return Intl.message(
      'Password reset successful You can now log in with your new password.',
      name: 'password_reset_successful',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match.`
  String get passwords_do_not_match {
    return Intl.message(
      'Passwords do not match.',
      name: 'passwords_do_not_match',
      desc: '',
      args: [],
    );
  }

  /// `OTP verification expired Please request a new OTP.`
  String get otp_verification_expired {
    return Intl.message(
      'OTP verification expired Please request a new OTP.',
      name: 'otp_verification_expired',
      desc: '',
      args: [],
    );
  }

  /// `Your account has been created successfully. Please check your email to activate your account before logging in.`
  String get registration_successful {
    return Intl.message(
      'Your account has been created successfully. Please check your email to activate your account before logging in.',
      name: 'registration_successful',
      desc: '',
      args: [],
    );
  }

  /// `Email already exists.`
  String get email_already_exists {
    return Intl.message(
      'Email already exists.',
      name: 'email_already_exists',
      desc: '',
      args: [],
    );
  }

  /// `Phone number is required`
  String get phone_number_required {
    return Intl.message(
      'Phone number is required',
      name: 'phone_number_required',
      desc: '',
      args: [],
    );
  }

  /// `Warning`
  String get warning {
    return Intl.message('Warning', name: 'warning', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Confirmed successfully!`
  String get confirmed_successfully {
    return Intl.message(
      'Confirmed successfully!',
      name: 'confirmed_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Account Created Successfully!`
  String get account_created_message {
    return Intl.message(
      'Account Created Successfully!',
      name: 'account_created_message',
      desc: '',
      args: [],
    );
  }

  /// `Please enter an email`
  String get enter_email {
    return Intl.message(
      'Please enter an email',
      name: 'enter_email',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get enter_valid_email {
    return Intl.message(
      'Please enter a valid email',
      name: 'enter_valid_email',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a password`
  String get enter_password {
    return Intl.message(
      'Please enter a password',
      name: 'enter_password',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 characters long`
  String get password_length_validation {
    return Intl.message(
      'Password must be at least 6 characters long',
      name: 'password_length_validation',
      desc: '',
      args: [],
    );
  }

  /// `Name must be at least 5 characters long`
  String get name_length_validation {
    return Intl.message(
      'Name must be at least 5 characters long',
      name: 'name_length_validation',
      desc: '',
      args: [],
    );
  }

  /// `Please select a gender`
  String get select_gender {
    return Intl.message(
      'Please select a gender',
      name: 'select_gender',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message('Female', name: 'female', desc: '', args: []);
  }

  /// `Male`
  String get male {
    return Intl.message('Male', name: 'male', desc: '', args: []);
  }

  /// `Please select a Birthdate`
  String get select_birthdate {
    return Intl.message(
      'Please select a Birthdate',
      name: 'select_birthdate',
      desc: '',
      args: [],
    );
  }

  /// `Age must be at least 18 years old`
  String get age_validation {
    return Intl.message(
      'Age must be at least 18 years old',
      name: 'age_validation',
      desc: '',
      args: [],
    );
  }

  /// `Date of birth`
  String get date_of_birth {
    return Intl.message(
      'Date of birth',
      name: 'date_of_birth',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one uppercase letter, one number, and one special character`
  String get password_complexity_validation {
    return Intl.message(
      'Password must contain at least one uppercase letter, one number, and one special character',
      name: 'password_complexity_validation',
      desc: '',
      args: [],
    );
  }

  /// `Help & Feedback`
  String get help_feedback_title {
    return Intl.message(
      'Help & Feedback',
      name: 'help_feedback_title',
      desc: '',
      args: [],
    );
  }

  /// `FAQs`
  String get help_feedback_faqs_title {
    return Intl.message(
      'FAQs',
      name: 'help_feedback_faqs_title',
      desc: '',
      args: [],
    );
  }

  /// `How to use the app?`
  String get help_feedback_how_to_use_question {
    return Intl.message(
      'How to use the app?',
      name: 'help_feedback_how_to_use_question',
      desc: '',
      args: [],
    );
  }

  /// `You can browse services, book rides, reserve housing, and apply for jobs directly from the main screen.`
  String get help_feedback_how_to_use_answer {
    return Intl.message(
      'You can browse services, book rides, reserve housing, and apply for jobs directly from the main screen.',
      name: 'help_feedback_how_to_use_answer',
      desc: '',
      args: [],
    );
  }

  /// `How to report a problem?`
  String get help_feedback_report_problem_question {
    return Intl.message(
      'How to report a problem?',
      name: 'help_feedback_report_problem_question',
      desc: '',
      args: [],
    );
  }

  /// `Go to 'Help & Feedback', choose 'Contact Support' and describe your issue.`
  String get help_feedback_report_problem_answer {
    return Intl.message(
      'Go to \'Help & Feedback\', choose \'Contact Support\' and describe your issue.',
      name: 'help_feedback_report_problem_answer',
      desc: '',
      args: [],
    );
  }

  /// `How to contact support?`
  String get help_feedback_contact_support_question {
    return Intl.message(
      'How to contact support?',
      name: 'help_feedback_contact_support_question',
      desc: '',
      args: [],
    );
  }

  /// `Tap 'Contact Support' below or email us at umssthasystem@gmail.com.`
  String get help_feedback_contact_support_answer {
    return Intl.message(
      'Tap \'Contact Support\' below or email us at umssthasystem@gmail.com.',
      name: 'help_feedback_contact_support_answer',
      desc: '',
      args: [],
    );
  }

  /// `How to change language or theme?`
  String get help_feedback_language_theme_question {
    return Intl.message(
      'How to change language or theme?',
      name: 'help_feedback_language_theme_question',
      desc: '',
      args: [],
    );
  }

  /// `Go to 'Settings' → 'Language' or 'Appearance' and choose your preferred options.`
  String get help_feedback_language_theme_answer {
    return Intl.message(
      'Go to \'Settings\' → \'Language\' or \'Appearance\' and choose your preferred options.',
      name: 'help_feedback_language_theme_answer',
      desc: '',
      args: [],
    );
  }

  /// `Where to find safety info?`
  String get help_feedback_safety_info_question {
    return Intl.message(
      'Where to find safety info?',
      name: 'help_feedback_safety_info_question',
      desc: '',
      args: [],
    );
  }

  /// `Go to 'Safety' from the main menu to read emergency contacts, safety tips, and driver verification.`
  String get help_feedback_safety_info_answer {
    return Intl.message(
      'Go to \'Safety\' from the main menu to read emergency contacts, safety tips, and driver verification.',
      name: 'help_feedback_safety_info_answer',
      desc: '',
      args: [],
    );
  }

  /// `Contact Support`
  String get help_feedback_contact_support_title {
    return Intl.message(
      'Contact Support',
      name: 'help_feedback_contact_support_title',
      desc: '',
      args: [],
    );
  }

  /// `umssthasystem@gmail.com`
  String get help_feedback_support_email {
    return Intl.message(
      'umssthasystem@gmail.com',
      name: 'help_feedback_support_email',
      desc: '',
      args: [],
    );
  }

  /// `+20 101 3379 651`
  String get help_feedback_support_phone {
    return Intl.message(
      '+20 101 3379 651',
      name: 'help_feedback_support_phone',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get driver_profile_title {
    return Intl.message(
      'Profile',
      name: 'driver_profile_title',
      desc: '',
      args: [],
    );
  }

  /// `Edit profile`
  String get driver_profile_edit_button {
    return Intl.message(
      'Edit profile',
      name: 'driver_profile_edit_button',
      desc: '',
      args: [],
    );
  }

  /// `Overview`
  String get driver_profile_overview_tab {
    return Intl.message(
      'Overview',
      name: 'driver_profile_overview_tab',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle data`
  String get driver_profile_vehicle_data_tab {
    return Intl.message(
      'Vehicle data',
      name: 'driver_profile_vehicle_data_tab',
      desc: '',
      args: [],
    );
  }

  /// `Rating`
  String get driver_profile_rating {
    return Intl.message(
      'Rating',
      name: 'driver_profile_rating',
      desc: '',
      args: [],
    );
  }

  /// `Satisfy`
  String get driver_profile_satisfy {
    return Intl.message(
      'Satisfy',
      name: 'driver_profile_satisfy',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get driver_profile_cancel {
    return Intl.message(
      'Cancel',
      name: 'driver_profile_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle picture`
  String get driver_profile_vehicle_picture {
    return Intl.message(
      'Vehicle picture',
      name: 'driver_profile_vehicle_picture',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle registration certificate`
  String get driver_profile_registration_certificate {
    return Intl.message(
      'Vehicle registration certificate',
      name: 'driver_profile_registration_certificate',
      desc: '',
      args: [],
    );
  }

  /// `Back side of certificate`
  String get driver_profile_certificate_back {
    return Intl.message(
      'Back side of certificate',
      name: 'driver_profile_certificate_back',
      desc: '',
      args: [],
    );
  }

  /// `Plate Number`
  String get driver_profile_plate_number {
    return Intl.message(
      'Plate Number',
      name: 'driver_profile_plate_number',
      desc: '',
      args: [],
    );
  }

  /// `Production Year`
  String get driver_profile_production_year {
    return Intl.message(
      'Production Year',
      name: 'driver_profile_production_year',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle Color`
  String get driver_profile_vehicle_color {
    return Intl.message(
      'Vehicle Color',
      name: 'driver_profile_vehicle_color',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle Model`
  String get driver_profile_vehicle_model {
    return Intl.message(
      'Vehicle Model',
      name: 'driver_profile_vehicle_model',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle Brand`
  String get driver_profile_vehicle_brand {
    return Intl.message(
      'Vehicle Brand',
      name: 'driver_profile_vehicle_brand',
      desc: '',
      args: [],
    );
  }

  /// `Number of Seats`
  String get driver_profile_seats {
    return Intl.message(
      'Number of Seats',
      name: 'driver_profile_seats',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get driver_edit_profile_title {
    return Intl.message(
      'Edit Profile',
      name: 'driver_edit_profile_title',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get driver_edit_profile_full_name_hint {
    return Intl.message(
      'Full name',
      name: 'driver_edit_profile_full_name_hint',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get driver_edit_profile_email_hint {
    return Intl.message(
      'Email',
      name: 'driver_edit_profile_email_hint',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get driver_edit_profile_update_button {
    return Intl.message(
      'Update',
      name: 'driver_edit_profile_update_button',
      desc: '',
      args: [],
    );
  }

  /// `Balance Your`
  String get home_driver_balance_title {
    return Intl.message(
      'Balance Your',
      name: 'home_driver_balance_title',
      desc: '',
      args: [],
    );
  }

  /// `Earnings summary`
  String get home_driver_earnings_summary {
    return Intl.message(
      'Earnings summary',
      name: 'home_driver_earnings_summary',
      desc: '',
      args: [],
    );
  }

  /// `Completed trip count`
  String get home_driver_completed_trips {
    return Intl.message(
      'Completed trip count',
      name: 'home_driver_completed_trips',
      desc: '',
      args: [],
    );
  }

  /// `Loading`
  String get home_driver_loading {
    return Intl.message(
      'Loading',
      name: 'home_driver_loading',
      desc: '',
      args: [],
    );
  }

  /// `Create a trip`
  String get home_driver_create_trip {
    return Intl.message(
      'Create a trip',
      name: 'home_driver_create_trip',
      desc: '',
      args: [],
    );
  }

  /// `Recent orders`
  String get home_driver_recent_orders {
    return Intl.message(
      'Recent orders',
      name: 'home_driver_recent_orders',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get home_driver_drawer_profile {
    return Intl.message(
      'Profile',
      name: 'home_driver_drawer_profile',
      desc: '',
      args: [],
    );
  }

  /// `Wallet & Earnings`
  String get home_driver_drawer_wallet {
    return Intl.message(
      'Wallet & Earnings',
      name: 'home_driver_drawer_wallet',
      desc: '',
      args: [],
    );
  }

  /// `History trips`
  String get home_driver_drawer_history {
    return Intl.message(
      'History trips',
      name: 'home_driver_drawer_history',
      desc: '',
      args: [],
    );
  }

  /// `Safety`
  String get home_driver_drawer_safety {
    return Intl.message(
      'Safety',
      name: 'home_driver_drawer_safety',
      desc: '',
      args: [],
    );
  }

  /// `Help & feedback`
  String get home_driver_drawer_help {
    return Intl.message(
      'Help & feedback',
      name: 'home_driver_drawer_help',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get home_driver_drawer_settings {
    return Intl.message(
      'Settings',
      name: 'home_driver_drawer_settings',
      desc: '',
      args: [],
    );
  }

  /// `Create trip`
  String get create_trip_title {
    return Intl.message(
      'Create trip',
      name: 'create_trip_title',
      desc: '',
      args: [],
    );
  }

  /// `From`
  String get create_trip_from_label {
    return Intl.message(
      'From',
      name: 'create_trip_from_label',
      desc: '',
      args: [],
    );
  }

  /// `To`
  String get create_trip_to_label {
    return Intl.message('To', name: 'create_trip_to_label', desc: '', args: []);
  }

  /// `Choose in map`
  String get create_trip_choose_map {
    return Intl.message(
      'Choose in map',
      name: 'create_trip_choose_map',
      desc: '',
      args: [],
    );
  }

  /// `Available Seats`
  String get create_trip_available_seats_hint {
    return Intl.message(
      'Available Seats',
      name: 'create_trip_available_seats_hint',
      desc: '',
      args: [],
    );
  }

  /// `Please enter available seats`
  String get create_trip_available_seats_validation {
    return Intl.message(
      'Please enter available seats',
      name: 'create_trip_available_seats_validation',
      desc: '',
      args: [],
    );
  }

  /// `Price of Seat`
  String get create_trip_price_hint {
    return Intl.message(
      'Price of Seat',
      name: 'create_trip_price_hint',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the price`
  String get create_trip_price_validation {
    return Intl.message(
      'Please enter the price',
      name: 'create_trip_price_validation',
      desc: '',
      args: [],
    );
  }

  /// `Departure Time`
  String get create_trip_departure_time_hint {
    return Intl.message(
      'Departure Time',
      name: 'create_trip_departure_time_hint',
      desc: '',
      args: [],
    );
  }

  /// `Please select time`
  String get create_trip_departure_time_validation {
    return Intl.message(
      'Please select time',
      name: 'create_trip_departure_time_validation',
      desc: '',
      args: [],
    );
  }

  /// `Driver Notes`
  String get create_trip_driver_notes_title {
    return Intl.message(
      'Driver Notes',
      name: 'create_trip_driver_notes_title',
      desc: '',
      args: [],
    );
  }

  /// `Write your notes if you have any.`
  String get create_trip_driver_notes_hint {
    return Intl.message(
      'Write your notes if you have any.',
      name: 'create_trip_driver_notes_hint',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your note`
  String get create_trip_driver_notes_validation {
    return Intl.message(
      'Please enter your note',
      name: 'create_trip_driver_notes_validation',
      desc: '',
      args: [],
    );
  }

  /// `Amenities`
  String get create_trip_amenities_title {
    return Intl.message(
      'Amenities',
      name: 'create_trip_amenities_title',
      desc: '',
      args: [],
    );
  }

  /// `Confirm publish trip`
  String get create_trip_confirm_button {
    return Intl.message(
      'Confirm publish trip',
      name: 'create_trip_confirm_button',
      desc: '',
      args: [],
    );
  }

  /// `Destination must be selected`
  String get create_trip_distance_error {
    return Intl.message(
      'Destination must be selected',
      name: 'create_trip_distance_error',
      desc: '',
      args: [],
    );
  }

  /// `Wi-Fi`
  String get create_trip_wifi {
    return Intl.message('Wi-Fi', name: 'create_trip_wifi', desc: '', args: []);
  }

  /// `Phone Charger`
  String get create_trip_phone_charger {
    return Intl.message(
      'Phone Charger',
      name: 'create_trip_phone_charger',
      desc: '',
      args: [],
    );
  }

  /// `Air Conditioning`
  String get create_trip_air_conditioning {
    return Intl.message(
      'Air Conditioning',
      name: 'create_trip_air_conditioning',
      desc: '',
      args: [],
    );
  }

  /// `Child Seat`
  String get create_trip_child_seat {
    return Intl.message(
      'Child Seat',
      name: 'create_trip_child_seat',
      desc: '',
      args: [],
    );
  }

  /// `Free Water`
  String get create_trip_free_water {
    return Intl.message(
      'Free Water',
      name: 'create_trip_free_water',
      desc: '',
      args: [],
    );
  }

  /// `USB/AUX for Music`
  String get create_trip_music {
    return Intl.message(
      'USB/AUX for Music',
      name: 'create_trip_music',
      desc: '',
      args: [],
    );
  }

  /// `Trip detail`
  String get trip_details_title {
    return Intl.message(
      'Trip detail',
      name: 'trip_details_title',
      desc: '',
      args: [],
    );
  }

  /// `From`
  String get trip_details_from {
    return Intl.message('From', name: 'trip_details_from', desc: '', args: []);
  }

  /// `To`
  String get trip_details_to {
    return Intl.message('To', name: 'trip_details_to', desc: '', args: []);
  }

  /// `Basic Trip Info`
  String get trip_details_basic_info {
    return Intl.message(
      'Basic Trip Info',
      name: 'trip_details_basic_info',
      desc: '',
      args: [],
    );
  }

  /// `Driver Info`
  String get trip_details_driver_info {
    return Intl.message(
      'Driver Info',
      name: 'trip_details_driver_info',
      desc: '',
      args: [],
    );
  }

  /// `Additional Info`
  String get trip_details_additional_info {
    return Intl.message(
      'Additional Info',
      name: 'trip_details_additional_info',
      desc: '',
      args: [],
    );
  }

  /// `Pickup Point`
  String get trip_details_pickup_point {
    return Intl.message(
      'Pickup Point',
      name: 'trip_details_pickup_point',
      desc: '',
      args: [],
    );
  }

  /// `View in map`
  String get trip_details_view_map {
    return Intl.message(
      'View in map',
      name: 'trip_details_view_map',
      desc: '',
      args: [],
    );
  }

  /// `Driver Notes`
  String get trip_details_driver_notes {
    return Intl.message(
      'Driver Notes',
      name: 'trip_details_driver_notes',
      desc: '',
      args: [],
    );
  }

  /// `Amenities`
  String get trip_details_amenities {
    return Intl.message(
      'Amenities',
      name: 'trip_details_amenities',
      desc: '',
      args: [],
    );
  }

  /// `Book`
  String get trip_details_book {
    return Intl.message('Book', name: 'trip_details_book', desc: '', args: []);
  }

  /// `Departure Time`
  String get trip_details_departure_time {
    return Intl.message(
      'Departure Time',
      name: 'trip_details_departure_time',
      desc: '',
      args: [],
    );
  }

  /// `Available Seats`
  String get trip_details_available_seats {
    return Intl.message(
      'Available Seats',
      name: 'trip_details_available_seats',
      desc: '',
      args: [],
    );
  }

  /// `Price Per Seat`
  String get trip_details_price_per_seat {
    return Intl.message(
      'Price Per Seat',
      name: 'trip_details_price_per_seat',
      desc: '',
      args: [],
    );
  }

  /// `Duration`
  String get trip_details_duration {
    return Intl.message(
      'Duration',
      name: 'trip_details_duration',
      desc: '',
      args: [],
    );
  }

  /// `Seating Capacity`
  String get trip_details_seating_capacity {
    return Intl.message(
      'Seating Capacity',
      name: 'trip_details_seating_capacity',
      desc: '',
      args: [],
    );
  }

  /// `Created At`
  String get trip_details_created_at {
    return Intl.message(
      'Created At',
      name: 'trip_details_created_at',
      desc: '',
      args: [],
    );
  }

  /// `Delete Trip`
  String get trip_details_delete_button {
    return Intl.message(
      'Delete Trip',
      name: 'trip_details_delete_button',
      desc: '',
      args: [],
    );
  }

  /// `From: `
  String get home_driver_trip_from {
    return Intl.message(
      'From: ',
      name: 'home_driver_trip_from',
      desc: '',
      args: [],
    );
  }

  /// `To: `
  String get home_driver_trip_to {
    return Intl.message(
      'To: ',
      name: 'home_driver_trip_to',
      desc: '',
      args: [],
    );
  }

  /// `Price Per Seat: `
  String get home_driver_trip_price {
    return Intl.message(
      'Price Per Seat: ',
      name: 'home_driver_trip_price',
      desc: '',
      args: [],
    );
  }

  /// `Available Seats: `
  String get home_driver_trip_seats {
    return Intl.message(
      'Available Seats: ',
      name: 'home_driver_trip_seats',
      desc: '',
      args: [],
    );
  }

  /// `Departure Time: `
  String get home_driver_trip_departure {
    return Intl.message(
      'Departure Time: ',
      name: 'home_driver_trip_departure',
      desc: '',
      args: [],
    );
  }

  /// `Safety`
  String get driver_safety_title {
    return Intl.message(
      'Safety',
      name: 'driver_safety_title',
      desc: '',
      args: [],
    );
  }

  /// `Emergency`
  String get driver_safety_emergency_title {
    return Intl.message(
      'Emergency',
      name: 'driver_safety_emergency_title',
      desc: '',
      args: [],
    );
  }

  /// `Call emergency`
  String get driver_safety_emergency_subtitle {
    return Intl.message(
      'Call emergency',
      name: 'driver_safety_emergency_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Call Now`
  String get driver_safety_call_now {
    return Intl.message(
      'Call Now',
      name: 'driver_safety_call_now',
      desc: '',
      args: [],
    );
  }

  /// `Can't make the call`
  String get driver_safety_call_error {
    return Intl.message(
      'Can\'t make the call',
      name: 'driver_safety_call_error',
      desc: '',
      args: [],
    );
  }

  /// `Driver Verification`
  String get driver_safety_verification_title {
    return Intl.message(
      'Driver Verification',
      name: 'driver_safety_verification_title',
      desc: '',
      args: [],
    );
  }

  /// `All drivers go through ID & vehicle checks`
  String get driver_safety_verification_subtitle {
    return Intl.message(
      'All drivers go through ID & vehicle checks',
      name: 'driver_safety_verification_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Tips for Safe Travel`
  String get driver_safety_tips_title {
    return Intl.message(
      'Tips for Safe Travel',
      name: 'driver_safety_tips_title',
      desc: '',
      args: [],
    );
  }

  /// `Always check car plate`
  String get driver_safety_tip_check_plate {
    return Intl.message(
      'Always check car plate',
      name: 'driver_safety_tip_check_plate',
      desc: '',
      args: [],
    );
  }

  /// `Share your trip`
  String get driver_safety_tip_share_trip {
    return Intl.message(
      'Share your trip',
      name: 'driver_safety_tip_share_trip',
      desc: '',
      args: [],
    );
  }

  /// `Wear your seatbelt`
  String get driver_safety_tip_seatbelt {
    return Intl.message(
      'Wear your seatbelt',
      name: 'driver_safety_tip_seatbelt',
      desc: '',
      args: [],
    );
  }

  /// `Need Help?`
  String get driver_safety_help_title {
    return Intl.message(
      'Need Help?',
      name: 'driver_safety_help_title',
      desc: '',
      args: [],
    );
  }

  /// `We're here 24/7`
  String get driver_safety_help_subtitle {
    return Intl.message(
      'We\'re here 24/7',
      name: 'driver_safety_help_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Contact Support`
  String get driver_safety_contact_support {
    return Intl.message(
      'Contact Support',
      name: 'driver_safety_contact_support',
      desc: '',
      args: [],
    );
  }

  /// `Account settings`
  String get driver_settings_title {
    return Intl.message(
      'Account settings',
      name: 'driver_settings_title',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get driver_settings_change_password {
    return Intl.message(
      'Change Password',
      name: 'driver_settings_change_password',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get driver_settings_language {
    return Intl.message(
      'Language',
      name: 'driver_settings_language',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get driver_settings_theme {
    return Intl.message(
      'Theme',
      name: 'driver_settings_theme',
      desc: '',
      args: [],
    );
  }

  /// `Dark mode`
  String get driver_settings_dark_mode {
    return Intl.message(
      'Dark mode',
      name: 'driver_settings_dark_mode',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get driver_settings_contact_us {
    return Intl.message(
      'Contact Us',
      name: 'driver_settings_contact_us',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get driver_settings_terms {
    return Intl.message(
      'Terms & Conditions',
      name: 'driver_settings_terms',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get driver_settings_privacy {
    return Intl.message(
      'Privacy Policy',
      name: 'driver_settings_privacy',
      desc: '',
      args: [],
    );
  }

  /// `Rate the App`
  String get driver_settings_rate {
    return Intl.message(
      'Rate the App',
      name: 'driver_settings_rate',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get driver_settings_logout {
    return Intl.message(
      'Logout',
      name: 'driver_settings_logout',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get driver_settings_language_english {
    return Intl.message(
      'English',
      name: 'driver_settings_language_english',
      desc: '',
      args: [],
    );
  }

  /// `العربية`
  String get driver_settings_language_arabic {
    return Intl.message(
      'العربية',
      name: 'driver_settings_language_arabic',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get select_route_search_hint {
    return Intl.message(
      'Search',
      name: 'select_route_search_hint',
      desc: '',
      args: [],
    );
  }

  /// `Confirm this location`
  String get select_route_confirm_location {
    return Intl.message(
      'Confirm this location',
      name: 'select_route_confirm_location',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Aoun`
  String get select_type_welcome {
    return Intl.message(
      'Welcome to Aoun',
      name: 'select_type_welcome',
      desc: '',
      args: [],
    );
  }

  /// `Choose how you want to continue`
  String get select_type_instruction {
    return Intl.message(
      'Choose how you want to continue',
      name: 'select_type_instruction',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get select_type_sign_in {
    return Intl.message(
      'Sign In',
      name: 'select_type_sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get select_type_sign_up {
    return Intl.message(
      'Sign Up',
      name: 'select_type_sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Passenger`
  String get select_type_passenger {
    return Intl.message(
      'Passenger',
      name: 'select_type_passenger',
      desc: '',
      args: [],
    );
  }

  /// `Driver`
  String get select_type_driver {
    return Intl.message(
      'Driver',
      name: 'select_type_driver',
      desc: '',
      args: [],
    );
  }

  /// `Create Driver account`
  String get driver_register_title {
    return Intl.message(
      'Create Driver account',
      name: 'driver_register_title',
      desc: '',
      args: [],
    );
  }

  /// `Personal information`
  String get driver_register_personal_info_title {
    return Intl.message(
      'Personal information',
      name: 'driver_register_personal_info_title',
      desc: '',
      args: [],
    );
  }

  /// `Personal picture`
  String get driver_register_personal_picture {
    return Intl.message(
      'Personal picture',
      name: 'driver_register_personal_picture',
      desc: '',
      args: [],
    );
  }

  /// `Driver License`
  String get driver_register_license_title {
    return Intl.message(
      'Driver License',
      name: 'driver_register_license_title',
      desc: '',
      args: [],
    );
  }

  /// `License number`
  String get driver_register_license_number {
    return Intl.message(
      'License number',
      name: 'driver_register_license_number',
      desc: '',
      args: [],
    );
  }

  /// `Expiration date`
  String get driver_register_expiration_date {
    return Intl.message(
      'Expiration date',
      name: 'driver_register_expiration_date',
      desc: '',
      args: [],
    );
  }

  /// `Personal documents`
  String get driver_register_documents_title {
    return Intl.message(
      'Personal documents',
      name: 'driver_register_documents_title',
      desc: '',
      args: [],
    );
  }

  /// `National ID`
  String get driver_register_national_id {
    return Intl.message(
      'National ID',
      name: 'driver_register_national_id',
      desc: '',
      args: [],
    );
  }

  /// `Back Side of ID`
  String get driver_register_id_back {
    return Intl.message(
      'Back Side of ID',
      name: 'driver_register_id_back',
      desc: '',
      args: [],
    );
  }

  /// `Criminal Status Record`
  String get driver_register_criminal_record {
    return Intl.message(
      'Criminal Status Record',
      name: 'driver_register_criminal_record',
      desc: '',
      args: [],
    );
  }

  /// `ID number`
  String get driver_register_id_number {
    return Intl.message(
      'ID number',
      name: 'driver_register_id_number',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle information`
  String get driver_register_vehicle_title {
    return Intl.message(
      'Vehicle information',
      name: 'driver_register_vehicle_title',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle picture`
  String get driver_register_vehicle_picture {
    return Intl.message(
      'Vehicle picture',
      name: 'driver_register_vehicle_picture',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle registration certificate`
  String get driver_register_vehicle_certificate {
    return Intl.message(
      'Vehicle registration certificate',
      name: 'driver_register_vehicle_certificate',
      desc: '',
      args: [],
    );
  }

  /// `Back side of certificate`
  String get driver_register_certificate_back {
    return Intl.message(
      'Back side of certificate',
      name: 'driver_register_certificate_back',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle brand`
  String get driver_register_vehicle_brand {
    return Intl.message(
      'Vehicle brand',
      name: 'driver_register_vehicle_brand',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle model`
  String get driver_register_vehicle_model {
    return Intl.message(
      'Vehicle model',
      name: 'driver_register_vehicle_model',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle color`
  String get driver_register_vehicle_color {
    return Intl.message(
      'Vehicle color',
      name: 'driver_register_vehicle_color',
      desc: '',
      args: [],
    );
  }

  /// `Production year`
  String get driver_register_production_year {
    return Intl.message(
      'Production year',
      name: 'driver_register_production_year',
      desc: '',
      args: [],
    );
  }

  /// `Plate number`
  String get driver_register_plate_number {
    return Intl.message(
      'Plate number',
      name: 'driver_register_plate_number',
      desc: '',
      args: [],
    );
  }

  /// `Number seats`
  String get driver_register_seats_number {
    return Intl.message(
      'Number seats',
      name: 'driver_register_seats_number',
      desc: '',
      args: [],
    );
  }

  /// `Login information`
  String get driver_register_login_title {
    return Intl.message(
      'Login information',
      name: 'driver_register_login_title',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get driver_register_next {
    return Intl.message(
      'Next',
      name: 'driver_register_next',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get driver_register_sign_in {
    return Intl.message(
      'Sign In',
      name: 'driver_register_sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Personal picture required`
  String get driver_register_picture_required {
    return Intl.message(
      'Personal picture required',
      name: 'driver_register_picture_required',
      desc: '',
      args: [],
    );
  }

  /// `Please upload all required license images before continuing.`
  String get driver_register_license_images_required {
    return Intl.message(
      'Please upload all required license images before continuing.',
      name: 'driver_register_license_images_required',
      desc: '',
      args: [],
    );
  }

  /// `Please upload all required document images before continuing.`
  String get driver_register_documents_required {
    return Intl.message(
      'Please upload all required document images before continuing.',
      name: 'driver_register_documents_required',
      desc: '',
      args: [],
    );
  }

  /// `Please upload all required vehicle images before continuing.`
  String get driver_register_vehicle_images_required {
    return Intl.message(
      'Please upload all required vehicle images before continuing.',
      name: 'driver_register_vehicle_images_required',
      desc: '',
      args: [],
    );
  }

  /// `Please enter an License number.`
  String get driver_register_license_number_required {
    return Intl.message(
      'Please enter an License number.',
      name: 'driver_register_license_number_required',
      desc: '',
      args: [],
    );
  }

  /// `License number must contain only digits.`
  String get driver_register_license_digits_only {
    return Intl.message(
      'License number must contain only digits.',
      name: 'driver_register_license_digits_only',
      desc: '',
      args: [],
    );
  }

  /// `License number must be 14 digits long.`
  String get driver_register_license_length {
    return Intl.message(
      'License number must be 14 digits long.',
      name: 'driver_register_license_length',
      desc: '',
      args: [],
    );
  }

  /// `Please enter an ID number.`
  String get driver_register_id_required {
    return Intl.message(
      'Please enter an ID number.',
      name: 'driver_register_id_required',
      desc: '',
      args: [],
    );
  }

  /// `ID number must contain only digits.`
  String get driver_register_id_digits_only {
    return Intl.message(
      'ID number must contain only digits.',
      name: 'driver_register_id_digits_only',
      desc: '',
      args: [],
    );
  }

  /// `ID number must be 14 digits long.`
  String get driver_register_id_length {
    return Intl.message(
      'ID number must be 14 digits long.',
      name: 'driver_register_id_length',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the vehicle brand.`
  String get driver_register_brand_required {
    return Intl.message(
      'Please enter the vehicle brand.',
      name: 'driver_register_brand_required',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the vehicle model.`
  String get driver_register_model_required {
    return Intl.message(
      'Please enter the vehicle model.',
      name: 'driver_register_model_required',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the vehicle color.`
  String get driver_register_color_required {
    return Intl.message(
      'Please enter the vehicle color.',
      name: 'driver_register_color_required',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the production year.`
  String get driver_register_year_required {
    return Intl.message(
      'Please enter the production year.',
      name: 'driver_register_year_required',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid year between 2000 and {year}.`
  String driver_register_year_range(Object year) {
    return Intl.message(
      'Enter a valid year between 2000 and $year.',
      name: 'driver_register_year_range',
      desc: 'رسالة خطأ لسنة التسجيل',
      args: [year],
    );
  }

  /// `Please enter license number`
  String get driver_register_plate_required {
    return Intl.message(
      'Please enter license number',
      name: 'driver_register_plate_required',
      desc: '',
      args: [],
    );
  }

  /// `The license number should not exceed 7 characters.`
  String get driver_register_plate_length {
    return Intl.message(
      'The license number should not exceed 7 characters.',
      name: 'driver_register_plate_length',
      desc: '',
      args: [],
    );
  }

  /// `The license number must start with letters followed by digits.`
  String get driver_register_plate_format {
    return Intl.message(
      'The license number must start with letters followed by digits.',
      name: 'driver_register_plate_format',
      desc: '',
      args: [],
    );
  }

  /// `The license number should not have more than 3 letters.`
  String get driver_register_plate_letters {
    return Intl.message(
      'The license number should not have more than 3 letters.',
      name: 'driver_register_plate_letters',
      desc: '',
      args: [],
    );
  }

  /// `The license number should not have more than 4 digits.`
  String get driver_register_plate_digits {
    return Intl.message(
      'The license number should not have more than 4 digits.',
      name: 'driver_register_plate_digits',
      desc: '',
      args: [],
    );
  }

  /// `Please enter number of seats.`
  String get driver_register_seats_required {
    return Intl.message(
      'Please enter number of seats.',
      name: 'driver_register_seats_required',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid number between 1 and 20.`
  String get driver_register_seats_range {
    return Intl.message(
      'Enter a valid number between 1 and 20.',
      name: 'driver_register_seats_range',
      desc: '',
      args: [],
    );
  }

  /// `Personal Picture`
  String get driver_register_personal_picture_title {
    return Intl.message(
      'Personal Picture',
      name: 'driver_register_personal_picture_title',
      desc: '',
      args: [],
    );
  }

  /// `Take a recent, high-quality photo of yourself.`
  String get driver_register_personal_picture_desc_1 {
    return Intl.message(
      'Take a recent, high-quality photo of yourself.',
      name: 'driver_register_personal_picture_desc_1',
      desc: '',
      args: [],
    );
  }

  /// `Your full face must be clearly visible, without sunglasses or hats.`
  String get driver_register_personal_picture_desc_2 {
    return Intl.message(
      'Your full face must be clearly visible, without sunglasses or hats.',
      name: 'driver_register_personal_picture_desc_2',
      desc: '',
      args: [],
    );
  }

  /// `Use a plain background and good lighting.`
  String get driver_register_personal_picture_desc_3 {
    return Intl.message(
      'Use a plain background and good lighting.',
      name: 'driver_register_personal_picture_desc_3',
      desc: '',
      args: [],
    );
  }

  /// `Driver License (Front)`
  String get driver_register_license_front_title {
    return Intl.message(
      'Driver License (Front)',
      name: 'driver_register_license_front_title',
      desc: '',
      args: [],
    );
  }

  /// `Capture the front side of your valid driver's license.`
  String get driver_register_license_front_desc_1 {
    return Intl.message(
      'Capture the front side of your valid driver\'s license.',
      name: 'driver_register_license_front_desc_1',
      desc: '',
      args: [],
    );
  }

  /// `Ensure the photo is not blurry and all text is readable.`
  String get driver_register_license_front_desc_2 {
    return Intl.message(
      'Ensure the photo is not blurry and all text is readable.',
      name: 'driver_register_license_front_desc_2',
      desc: '',
      args: [],
    );
  }

  /// `Do not cover any part of the license with your fingers.`
  String get driver_register_license_front_desc_3 {
    return Intl.message(
      'Do not cover any part of the license with your fingers.',
      name: 'driver_register_license_front_desc_3',
      desc: '',
      args: [],
    );
  }

  /// `Driver License (Back)`
  String get driver_register_license_back_title {
    return Intl.message(
      'Driver License (Back)',
      name: 'driver_register_license_back_title',
      desc: '',
      args: [],
    );
  }

  /// `Capture the back side of your valid driver's license.`
  String get driver_register_license_back_desc_1 {
    return Intl.message(
      'Capture the back side of your valid driver\'s license.',
      name: 'driver_register_license_back_desc_1',
      desc: '',
      args: [],
    );
  }

  /// `Make sure the document is not expired.`
  String get driver_register_license_back_desc_2 {
    return Intl.message(
      'Make sure the document is not expired.',
      name: 'driver_register_license_back_desc_2',
      desc: '',
      args: [],
    );
  }

  /// `Ensure all barcode and security features are visible.`
  String get driver_register_license_back_desc_3 {
    return Intl.message(
      'Ensure all barcode and security features are visible.',
      name: 'driver_register_license_back_desc_3',
      desc: '',
      args: [],
    );
  }

  /// `Selfie with License`
  String get driver_register_license_selfie_title {
    return Intl.message(
      'Selfie with License',
      name: 'driver_register_license_selfie_title',
      desc: '',
      args: [],
    );
  }

  /// `Take a selfie holding your license clearly next to your face.`
  String get driver_register_license_selfie_desc_1 {
    return Intl.message(
      'Take a selfie holding your license clearly next to your face.',
      name: 'driver_register_license_selfie_desc_1',
      desc: '',
      args: [],
    );
  }

  /// `Make sure both your face and the license details are visible and clear.`
  String get driver_register_license_selfie_desc_2 {
    return Intl.message(
      'Make sure both your face and the license details are visible and clear.',
      name: 'driver_register_license_selfie_desc_2',
      desc: '',
      args: [],
    );
  }

  /// `Do not use any filters or image enhancements.`
  String get driver_register_license_selfie_desc_3 {
    return Intl.message(
      'Do not use any filters or image enhancements.',
      name: 'driver_register_license_selfie_desc_3',
      desc: '',
      args: [],
    );
  }

  /// `National ID (Front)`
  String get driver_register_id_front_title {
    return Intl.message(
      'National ID (Front)',
      name: 'driver_register_id_front_title',
      desc: '',
      args: [],
    );
  }

  /// `Upload a high-resolution image of the front side of your National ID.`
  String get driver_register_id_front_desc_1 {
    return Intl.message(
      'Upload a high-resolution image of the front side of your National ID.',
      name: 'driver_register_id_front_desc_1',
      desc: '',
      args: [],
    );
  }

  /// `Make sure your name, photo, and ID number are clearly visible.`
  String get driver_register_id_front_desc_2 {
    return Intl.message(
      'Make sure your name, photo, and ID number are clearly visible.',
      name: 'driver_register_id_front_desc_2',
      desc: '',
      args: [],
    );
  }

  /// `Avoid shadows or reflections on the card.`
  String get driver_register_id_front_desc_3 {
    return Intl.message(
      'Avoid shadows or reflections on the card.',
      name: 'driver_register_id_front_desc_3',
      desc: '',
      args: [],
    );
  }

  /// `National ID (Back)`
  String get driver_register_id_back_title {
    return Intl.message(
      'National ID (Back)',
      name: 'driver_register_id_back_title',
      desc: '',
      args: [],
    );
  }

  /// `Upload the back side of your National ID.`
  String get driver_register_id_back_desc_1 {
    return Intl.message(
      'Upload the back side of your National ID.',
      name: 'driver_register_id_back_desc_1',
      desc: '',
      args: [],
    );
  }

  /// `Ensure the address and serial number are readable.`
  String get driver_register_id_back_desc_2 {
    return Intl.message(
      'Ensure the address and serial number are readable.',
      name: 'driver_register_id_back_desc_2',
      desc: '',
      args: [],
    );
  }

  /// `Use natural light and place the card on a flat surface.`
  String get driver_register_id_back_desc_3 {
    return Intl.message(
      'Use natural light and place the card on a flat surface.',
      name: 'driver_register_id_back_desc_3',
      desc: '',
      args: [],
    );
  }

  /// `Criminal Status Record`
  String get driver_register_criminal_record_title {
    return Intl.message(
      'Criminal Status Record',
      name: 'driver_register_criminal_record_title',
      desc: '',
      args: [],
    );
  }

  /// `Upload your Criminal Status Record issued within the last 3 months.`
  String get driver_register_criminal_record_desc_1 {
    return Intl.message(
      'Upload your Criminal Status Record issued within the last 3 months.',
      name: 'driver_register_criminal_record_desc_1',
      desc: '',
      args: [],
    );
  }

  /// `Make sure all stamps and signatures are visible.`
  String get driver_register_criminal_record_desc_2 {
    return Intl.message(
      'Make sure all stamps and signatures are visible.',
      name: 'driver_register_criminal_record_desc_2',
      desc: '',
      args: [],
    );
  }

  /// `Ensure the document is fully scanned and not cropped.`
  String get driver_register_criminal_record_desc_3 {
    return Intl.message(
      'Ensure the document is fully scanned and not cropped.',
      name: 'driver_register_criminal_record_desc_3',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle Picture`
  String get driver_register_vehicle_picture_title {
    return Intl.message(
      'Vehicle Picture',
      name: 'driver_register_vehicle_picture_title',
      desc: '',
      args: [],
    );
  }

  /// `Upload a full side view of your vehicle.`
  String get driver_register_vehicle_picture_desc_1 {
    return Intl.message(
      'Upload a full side view of your vehicle.',
      name: 'driver_register_vehicle_picture_desc_1',
      desc: '',
      args: [],
    );
  }

  /// `Ensure the license plate is visible.`
  String get driver_register_vehicle_picture_desc_2 {
    return Intl.message(
      'Ensure the license plate is visible.',
      name: 'driver_register_vehicle_picture_desc_2',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle must be clean and undamaged.`
  String get driver_register_vehicle_picture_desc_3 {
    return Intl.message(
      'Vehicle must be clean and undamaged.',
      name: 'driver_register_vehicle_picture_desc_3',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle Registration (Front)`
  String get driver_register_vehicle_reg_front_title {
    return Intl.message(
      'Vehicle Registration (Front)',
      name: 'driver_register_vehicle_reg_front_title',
      desc: '',
      args: [],
    );
  }

  /// `Upload the front page of the official vehicle registration certificate.`
  String get driver_register_vehicle_reg_front_desc_1 {
    return Intl.message(
      'Upload the front page of the official vehicle registration certificate.',
      name: 'driver_register_vehicle_reg_front_desc_1',
      desc: '',
      args: [],
    );
  }

  /// `All registration details must be visible and readable.`
  String get driver_register_vehicle_reg_front_desc_2 {
    return Intl.message(
      'All registration details must be visible and readable.',
      name: 'driver_register_vehicle_reg_front_desc_2',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle Registration (Back)`
  String get driver_register_vehicle_reg_back_title {
    return Intl.message(
      'Vehicle Registration (Back)',
      name: 'driver_register_vehicle_reg_back_title',
      desc: '',
      args: [],
    );
  }

  /// `Upload the back page of your vehicle registration.`
  String get driver_register_vehicle_reg_back_desc_1 {
    return Intl.message(
      'Upload the back page of your vehicle registration.',
      name: 'driver_register_vehicle_reg_back_desc_1',
      desc: '',
      args: [],
    );
  }

  /// `Ensure the chassis number and expiry date are clear.`
  String get driver_register_vehicle_reg_back_desc_2 {
    return Intl.message(
      'Ensure the chassis number and expiry date are clear.',
      name: 'driver_register_vehicle_reg_back_desc_2',
      desc: '',
      args: [],
    );
  }

  /// `Take a picture`
  String get driver_image_take_picture {
    return Intl.message(
      'Take a picture',
      name: 'driver_image_take_picture',
      desc: '',
      args: [],
    );
  }

  /// `Choose from Gallery`
  String get driver_image_choose_gallery {
    return Intl.message(
      'Choose from Gallery',
      name: 'driver_image_choose_gallery',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get transport_location_loading {
    return Intl.message(
      'Loading...',
      name: 'transport_location_loading',
      desc: '',
      args: [],
    );
  }

  /// `To`
  String get transport_destination {
    return Intl.message(
      'To',
      name: 'transport_destination',
      desc: '',
      args: [],
    );
  }

  /// `Add New Card`
  String get transport_add_new_card {
    return Intl.message(
      'Add New Card',
      name: 'transport_add_new_card',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get transport_delete {
    return Intl.message('Delete', name: 'transport_delete', desc: '', args: []);
  }

  /// `Lasted trips`
  String get transport_latest_trips {
    return Intl.message(
      'Lasted trips',
      name: 'transport_latest_trips',
      desc: '',
      args: [],
    );
  }

  /// `No trips found.`
  String get transport_no_trips {
    return Intl.message(
      'No trips found.',
      name: 'transport_no_trips',
      desc: '',
      args: [],
    );
  }

  /// `From: `
  String get trip_from_label {
    return Intl.message('From: ', name: 'trip_from_label', desc: '', args: []);
  }

  /// `To: `
  String get trip_to_label {
    return Intl.message('To: ', name: 'trip_to_label', desc: '', args: []);
  }

  /// `$`
  String get trip_currency_symbol {
    return Intl.message('\$', name: 'trip_currency_symbol', desc: '', args: []);
  }

  /// `Display Route in map`
  String get trip_details_display_route {
    return Intl.message(
      'Display Route in map',
      name: 'trip_details_display_route',
      desc: '',
      args: [],
    );
  }

  /// `Departure date`
  String get trip_details_departure_date {
    return Intl.message(
      'Departure date',
      name: 'trip_details_departure_date',
      desc: '',
      args: [],
    );
  }

  /// `Estimated Distance`
  String get trip_details_estimated_distance {
    return Intl.message(
      'Estimated Distance',
      name: 'trip_details_estimated_distance',
      desc: '',
      args: [],
    );
  }

  /// `Estimated Arrival Time`
  String get trip_details_estimated_arrival {
    return Intl.message(
      'Estimated Arrival Time',
      name: 'trip_details_estimated_arrival',
      desc: '',
      args: [],
    );
  }

  /// `Seats`
  String get trip_details_seats_suffix {
    return Intl.message(
      'Seats',
      name: 'trip_details_seats_suffix',
      desc: '',
      args: [],
    );
  }

  /// `Driving skills`
  String get trip_details_rating_driving_skills {
    return Intl.message(
      'Driving skills',
      name: 'trip_details_rating_driving_skills',
      desc: '',
      args: [],
    );
  }

  /// `Punctuality`
  String get trip_details_rating_punctuality {
    return Intl.message(
      'Punctuality',
      name: 'trip_details_rating_punctuality',
      desc: '',
      args: [],
    );
  }

  /// `Behavior`
  String get trip_details_rating_behavior {
    return Intl.message(
      'Behavior',
      name: 'trip_details_rating_behavior',
      desc: '',
      args: [],
    );
  }

  /// `Pricing`
  String get trip_details_rating_pricing {
    return Intl.message(
      'Pricing',
      name: 'trip_details_rating_pricing',
      desc: '',
      args: [],
    );
  }

  /// `Rating`
  String get trip_details_rating_title {
    return Intl.message(
      'Rating',
      name: 'trip_details_rating_title',
      desc: '',
      args: [],
    );
  }

  /// `Car Model`
  String get trip_details_car_model {
    return Intl.message(
      'Car Model',
      name: 'trip_details_car_model',
      desc: '',
      args: [],
    );
  }

  /// `Seats`
  String get trip_details_seats {
    return Intl.message(
      'Seats',
      name: 'trip_details_seats',
      desc: '',
      args: [],
    );
  }

  /// `License Plate`
  String get trip_details_license_plate {
    return Intl.message(
      'License Plate',
      name: 'trip_details_license_plate',
      desc: '',
      args: [],
    );
  }

  /// `Mobile number`
  String get trip_details_mobile_number {
    return Intl.message(
      'Mobile number',
      name: 'trip_details_mobile_number',
      desc: '',
      args: [],
    );
  }

  /// `Last Reviews`
  String get trip_details_last_reviews {
    return Intl.message(
      'Last Reviews',
      name: 'trip_details_last_reviews',
      desc: '',
      args: [],
    );
  }

  /// `Book Trip`
  String get book_trip_title {
    return Intl.message(
      'Book Trip',
      name: 'book_trip_title',
      desc: '',
      args: [],
    );
  }

  /// `Number of Seats`
  String get book_trip_number_of_seats {
    return Intl.message(
      'Number of Seats',
      name: 'book_trip_number_of_seats',
      desc: '',
      args: [],
    );
  }

  /// `Meeting Point`
  String get book_trip_meeting_point_title {
    return Intl.message(
      'Meeting Point',
      name: 'book_trip_meeting_point_title',
      desc: '',
      args: [],
    );
  }

  /// `Select your preferred meeting point on the map`
  String get book_trip_meeting_point_desc {
    return Intl.message(
      'Select your preferred meeting point on the map',
      name: 'book_trip_meeting_point_desc',
      desc: '',
      args: [],
    );
  }

  /// `Add Note`
  String get book_trip_add_note {
    return Intl.message(
      'Add Note',
      name: 'book_trip_add_note',
      desc: '',
      args: [],
    );
  }

  /// `Add any special instructions or requirements`
  String get book_trip_note_hint {
    return Intl.message(
      'Add any special instructions or requirements',
      name: 'book_trip_note_hint',
      desc: '',
      args: [],
    );
  }

  /// `Continue to Payment`
  String get book_trip_continue_payment {
    return Intl.message(
      'Continue to Payment',
      name: 'book_trip_continue_payment',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get payment_title {
    return Intl.message('Payment', name: 'payment_title', desc: '', args: []);
  }

  /// `Cancel`
  String get payment_cancel {
    return Intl.message('Cancel', name: 'payment_cancel', desc: '', args: []);
  }

  /// `Wallet`
  String get payment_wallet_tab {
    return Intl.message(
      'Wallet',
      name: 'payment_wallet_tab',
      desc: '',
      args: [],
    );
  }

  /// `Card`
  String get payment_card_tab {
    return Intl.message('Card', name: 'payment_card_tab', desc: '', args: []);
  }

  /// `Pay from`
  String get payment_pay_from {
    return Intl.message(
      'Pay from',
      name: 'payment_pay_from',
      desc: '',
      args: [],
    );
  }

  /// `No Debit Card Found`
  String get payment_no_debit_card {
    return Intl.message(
      'No Debit Card Found',
      name: 'payment_no_debit_card',
      desc: '',
      args: [],
    );
  }

  /// `No cards available`
  String get payment_no_cards {
    return Intl.message(
      'No cards available',
      name: 'payment_no_cards',
      desc: '',
      args: [],
    );
  }

  /// `loading`
  String get payment_loading {
    return Intl.message('loading', name: 'payment_loading', desc: '', args: []);
  }

  /// `Add a new card`
  String get payment_add_new_card {
    return Intl.message(
      'Add a new card',
      name: 'payment_add_new_card',
      desc: '',
      args: [],
    );
  }

  /// `Wallet Number`
  String get payment_wallet_number {
    return Intl.message(
      'Wallet Number',
      name: 'payment_wallet_number',
      desc: '',
      args: [],
    );
  }

  /// `Phone number is required`
  String get payment_phone_required {
    return Intl.message(
      'Phone number is required',
      name: 'payment_phone_required',
      desc: '',
      args: [],
    );
  }

  /// `Phone number must start with 010, 011, 012, or 015`
  String get payment_phone_prefix {
    return Intl.message(
      'Phone number must start with 010, 011, 012, or 015',
      name: 'payment_phone_prefix',
      desc: '',
      args: [],
    );
  }

  /// `Phone number must be exactly 11 digits`
  String get payment_phone_length {
    return Intl.message(
      'Phone number must be exactly 11 digits',
      name: 'payment_phone_length',
      desc: '',
      args: [],
    );
  }

  /// `01X XXXX XXXX`
  String get payment_phone_hint {
    return Intl.message(
      '01X XXXX XXXX',
      name: 'payment_phone_hint',
      desc: '',
      args: [],
    );
  }

  /// `Number of seats`
  String get payment_seats_count {
    return Intl.message(
      'Number of seats',
      name: 'payment_seats_count',
      desc: '',
      args: [],
    );
  }

  /// `Total amount`
  String get payment_total_amount {
    return Intl.message(
      'Total amount',
      name: 'payment_total_amount',
      desc: '',
      args: [],
    );
  }

  /// `Proceed`
  String get payment_proceed {
    return Intl.message('Proceed', name: 'payment_proceed', desc: '', args: []);
  }

  /// `Pay: 24 EG`
  String get payment_amount {
    return Intl.message(
      'Pay: 24 EG',
      name: 'payment_amount',
      desc: '',
      args: [],
    );
  }

  /// `Search Trip`
  String get search_trip_title {
    return Intl.message(
      'Search Trip',
      name: 'search_trip_title',
      desc: '',
      args: [],
    );
  }

  /// `From`
  String get search_trip_from_hint {
    return Intl.message(
      'From',
      name: 'search_trip_from_hint',
      desc: '',
      args: [],
    );
  }

  /// `To`
  String get search_trip_to_hint {
    return Intl.message('To', name: 'search_trip_to_hint', desc: '', args: []);
  }

  /// `All trips`
  String get search_trip_all_trips {
    return Intl.message(
      'All trips',
      name: 'search_trip_all_trips',
      desc: '',
      args: [],
    );
  }

  /// `No trips found for this destination.\nYou can set it as your active destination to get notified when a driver creates a trip.`
  String get search_trip_no_trips_message {
    return Intl.message(
      'No trips found for this destination.\nYou can set it as your active destination to get notified when a driver creates a trip.',
      name: 'search_trip_no_trips_message',
      desc: '',
      args: [],
    );
  }

  /// `Set Active Destination`
  String get search_trip_set_active_destination {
    return Intl.message(
      'Set Active Destination',
      name: 'search_trip_set_active_destination',
      desc: '',
      args: [],
    );
  }

  /// `From: `
  String get search_trip_from_label {
    return Intl.message(
      'From: ',
      name: 'search_trip_from_label',
      desc: '',
      args: [],
    );
  }

  /// `To: `
  String get search_trip_to_label {
    return Intl.message(
      'To: ',
      name: 'search_trip_to_label',
      desc: '',
      args: [],
    );
  }

  /// `Active passengers: `
  String get search_trip_active_passengers {
    return Intl.message(
      'Active passengers: ',
      name: 'search_trip_active_passengers',
      desc: '',
      args: [],
    );
  }

  /// `{count, plural, =0{No seats} =1{1 seat} other{{count} seats}}`
  String seats(num count) {
    return Intl.plural(
      count,
      zero: 'No seats',
      one: '1 seat',
      other: '$count seats',
      name: 'seats',
      desc: 'Number of seats in English',
      args: [count],
    );
  }

  /// `{count, plural, =0{No trips} =1{1 trip} other{{count} trips}}`
  String trip(num count) {
    return Intl.plural(
      count,
      zero: 'No trips',
      one: '1 trip',
      other: '$count trips',
      name: 'trip',
      desc: 'Number of trip in English',
      args: [count],
    );
  }

  /// `Transactions`
  String get user_profile_transactions {
    return Intl.message(
      'Transactions',
      name: 'user_profile_transactions',
      desc: '',
      args: [],
    );
  }

  /// `Booking history`
  String get user_profile_booking_history {
    return Intl.message(
      'Booking history',
      name: 'user_profile_booking_history',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get user_profile_theme_light {
    return Intl.message(
      'Light',
      name: 'user_profile_theme_light',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get user_profile_theme_dark {
    return Intl.message(
      'Dark',
      name: 'user_profile_theme_dark',
      desc: '',
      args: [],
    );
  }

  /// `Payment Receipt`
  String get payment_receipt_title {
    return Intl.message(
      'Payment Receipt',
      name: 'payment_receipt_title',
      desc: '',
      args: [],
    );
  }

  /// `Your payment for Aoun was successful.`
  String get payment_success_description {
    return Intl.message(
      'Your payment for Aoun was successful.',
      name: 'payment_success_description',
      desc: '',
      args: [],
    );
  }

  /// `Total Payment`
  String get payment_total_payment {
    return Intl.message(
      'Total Payment',
      name: 'payment_total_payment',
      desc: '',
      args: [],
    );
  }

  /// `Total Seats`
  String get payment_total_seats {
    return Intl.message(
      'Total Seats',
      name: 'payment_total_seats',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get payment_done_button {
    return Intl.message(
      'Done',
      name: 'payment_done_button',
      desc: '',
      args: [],
    );
  }

  /// `Book again`
  String get payment_pay_again_button {
    return Intl.message(
      'Book again',
      name: 'payment_pay_again_button',
      desc: '',
      args: [],
    );
  }

  /// `Paymob Payment`
  String get paymob_payment_title {
    return Intl.message(
      'Paymob Payment',
      name: 'paymob_payment_title',
      desc: '',
      args: [],
    );
  }

  /// `error`
  String get paymob_error_message {
    return Intl.message(
      'error',
      name: 'paymob_error_message',
      desc: '',
      args: [],
    );
  }

  /// `Updated Successfully`
  String get user_edit_profile_update_success_title {
    return Intl.message(
      'Updated Successfully',
      name: 'user_edit_profile_update_success_title',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get user_edit_profile_update_success_ok {
    return Intl.message(
      'Ok',
      name: 'user_edit_profile_update_success_ok',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contact_us_title {
    return Intl.message(
      'Contact Us',
      name: 'contact_us_title',
      desc: '',
      args: [],
    );
  }

  /// `Your Email`
  String get contact_us_email_hint {
    return Intl.message(
      'Your Email',
      name: 'contact_us_email_hint',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get contact_us_email_required {
    return Intl.message(
      'Please enter your email',
      name: 'contact_us_email_required',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid email`
  String get contact_us_email_invalid {
    return Intl.message(
      'Enter a valid email',
      name: 'contact_us_email_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Your Phone`
  String get contact_us_phone_hint {
    return Intl.message(
      'Your Phone',
      name: 'contact_us_phone_hint',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your phone number`
  String get contact_us_phone_required {
    return Intl.message(
      'Please enter your phone number',
      name: 'contact_us_phone_required',
      desc: '',
      args: [],
    );
  }

  /// `Your Address`
  String get contact_us_address_hint {
    return Intl.message(
      'Your Address',
      name: 'contact_us_address_hint',
      desc: '',
      args: [],
    );
  }

  /// `Your Message...`
  String get contact_us_message_hint {
    return Intl.message(
      'Your Message...',
      name: 'contact_us_message_hint',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your message`
  String get contact_us_message_required {
    return Intl.message(
      'Please enter your message',
      name: 'contact_us_message_required',
      desc: '',
      args: [],
    );
  }

  /// `Message sent!`
  String get contact_us_message_sent {
    return Intl.message(
      'Message sent!',
      name: 'contact_us_message_sent',
      desc: '',
      args: [],
    );
  }

  /// `Send Message`
  String get contact_us_send_button {
    return Intl.message(
      'Send Message',
      name: 'contact_us_send_button',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get terms_conditions_title {
    return Intl.message(
      'Terms & Conditions',
      name: 'terms_conditions_title',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Use`
  String get terms_conditions_header {
    return Intl.message(
      'Terms of Use',
      name: 'terms_conditions_header',
      desc: '',
      args: [],
    );
  }

  /// `These Terms of Use govern your access and use of Auan Services made available by Auan Inc., a private limited liability company established in the British Virgin Islands.\n\nBy accessing or using the Auan Services, you agree to be bound by these Terms, which establish a contractual relationship between you and Auan. Please read these Terms carefully before using our services.`
  String get terms_conditions_introduction {
    return Intl.message(
      'These Terms of Use govern your access and use of Auan Services made available by Auan Inc., a private limited liability company established in the British Virgin Islands.\n\nBy accessing or using the Auan Services, you agree to be bound by these Terms, which establish a contractual relationship between you and Auan. Please read these Terms carefully before using our services.',
      name: 'terms_conditions_introduction',
      desc: '',
      args: [],
    );
  }

  /// `Contractual Relationship`
  String get terms_conditions_contractual_relationship_title {
    return Intl.message(
      'Contractual Relationship',
      name: 'terms_conditions_contractual_relationship_title',
      desc: '',
      args: [],
    );
  }

  /// `These Terms of Use ("Terms") govern the access or use by you, an individual, from within any country in the world (excluding the United States and its territories and possessions and Mainland China) of applications, websites, content, call center, technology platform, e-payment services, products, and services (collectively, the "Auan Services") made available by Auan Inc.\n\nThese Terms constitute a legally binding agreement between you and your local Auan entity. Please read these Terms carefully before accessing or using the Auan Services. If you do not agree to be bound by the Terms, you may not use or access the Auan Services.\n\nYour access and use of the Auan Services constitutes your agreement to be bound by these Terms, which establishes a contractual relationship between you, Auan, and your local Auan entity. These Terms expressly supersede prior agreements or arrangements with you.\n\nAuan may immediately terminate these Terms or any of the Auan Services with respect to you, or generally cease offering or deny access to the Auan Services or any portion thereof, at any time for any reason.`
  String get terms_conditions_contractual_relationship_content {
    return Intl.message(
      'These Terms of Use ("Terms") govern the access or use by you, an individual, from within any country in the world (excluding the United States and its territories and possessions and Mainland China) of applications, websites, content, call center, technology platform, e-payment services, products, and services (collectively, the "Auan Services") made available by Auan Inc.\n\nThese Terms constitute a legally binding agreement between you and your local Auan entity. Please read these Terms carefully before accessing or using the Auan Services. If you do not agree to be bound by the Terms, you may not use or access the Auan Services.\n\nYour access and use of the Auan Services constitutes your agreement to be bound by these Terms, which establishes a contractual relationship between you, Auan, and your local Auan entity. These Terms expressly supersede prior agreements or arrangements with you.\n\nAuan may immediately terminate these Terms or any of the Auan Services with respect to you, or generally cease offering or deny access to the Auan Services or any portion thereof, at any time for any reason.',
      name: 'terms_conditions_contractual_relationship_content',
      desc: '',
      args: [],
    );
  }

  /// `Amendments and Supplemental Terms`
  String get terms_conditions_amendments_title {
    return Intl.message(
      'Amendments and Supplemental Terms',
      name: 'terms_conditions_amendments_title',
      desc: '',
      args: [],
    );
  }

  /// `Supplemental terms may apply to certain Auan Services, such as policies for a particular event, activity, or promotion, and such supplemental terms will be disclosed to you in connection with the applicable Auan Services. Supplemental terms are in addition to, and shall be deemed a part of, the Terms for the purposes and period of the applicable Auan Services.\n\nAuan may amend the Terms related to the Auan Services from time to time. Amendments will be effective upon Auan posting such updated Terms at this location or the amended policies or supplemental terms on the applicable Service. Your continued access or use of the Auan Services after such posting constitutes your consent to be bound by the Terms, as amended.\n\nOur collection and use of your personal information is provided in Auan's Privacy Policy, which can be accessed at https://swvl.com/privacy_policy.`
  String get terms_conditions_amendments_content {
    return Intl.message(
      'Supplemental terms may apply to certain Auan Services, such as policies for a particular event, activity, or promotion, and such supplemental terms will be disclosed to you in connection with the applicable Auan Services. Supplemental terms are in addition to, and shall be deemed a part of, the Terms for the purposes and period of the applicable Auan Services.\n\nAuan may amend the Terms related to the Auan Services from time to time. Amendments will be effective upon Auan posting such updated Terms at this location or the amended policies or supplemental terms on the applicable Service. Your continued access or use of the Auan Services after such posting constitutes your consent to be bound by the Terms, as amended.\n\nOur collection and use of your personal information is provided in Auan\'s Privacy Policy, which can be accessed at https://swvl.com/privacy_policy.',
      name: 'terms_conditions_amendments_content',
      desc: '',
      args: [],
    );
  }

  /// `The Auan Services`
  String get terms_conditions_services_title {
    return Intl.message(
      'The Auan Services',
      name: 'terms_conditions_services_title',
      desc: '',
      args: [],
    );
  }

  /// `The Auan Services constitute a technology platform that enables users of Auan's mobile applications or websites provided as part of the Auan Services (each, an "Application") to arrange and schedule transportation services with independent third-party providers of such services, including independent third-party transportation providers under agreement with Auan or certain of Auan's Affiliates ("Third Party Providers").\n\nUnless otherwise agreed by Auan in a separate written agreement with you, the Auan Services are made available solely for your personal and non-commercial use. Each service provided by a Third Party Provider to you shall constitute a separate legal agreement between you and the Third Party Provider.\n\nYou acknowledge that Auan does not provide any form of transportation services or function as a transportation carrier or service provider or own any vehicles for transportation and that all such transportation services are provided by Third Party Providers who are not employed by Auan or any of its Affiliates nor operate under their control.`
  String get terms_conditions_services_content {
    return Intl.message(
      'The Auan Services constitute a technology platform that enables users of Auan\'s mobile applications or websites provided as part of the Auan Services (each, an "Application") to arrange and schedule transportation services with independent third-party providers of such services, including independent third-party transportation providers under agreement with Auan or certain of Auan\'s Affiliates ("Third Party Providers").\n\nUnless otherwise agreed by Auan in a separate written agreement with you, the Auan Services are made available solely for your personal and non-commercial use. Each service provided by a Third Party Provider to you shall constitute a separate legal agreement between you and the Third Party Provider.\n\nYou acknowledge that Auan does not provide any form of transportation services or function as a transportation carrier or service provider or own any vehicles for transportation and that all such transportation services are provided by Third Party Providers who are not employed by Auan or any of its Affiliates nor operate under their control.',
      name: 'terms_conditions_services_content',
      desc: '',
      args: [],
    );
  }

  /// `License`
  String get terms_conditions_license_title {
    return Intl.message(
      'License',
      name: 'terms_conditions_license_title',
      desc: '',
      args: [],
    );
  }

  /// `Subject to your compliance with these Terms, Auan grants you a limited, non-exclusive, non-sublicensable, non-assignable, revocable, and non-transferable license to:\n\n• Access and use the Applications on your personal device solely in connection with your use of the Auan Services\n\n• Access and use any content, information, and related materials that may be made available through the Auan Services, in each case solely for your personal and non-commercial use\n\nAny rights not expressly granted herein are reserved by Auan and Auan's licensors.`
  String get terms_conditions_license_content {
    return Intl.message(
      'Subject to your compliance with these Terms, Auan grants you a limited, non-exclusive, non-sublicensable, non-assignable, revocable, and non-transferable license to:\n\n• Access and use the Applications on your personal device solely in connection with your use of the Auan Services\n\n• Access and use any content, information, and related materials that may be made available through the Auan Services, in each case solely for your personal and non-commercial use\n\nAny rights not expressly granted herein are reserved by Auan and Auan\'s licensors.',
      name: 'terms_conditions_license_content',
      desc: '',
      args: [],
    );
  }

  /// `Restrictions`
  String get terms_conditions_restrictions_title {
    return Intl.message(
      'Restrictions',
      name: 'terms_conditions_restrictions_title',
      desc: '',
      args: [],
    );
  }

  /// `You specifically agree not to, without the prior explicit written consent of Auan:\n\n• Remove any copyright, trademark, or other proprietary notices from any portion of the Auan Services\n\n• Reproduce, modify, prepare derivative works based upon, distribute, license, lease, sell, resell, transfer, publicly display, publicly perform, transmit, stream, broadcast, or otherwise exploit the Auan Services except as expressly permitted by Auan\n\n• Decompile, reverse engineer, or disassemble the Auan Services\n\n• Link to, mirror, or frame any portion of the Auan Services\n\n• Cause or launch any programs or scripts for the purpose of scraping, indexing, surveying, or otherwise data mining any portion of the Auan Services\n\n• Attempt to gain unauthorized access to or impair any aspect of the Auan Services or its related systems or networks`
  String get terms_conditions_restrictions_content {
    return Intl.message(
      'You specifically agree not to, without the prior explicit written consent of Auan:\n\n• Remove any copyright, trademark, or other proprietary notices from any portion of the Auan Services\n\n• Reproduce, modify, prepare derivative works based upon, distribute, license, lease, sell, resell, transfer, publicly display, publicly perform, transmit, stream, broadcast, or otherwise exploit the Auan Services except as expressly permitted by Auan\n\n• Decompile, reverse engineer, or disassemble the Auan Services\n\n• Link to, mirror, or frame any portion of the Auan Services\n\n• Cause or launch any programs or scripts for the purpose of scraping, indexing, surveying, or otherwise data mining any portion of the Auan Services\n\n• Attempt to gain unauthorized access to or impair any aspect of the Auan Services or its related systems or networks',
      name: 'terms_conditions_restrictions_content',
      desc: '',
      args: [],
    );
  }

  /// `Provision of Auan Services`
  String get terms_conditions_provision_title {
    return Intl.message(
      'Provision of Auan Services',
      name: 'terms_conditions_provision_title',
      desc: '',
      args: [],
    );
  }

  /// `You acknowledge that portions of the Auan Services may be made available under Auan's various brands or request options associated with transportation, including the transportation request brands currently referred to as "Premium" and "Economy."\n\nYou also acknowledge that the Auan Services may be made available under such brands or request options by or in connection with:\n\n• Certain of Auan's Affiliates\n• Independent Third Party Providers, including transportation network company drivers, transportation charter permit holders, or holders of similar transportation permits, authorizations, or licenses`
  String get terms_conditions_provision_content {
    return Intl.message(
      'You acknowledge that portions of the Auan Services may be made available under Auan\'s various brands or request options associated with transportation, including the transportation request brands currently referred to as "Premium" and "Economy."\n\nYou also acknowledge that the Auan Services may be made available under such brands or request options by or in connection with:\n\n• Certain of Auan\'s Affiliates\n• Independent Third Party Providers, including transportation network company drivers, transportation charter permit holders, or holders of similar transportation permits, authorizations, or licenses',
      name: 'terms_conditions_provision_content',
      desc: '',
      args: [],
    );
  }

  /// `Third Party Services and Content`
  String get terms_conditions_third_party_title {
    return Intl.message(
      'Third Party Services and Content',
      name: 'terms_conditions_third_party_title',
      desc: '',
      args: [],
    );
  }

  /// `The Auan Services may be made available or accessed in connection with third-party services and content (including advertising) that Auan does not control. You acknowledge that different terms of use and privacy policies may apply to your use of such third-party services and content.\n\nAuan does not endorse such third-party services and content, and in no event shall Auan be responsible or liable for any products or services of such third-party providers.\n\nAdditionally, Apple Inc., Google, Inc., or the provider of any other applicable mobile operating system and/or their applicable international subsidiaries and affiliates will be third-party beneficiaries to these Terms if you access the Auan Services using Applications developed for Apple iOS, Android, or any other applicable operating system-powered mobile devices, respectively.`
  String get terms_conditions_third_party_content {
    return Intl.message(
      'The Auan Services may be made available or accessed in connection with third-party services and content (including advertising) that Auan does not control. You acknowledge that different terms of use and privacy policies may apply to your use of such third-party services and content.\n\nAuan does not endorse such third-party services and content, and in no event shall Auan be responsible or liable for any products or services of such third-party providers.\n\nAdditionally, Apple Inc., Google, Inc., or the provider of any other applicable mobile operating system and/or their applicable international subsidiaries and affiliates will be third-party beneficiaries to these Terms if you access the Auan Services using Applications developed for Apple iOS, Android, or any other applicable operating system-powered mobile devices, respectively.',
      name: 'terms_conditions_third_party_content',
      desc: '',
      args: [],
    );
  }

  /// `Ownership`
  String get terms_conditions_ownership_title {
    return Intl.message(
      'Ownership',
      name: 'terms_conditions_ownership_title',
      desc: '',
      args: [],
    );
  }

  /// `The Auan Services and all rights therein are and shall remain Auan's property or the property of Auan's licensors. Neither these Terms nor your use of the Auan Services convey or grant to you any rights:\n\n• In or related to the Auan Services except for the limited license granted above\n\n• To use or reference in any manner Auan's company names, logos, product and service names, trademarks, or service marks or those of Auan's licensors irrespective of whether or not they are registered or unregistered`
  String get terms_conditions_ownership_content {
    return Intl.message(
      'The Auan Services and all rights therein are and shall remain Auan\'s property or the property of Auan\'s licensors. Neither these Terms nor your use of the Auan Services convey or grant to you any rights:\n\n• In or related to the Auan Services except for the limited license granted above\n\n• To use or reference in any manner Auan\'s company names, logos, product and service names, trademarks, or service marks or those of Auan\'s licensors irrespective of whether or not they are registered or unregistered',
      name: 'terms_conditions_ownership_content',
      desc: '',
      args: [],
    );
  }

  /// `Need Help?`
  String get terms_conditions_need_help_title {
    return Intl.message(
      'Need Help?',
      name: 'terms_conditions_need_help_title',
      desc: '',
      args: [],
    );
  }

  /// `If you have any questions about these Terms of Use or need assistance with our services, please contact our support team.`
  String get terms_conditions_need_help_content {
    return Intl.message(
      'If you have any questions about these Terms of Use or need assistance with our services, please contact our support team.',
      name: 'terms_conditions_need_help_content',
      desc: '',
      args: [],
    );
  }

  /// `By continuing to use Auan Services, you acknowledge that you have read, understood, and agree to be bound by these Terms.`
  String get terms_conditions_acknowledgment {
    return Intl.message(
      'By continuing to use Auan Services, you acknowledge that you have read, understood, and agree to be bound by these Terms.',
      name: 'terms_conditions_acknowledgment',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacy_policy_title {
    return Intl.message(
      'Privacy Policy',
      name: 'privacy_policy_title',
      desc: '',
      args: [],
    );
  }

  /// `Understanding Our Commitment to Your Privacy`
  String get privacy_policy_header {
    return Intl.message(
      'Understanding Our Commitment to Your Privacy',
      name: 'privacy_policy_header',
      desc: '',
      args: [],
    );
  }

  /// `Auan Inc., its respective subsidiaries, affiliates, associated companies, and jointly controlled entities (collectively "Auan," "we," "our," or "us") appreciate your need for protection of your personal data and are committed to protecting and respecting the privacy of all persons contacting, visiting, or otherwise submitting information to Auan.\n\nThis Privacy Policy describes how Auan collects, uses, processes, and discloses your Personal Data through the use of Auan's Apps and Websites, products, features, and other services globally. This Policy applies to passengers, agents, vendors, suppliers, partners, contractors, and service providers.`
  String get privacy_policy_introduction {
    return Intl.message(
      'Auan Inc., its respective subsidiaries, affiliates, associated companies, and jointly controlled entities (collectively "Auan," "we," "our," or "us") appreciate your need for protection of your personal data and are committed to protecting and respecting the privacy of all persons contacting, visiting, or otherwise submitting information to Auan.\n\nThis Privacy Policy describes how Auan collects, uses, processes, and discloses your Personal Data through the use of Auan\'s Apps and Websites, products, features, and other services globally. This Policy applies to passengers, agents, vendors, suppliers, partners, contractors, and service providers.',
      name: 'privacy_policy_introduction',
      desc: '',
      args: [],
    );
  }

  /// `User's Acknowledgement of This Policy`
  String get privacy_policy_acknowledgment_title {
    return Intl.message(
      'User\'s Acknowledgement of This Policy',
      name: 'privacy_policy_acknowledgment_title',
      desc: '',
      args: [],
    );
  }

  /// `By using the services or registering, downloading, or entering the websites and/or the apps, you acknowledge that you are or have had the opportunity to become aware of this policy, including the processing (including collecting, using, disclosing, retaining, or disposing) of your information.\n\nThe information Auan holds about you may be held and processed on computer and/or paper files. If you provide Auan with any information regarding another person, it is your responsibility to make them aware of this policy.\n\nIf you have any questions or comments regarding privacy issues, please contact us at legal@swvl.com.`
  String get privacy_policy_acknowledgment_content {
    return Intl.message(
      'By using the services or registering, downloading, or entering the websites and/or the apps, you acknowledge that you are or have had the opportunity to become aware of this policy, including the processing (including collecting, using, disclosing, retaining, or disposing) of your information.\n\nThe information Auan holds about you may be held and processed on computer and/or paper files. If you provide Auan with any information regarding another person, it is your responsibility to make them aware of this policy.\n\nIf you have any questions or comments regarding privacy issues, please contact us at legal@swvl.com.',
      name: 'privacy_policy_acknowledgment_content',
      desc: '',
      args: [],
    );
  }

  /// `Types of Information We Collect`
  String get privacy_policy_types_info_title {
    return Intl.message(
      'Types of Information We Collect',
      name: 'privacy_policy_types_info_title',
      desc: '',
      args: [],
    );
  }

  /// `Auan collects both "Personal Information" and "Anonymous Information" about you:\n\n• Personal Information: Information that can be used to identify you, such as your full name, email address, phone number, payment method, password, mailing address, IP address, profile picture, location, as well as information that is linked to such information.\n\n• Anonymous Information: Information that we cannot use to identify you and is not linked to information that can be used to do so. It includes passively collected information about your activities on the websites or apps, such as use and usage data.\n\nWe also passively collect certain information from your devices, such as your IP address, screen resolution information, geographic location, Wi-Fi information, browser information, unique device identifier (UDID) and/or your mobile operating system.`
  String get privacy_policy_types_info_content {
    return Intl.message(
      'Auan collects both "Personal Information" and "Anonymous Information" about you:\n\n• Personal Information: Information that can be used to identify you, such as your full name, email address, phone number, payment method, password, mailing address, IP address, profile picture, location, as well as information that is linked to such information.\n\n• Anonymous Information: Information that we cannot use to identify you and is not linked to information that can be used to do so. It includes passively collected information about your activities on the websites or apps, such as use and usage data.\n\nWe also passively collect certain information from your devices, such as your IP address, screen resolution information, geographic location, Wi-Fi information, browser information, unique device identifier (UDID) and/or your mobile operating system.',
      name: 'privacy_policy_types_info_content',
      desc: '',
      args: [],
    );
  }

  /// `Voluntarily Submitted Information`
  String get privacy_policy_voluntary_info_title {
    return Intl.message(
      'Voluntarily Submitted Information',
      name: 'privacy_policy_voluntary_info_title',
      desc: '',
      args: [],
    );
  }

  /// `We collect information that you provide to us during your use of the Services:\n\n• Personal information during registration: full name, email address, phone number, payment method, billing information, profile picture, and profile information\n• Communications with us or with captains (emails, in-app messages, photos, text messages, written instructions)\n• User preference information: marketing preferences, communication preferences, home address, work address, favorites, and survey responses\n• Information provided to customer support via email, phone, apps, SMS, social media messaging, or other channels\n• Posts on forums or message boards, including Auan's social media pages\n• Data provided in promotions, competitions, feedback forms, or service-related issues\n\nNote: Some information is mandatory to create an account and use our Services.`
  String get privacy_policy_voluntary_info_content {
    return Intl.message(
      'We collect information that you provide to us during your use of the Services:\n\n• Personal information during registration: full name, email address, phone number, payment method, billing information, profile picture, and profile information\n• Communications with us or with captains (emails, in-app messages, photos, text messages, written instructions)\n• User preference information: marketing preferences, communication preferences, home address, work address, favorites, and survey responses\n• Information provided to customer support via email, phone, apps, SMS, social media messaging, or other channels\n• Posts on forums or message boards, including Auan\'s social media pages\n• Data provided in promotions, competitions, feedback forms, or service-related issues\n\nNote: Some information is mandatory to create an account and use our Services.',
      name: 'privacy_policy_voluntary_info_content',
      desc: '',
      args: [],
    );
  }

  /// `Information Collected Through Service Use`
  String get privacy_policy_service_use_title {
    return Intl.message(
      'Information Collected Through Service Use',
      name: 'privacy_policy_service_use_title',
      desc: '',
      args: [],
    );
  }

  /// `• Geolocation Data: If you access the apps through a mobile device, we may collect GPS coordinates of your trip (including pickup and drop-off data and route information) or similar location information.\n\n• Contacts: We may access your calendar or contacts with your permission.\n\n• Transaction Data: We collect information created during your interactions with services, including:\n  - Date and time of orders\n  - Captain acceptance and arrival\n  - Service completion details\n  - Distance traveled\n  - Amount charged (base fee, tip, additional fees)\n  - Promotional code usage`
  String get privacy_policy_service_use_content {
    return Intl.message(
      '• Geolocation Data: If you access the apps through a mobile device, we may collect GPS coordinates of your trip (including pickup and drop-off data and route information) or similar location information.\n\n• Contacts: We may access your calendar or contacts with your permission.\n\n• Transaction Data: We collect information created during your interactions with services, including:\n  - Date and time of orders\n  - Captain acceptance and arrival\n  - Service completion details\n  - Distance traveled\n  - Amount charged (base fee, tip, additional fees)\n  - Promotional code usage',
      name: 'privacy_policy_service_use_content',
      desc: '',
      args: [],
    );
  }

  /// `Information Provided by Others`
  String get privacy_policy_others_info_title {
    return Intl.message(
      'Information Provided by Others',
      name: 'privacy_policy_others_info_title',
      desc: '',
      args: [],
    );
  }

  /// `• We collect information that passengers provide about captains, and vice versa, including ratings, complaints, and postings on forums or message boards\n• Auan may receive information about you from affiliated websites or services\n• We work with third parties (business partners, subcontractors, payment processors, advertising networks, analytics providers, search information providers, and credit reference agencies) and may receive information about you from them\n• Where third parties collect information about you and share it with us, you should refer to their separately maintained privacy policies`
  String get privacy_policy_others_info_content {
    return Intl.message(
      '• We collect information that passengers provide about captains, and vice versa, including ratings, complaints, and postings on forums or message boards\n• Auan may receive information about you from affiliated websites or services\n• We work with third parties (business partners, subcontractors, payment processors, advertising networks, analytics providers, search information providers, and credit reference agencies) and may receive information about you from them\n• Where third parties collect information about you and share it with us, you should refer to their separately maintained privacy policies',
      name: 'privacy_policy_others_info_content',
      desc: '',
      args: [],
    );
  }

  /// `Cookies and Web Technologies`
  String get privacy_policy_cookies_title {
    return Intl.message(
      'Cookies and Web Technologies',
      name: 'privacy_policy_cookies_title',
      desc: '',
      args: [],
    );
  }

  /// `The websites use cookies and related technologies for:\n• Site functionality\n• Analytics\n• Advertising\n\nThe use of these technologies can involve the processing of personal data. For more information about how we use cookies and related technologies, and your choices regarding cookies, please refer to our Cookies Notice.`
  String get privacy_policy_cookies_content {
    return Intl.message(
      'The websites use cookies and related technologies for:\n• Site functionality\n• Analytics\n• Advertising\n\nThe use of these technologies can involve the processing of personal data. For more information about how we use cookies and related technologies, and your choices regarding cookies, please refer to our Cookies Notice.',
      name: 'privacy_policy_cookies_content',
      desc: '',
      args: [],
    );
  }

  /// `Security of Your Information`
  String get privacy_policy_security_title {
    return Intl.message(
      'Security of Your Information',
      name: 'privacy_policy_security_title',
      desc: '',
      args: [],
    );
  }

  /// `Auan has implemented administrative, physical, and electronic measures designed to protect your information from unauthorized access, modification, and unavailability.\n\nWe will comply with applicable law in the event of any breach of security, confidentiality, or integrity of your Personal Data and, where appropriate or required by law, notify you via email, text, or website posting in the most expedient time possible.\n\nAlthough guaranteed security does not exist either on or off the Internet, we make commercially reasonable efforts to ensure the collection and security of information are consistent with this Policy and all applicable laws and regulations.`
  String get privacy_policy_security_content {
    return Intl.message(
      'Auan has implemented administrative, physical, and electronic measures designed to protect your information from unauthorized access, modification, and unavailability.\n\nWe will comply with applicable law in the event of any breach of security, confidentiality, or integrity of your Personal Data and, where appropriate or required by law, notify you via email, text, or website posting in the most expedient time possible.\n\nAlthough guaranteed security does not exist either on or off the Internet, we make commercially reasonable efforts to ensure the collection and security of information are consistent with this Policy and all applicable laws and regulations.',
      name: 'privacy_policy_security_content',
      desc: '',
      args: [],
    );
  }

  /// `Location of Your Information`
  String get privacy_policy_location_title {
    return Intl.message(
      'Location of Your Information',
      name: 'privacy_policy_location_title',
      desc: '',
      args: [],
    );
  }

  /// `Your Personal Information may be disclosed to other Auan entities and third parties (including service providers) in jurisdictions including, but not limited to: British Virgin Islands, Egypt, Kenya, Pakistan, and United Arab Emirates.\n\nThe data that Auan collects from you may be transferred to and stored in a country that is not considered to offer an adequate level of protection under your local laws. It may also be processed by staff operating outside of your country of residence.\n\nBy submitting your Personal Information, you acknowledge and, where necessary under local laws, agree to this transfer, storage, or processing.`
  String get privacy_policy_location_content {
    return Intl.message(
      'Your Personal Information may be disclosed to other Auan entities and third parties (including service providers) in jurisdictions including, but not limited to: British Virgin Islands, Egypt, Kenya, Pakistan, and United Arab Emirates.\n\nThe data that Auan collects from you may be transferred to and stored in a country that is not considered to offer an adequate level of protection under your local laws. It may also be processed by staff operating outside of your country of residence.\n\nBy submitting your Personal Information, you acknowledge and, where necessary under local laws, agree to this transfer, storage, or processing.',
      name: 'privacy_policy_location_content',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get privacy_policy_contact_title {
    return Intl.message(
      'Contact Us',
      name: 'privacy_policy_contact_title',
      desc: '',
      args: [],
    );
  }

  /// `If you have any questions or comments regarding privacy issues, please contact us:`
  String get privacy_policy_contact_content {
    return Intl.message(
      'If you have any questions or comments regarding privacy issues, please contact us:',
      name: 'privacy_policy_contact_content',
      desc: '',
      args: [],
    );
  }

  /// `umssthasystem@gmail.com`
  String get privacy_policy_contact_email {
    return Intl.message(
      'umssthasystem@gmail.com',
      name: 'privacy_policy_contact_email',
      desc: '',
      args: [],
    );
  }

  /// `Welcome, {userName}`
  String home_user_welcome(Object userName) {
    return Intl.message(
      'Welcome, $userName',
      name: 'home_user_welcome',
      desc: 'Welcome message with user name',
      args: [userName],
    );
  }

  /// `Add new card`
  String get add_new_card_title {
    return Intl.message(
      'Add new card',
      name: 'add_new_card_title',
      desc: '',
      args: [],
    );
  }

  /// `Card number`
  String get add_new_card_number_hint {
    return Intl.message(
      'Card number',
      name: 'add_new_card_number_hint',
      desc: '',
      args: [],
    );
  }

  /// `Enter card number`
  String get add_new_card_number_required {
    return Intl.message(
      'Enter card number',
      name: 'add_new_card_number_required',
      desc: '',
      args: [],
    );
  }

  /// `Invalid card number length`
  String get add_new_card_number_invalid_length {
    return Intl.message(
      'Invalid card number length',
      name: 'add_new_card_number_invalid_length',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get add_new_card_full_name_hint {
    return Intl.message(
      'Full name',
      name: 'add_new_card_full_name_hint',
      desc: '',
      args: [],
    );
  }

  /// `Enter full name`
  String get add_new_card_full_name_required {
    return Intl.message(
      'Enter full name',
      name: 'add_new_card_full_name_required',
      desc: '',
      args: [],
    );
  }

  /// `Invalid name format`
  String get add_new_card_full_name_invalid_format {
    return Intl.message(
      'Invalid name format',
      name: 'add_new_card_full_name_invalid_format',
      desc: '',
      args: [],
    );
  }

  /// `MM/YY`
  String get add_new_card_expiry_hint {
    return Intl.message(
      'MM/YY',
      name: 'add_new_card_expiry_hint',
      desc: '',
      args: [],
    );
  }

  /// `Please enter expiry date`
  String get add_new_card_expiry_required {
    return Intl.message(
      'Please enter expiry date',
      name: 'add_new_card_expiry_required',
      desc: '',
      args: [],
    );
  }

  /// `Enter 4 digits (MMYY)`
  String get add_new_card_expiry_invalid_digits {
    return Intl.message(
      'Enter 4 digits (MMYY)',
      name: 'add_new_card_expiry_invalid_digits',
      desc: '',
      args: [],
    );
  }

  /// `Invalid month`
  String get add_new_card_expiry_invalid_month {
    return Intl.message(
      'Invalid month',
      name: 'add_new_card_expiry_invalid_month',
      desc: '',
      args: [],
    );
  }

  /// `Card expired`
  String get add_new_card_expiry_expired {
    return Intl.message(
      'Card expired',
      name: 'add_new_card_expiry_expired',
      desc: '',
      args: [],
    );
  }

  /// `CVV`
  String get add_new_card_cvv_hint {
    return Intl.message(
      'CVV',
      name: 'add_new_card_cvv_hint',
      desc: '',
      args: [],
    );
  }

  /// `Please enter CVV`
  String get add_new_card_cvv_required {
    return Intl.message(
      'Please enter CVV',
      name: 'add_new_card_cvv_required',
      desc: '',
      args: [],
    );
  }

  /// `CVV must be 3 digits`
  String get add_new_card_cvv_invalid {
    return Intl.message(
      'CVV must be 3 digits',
      name: 'add_new_card_cvv_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Add card`
  String get add_new_card_add_button {
    return Intl.message(
      'Add card',
      name: 'add_new_card_add_button',
      desc: '',
      args: [],
    );
  }

  /// `Success Add Card`
  String get add_new_card_success_message {
    return Intl.message(
      'Success Add Card',
      name: 'add_new_card_success_message',
      desc: '',
      args: [],
    );
  }

  /// `CARDHOLDER`
  String get add_new_card_cardholder_default {
    return Intl.message(
      'CARDHOLDER',
      name: 'add_new_card_cardholder_default',
      desc: '',
      args: [],
    );
  }

  /// `VALID\nTHRU`
  String get add_new_card_valid_thru_label {
    return Intl.message(
      'VALID\nTHRU',
      name: 'add_new_card_valid_thru_label',
      desc: '',
      args: [],
    );
  }

  /// `Authorized Signature`
  String get add_new_card_authorized_signature {
    return Intl.message(
      'Authorized Signature',
      name: 'add_new_card_authorized_signature',
      desc: '',
      args: [],
    );
  }

  /// `http://www.Aoun.com`
  String get add_new_card_website_url {
    return Intl.message(
      'http://www.Aoun.com',
      name: 'add_new_card_website_url',
      desc: '',
      args: [],
    );
  }

  /// `No results found for the entered location.`
  String get search_trip_no_results_found {
    return Intl.message(
      'No results found for the entered location.',
      name: 'search_trip_no_results_found',
      desc: '',
      args: [],
    );
  }

  /// `Suggested trips based on your location`
  String get search_trip_suggested_trips_title {
    return Intl.message(
      'Suggested trips based on your location',
      name: 'search_trip_suggested_trips_title',
      desc: '',
      args: [],
    );
  }

  /// `We're still gathering recommendations for you. Stay tuned!`
  String get search_trip_gathering_recommendations {
    return Intl.message(
      'We\'re still gathering recommendations for you. Stay tuned!',
      name: 'search_trip_gathering_recommendations',
      desc: '',
      args: [],
    );
  }

  /// `There are no active passengers at the moment.`
  String get search_trip_no_active_passengers {
    return Intl.message(
      'There are no active passengers at the moment.',
      name: 'search_trip_no_active_passengers',
      desc: '',
      args: [],
    );
  }

  /// `You've been set as active for this destination.`
  String get search_trip_active_destination_success {
    return Intl.message(
      'You\'ve been set as active for this destination.',
      name: 'search_trip_active_destination_success',
      desc: '',
      args: [],
    );
  }

  /// `Completed Booking`
  String get trip_details_completed_booking {
    return Intl.message(
      'Completed Booking',
      name: 'trip_details_completed_booking',
      desc: '',
      args: [],
    );
  }

  /// `Complete Payment`
  String get payment_complete_payment_title {
    return Intl.message(
      'Complete Payment',
      name: 'payment_complete_payment_title',
      desc: '',
      args: [],
    );
  }

  /// `You will now be redirected to complete the payment.\nA confirmation email has also been sent.`
  String get payment_complete_payment_message {
    return Intl.message(
      'You will now be redirected to complete the payment.\nA confirmation email has also been sent.',
      name: 'payment_complete_payment_message',
      desc: '',
      args: [],
    );
  }

  /// `Payment Success`
  String get payment_success_title {
    return Intl.message(
      'Payment Success',
      name: 'payment_success_title',
      desc: '',
      args: [],
    );
  }

  /// `Pay`
  String get payment_pay_amount {
    return Intl.message('Pay', name: 'payment_pay_amount', desc: '', args: []);
  }

  /// `It looks like you haven't added a card yet. Add one now to continue.`
  String get payment_no_card_added {
    return Intl.message(
      'It looks like you haven\'t added a card yet. Add one now to continue.',
      name: 'payment_no_card_added',
      desc: '',
      args: [],
    );
  }

  /// `Booking history`
  String get user_history_booking_title {
    return Intl.message(
      'Booking history',
      name: 'user_history_booking_title',
      desc: '',
      args: [],
    );
  }

  /// `There are no history trip at the moment.`
  String get user_history_booking_no_history {
    return Intl.message(
      'There are no history trip at the moment.',
      name: 'user_history_booking_no_history',
      desc: '',
      args: [],
    );
  }

  /// `From: `
  String get user_history_booking_from_label {
    return Intl.message(
      'From: ',
      name: 'user_history_booking_from_label',
      desc: '',
      args: [],
    );
  }

  /// `To: `
  String get user_history_booking_to_label {
    return Intl.message(
      'To: ',
      name: 'user_history_booking_to_label',
      desc: '',
      args: [],
    );
  }

  /// `Status: `
  String get user_history_booking_status_label {
    return Intl.message(
      'Status: ',
      name: 'user_history_booking_status_label',
      desc: '',
      args: [],
    );
  }

  /// `Total seats: `
  String get user_history_booking_total_seats_label {
    return Intl.message(
      'Total seats: ',
      name: 'user_history_booking_total_seats_label',
      desc: '',
      args: [],
    );
  }

  /// `Transaction`
  String get user_transactions_title {
    return Intl.message(
      'Transaction',
      name: 'user_transactions_title',
      desc: '',
      args: [],
    );
  }

  /// `You don't have any transactions yet.`
  String get user_transactions_no_transactions {
    return Intl.message(
      'You don\'t have any transactions yet.',
      name: 'user_transactions_no_transactions',
      desc: '',
      args: [],
    );
  }

  /// `Planned`
  String get trip_status_planned {
    return Intl.message(
      'Planned',
      name: 'trip_status_planned',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get trip_status_active {
    return Intl.message(
      'Active',
      name: 'trip_status_active',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get trip_status_completed {
    return Intl.message(
      'Completed',
      name: 'trip_status_completed',
      desc: '',
      args: [],
    );
  }

  /// `Canceled`
  String get trip_status_canceled {
    return Intl.message(
      'Canceled',
      name: 'trip_status_canceled',
      desc: '',
      args: [],
    );
  }

  /// `Unknown`
  String get trip_status_unknown {
    return Intl.message(
      'Unknown',
      name: 'trip_status_unknown',
      desc: '',
      args: [],
    );
  }

  /// `There are no active passengers at the moment.`
  String get home_driver_no_active_passengers {
    return Intl.message(
      'There are no active passengers at the moment.',
      name: 'home_driver_no_active_passengers',
      desc: '',
      args: [],
    );
  }

  /// `Active passengers: `
  String get home_driver_active_passengers_label {
    return Intl.message(
      'Active passengers: ',
      name: 'home_driver_active_passengers_label',
      desc: '',
      args: [],
    );
  }

  /// `From: `
  String get home_driver_from_label {
    return Intl.message(
      'From: ',
      name: 'home_driver_from_label',
      desc: '',
      args: [],
    );
  }

  /// `To: `
  String get home_driver_to_label {
    return Intl.message(
      'To: ',
      name: 'home_driver_to_label',
      desc: '',
      args: [],
    );
  }

  /// `Wallet and earnings`
  String get driver_wallet_earnings_title {
    return Intl.message(
      'Wallet and earnings',
      name: 'driver_wallet_earnings_title',
      desc: '',
      args: [],
    );
  }

  /// `Balance Your`
  String get driver_wallet_earnings_balance {
    return Intl.message(
      'Balance Your',
      name: 'driver_wallet_earnings_balance',
      desc: '',
      args: [],
    );
  }

  /// `Withdrawal`
  String get driver_wallet_earnings_withdrawal {
    return Intl.message(
      'Withdrawal',
      name: 'driver_wallet_earnings_withdrawal',
      desc: '',
      args: [],
    );
  }

  /// `Last Transaction`
  String get driver_wallet_earnings_last_transaction {
    return Intl.message(
      'Last Transaction',
      name: 'driver_wallet_earnings_last_transaction',
      desc: '',
      args: [],
    );
  }

  /// `You don't have any transactions yet.`
  String get driver_wallet_earnings_no_transactions {
    return Intl.message(
      'You don\'t have any transactions yet.',
      name: 'driver_wallet_earnings_no_transactions',
      desc: '',
      args: [],
    );
  }

  /// `Card number`
  String get driver_wallet_earnings_card_number {
    return Intl.message(
      'Card number',
      name: 'driver_wallet_earnings_card_number',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the card number`
  String get driver_wallet_earnings_card_number_required {
    return Intl.message(
      'Please enter the card number',
      name: 'driver_wallet_earnings_card_number_required',
      desc: '',
      args: [],
    );
  }

  /// `Card number must be 16 digits`
  String get driver_wallet_earnings_card_number_length {
    return Intl.message(
      'Card number must be 16 digits',
      name: 'driver_wallet_earnings_card_number_length',
      desc: '',
      args: [],
    );
  }

  /// `Only numbers are allowed`
  String get driver_wallet_earnings_card_number_digits {
    return Intl.message(
      'Only numbers are allowed',
      name: 'driver_wallet_earnings_card_number_digits',
      desc: '',
      args: [],
    );
  }

  /// `Withdrawal Request (Wednesdays only)`
  String get driver_wallet_earnings_withdrawal_request {
    return Intl.message(
      'Withdrawal Request (Wednesdays only)',
      name: 'driver_wallet_earnings_withdrawal_request',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the amount`
  String get driver_wallet_earnings_amount_required {
    return Intl.message(
      'Please enter the amount',
      name: 'driver_wallet_earnings_amount_required',
      desc: '',
      args: [],
    );
  }

  /// `Amount must be greater than 0`
  String get driver_wallet_earnings_amount_min {
    return Intl.message(
      'Amount must be greater than 0',
      name: 'driver_wallet_earnings_amount_min',
      desc: '',
      args: [],
    );
  }

  /// `Amount exceeds your available balance`
  String get driver_wallet_earnings_amount_exceeds {
    return Intl.message(
      'Amount exceeds your available balance',
      name: 'driver_wallet_earnings_amount_exceeds',
      desc: '',
      args: [],
    );
  }

  /// `Enter the amount to withdraw`
  String get driver_wallet_earnings_amount_hint {
    return Intl.message(
      'Enter the amount to withdraw',
      name: 'driver_wallet_earnings_amount_hint',
      desc: '',
      args: [],
    );
  }

  /// `Withdrawal is only allowed on Wednesdays.`
  String get driver_wallet_earnings_withdrawal_wednesday_only {
    return Intl.message(
      'Withdrawal is only allowed on Wednesdays.',
      name: 'driver_wallet_earnings_withdrawal_wednesday_only',
      desc: '',
      args: [],
    );
  }

  /// `Withdraw`
  String get driver_wallet_earnings_withdraw {
    return Intl.message(
      'Withdraw',
      name: 'driver_wallet_earnings_withdraw',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get driver_wallet_earnings_withdrawal_success_title {
    return Intl.message(
      'Success',
      name: 'driver_wallet_earnings_withdrawal_success_title',
      desc: '',
      args: [],
    );
  }

  /// `Your withdrawal has been completed successfully.`
  String get driver_wallet_earnings_withdrawal_success_message {
    return Intl.message(
      'Your withdrawal has been completed successfully.',
      name: 'driver_wallet_earnings_withdrawal_success_message',
      desc: '',
      args: [],
    );
  }

  /// `History trips`
  String get driver_history_trips_title {
    return Intl.message(
      'History trips',
      name: 'driver_history_trips_title',
      desc: '',
      args: [],
    );
  }

  /// `There are no history trip at the moment.`
  String get driver_history_trips_no_history {
    return Intl.message(
      'There are no history trip at the moment.',
      name: 'driver_history_trips_no_history',
      desc: '',
      args: [],
    );
  }

  /// `Sales`
  String get home_driver_chart_sales {
    return Intl.message(
      'Sales',
      name: 'home_driver_chart_sales',
      desc: '',
      args: [],
    );
  }

  /// `Monday`
  String get home_driver_monday {
    return Intl.message(
      'Monday',
      name: 'home_driver_monday',
      desc: '',
      args: [],
    );
  }

  /// `Tuesday`
  String get home_driver_tuesday {
    return Intl.message(
      'Tuesday',
      name: 'home_driver_tuesday',
      desc: '',
      args: [],
    );
  }

  /// `Wednesday`
  String get home_driver_wednesday {
    return Intl.message(
      'Wednesday',
      name: 'home_driver_wednesday',
      desc: '',
      args: [],
    );
  }

  /// `Thursday`
  String get home_driver_thursday {
    return Intl.message(
      'Thursday',
      name: 'home_driver_thursday',
      desc: '',
      args: [],
    );
  }

  /// `Friday`
  String get home_driver_friday {
    return Intl.message(
      'Friday',
      name: 'home_driver_friday',
      desc: '',
      args: [],
    );
  }

  /// `Saturday`
  String get home_driver_saturday {
    return Intl.message(
      'Saturday',
      name: 'home_driver_saturday',
      desc: '',
      args: [],
    );
  }

  /// `Sunday`
  String get home_driver_sunday {
    return Intl.message(
      'Sunday',
      name: 'home_driver_sunday',
      desc: '',
      args: [],
    );
  }

  /// `Bookings Passengers`
  String get created_trip_bookings_passengers {
    return Intl.message(
      'Bookings Passengers',
      name: 'created_trip_bookings_passengers',
      desc: '',
      args: [],
    );
  }

  /// `from`
  String get created_trip_from {
    return Intl.message('from', name: 'created_trip_from', desc: '', args: []);
  }

  /// `Status`
  String get created_trip_status {
    return Intl.message(
      'Status',
      name: 'created_trip_status',
      desc: '',
      args: [],
    );
  }

  /// `Planned`
  String get created_trip_status_planned {
    return Intl.message(
      'Planned',
      name: 'created_trip_status_planned',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get created_trip_status_active {
    return Intl.message(
      'Active',
      name: 'created_trip_status_active',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get created_trip_status_completed {
    return Intl.message(
      'Completed',
      name: 'created_trip_status_completed',
      desc: '',
      args: [],
    );
  }

  /// `Canceled`
  String get created_trip_status_canceled {
    return Intl.message(
      'Canceled',
      name: 'created_trip_status_canceled',
      desc: '',
      args: [],
    );
  }

  /// `Unknown`
  String get created_trip_status_unknown {
    return Intl.message(
      'Unknown',
      name: 'created_trip_status_unknown',
      desc: '',
      args: [],
    );
  }

  /// `You can cancel the trip anytime up to 1 hour before the departure time.\nCanceling after that may affect your integrity score.`
  String get created_trip_cancel_info {
    return Intl.message(
      'You can cancel the trip anytime up to 1 hour before the departure time.\nCanceling after that may affect your integrity score.',
      name: 'created_trip_cancel_info',
      desc: '',
      args: [],
    );
  }

  /// `Cancel trip`
  String get created_trip_canceled_trip {
    return Intl.message(
      'Cancel trip',
      name: 'created_trip_canceled_trip',
      desc: '',
      args: [],
    );
  }

  /// `Finish trip`
  String get created_trip_finish_trip {
    return Intl.message(
      'Finish trip',
      name: 'created_trip_finish_trip',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Cancellation`
  String get created_trip_confirm_cancel_title {
    return Intl.message(
      'Confirm Cancellation',
      name: 'created_trip_confirm_cancel_title',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to cancel this trip?`
  String get created_trip_confirm_cancel_content {
    return Intl.message(
      'Are you sure you want to cancel this trip?',
      name: 'created_trip_confirm_cancel_content',
      desc: '',
      args: [],
    );
  }

  /// `Confirm cancel`
  String get created_trip_confirm_cancel_button {
    return Intl.message(
      'Confirm cancel',
      name: 'created_trip_confirm_cancel_button',
      desc: '',
      args: [],
    );
  }

  /// `Invalid price`
  String get create_trip_price_not_valid {
    return Intl.message(
      'Invalid price',
      name: 'create_trip_price_not_valid',
      desc: '',
      args: [],
    );
  }

  /// `Price must be at least 50`
  String get create_trip_price_min_validation {
    return Intl.message(
      'Price must be at least 50',
      name: 'create_trip_price_min_validation',
      desc: '',
      args: [],
    );
  }

  /// `You currently have an active trip. Please cancel the current trip before creating a new one.`
  String get already_created_trip_error {
    return Intl.message(
      'You currently have an active trip. Please cancel the current trip before creating a new one.',
      name: 'already_created_trip_error',
      desc: '',
      args: [],
    );
  }

  /// `Departure time must be in the future.`
  String get departure_time_in_future {
    return Intl.message(
      'Departure time must be in the future.',
      name: 'departure_time_in_future',
      desc: '',
      args: [],
    );
  }

  /// `Your profile has been updated successfully.`
  String get driver_profile_update_success {
    return Intl.message(
      'Your profile has been updated successfully.',
      name: 'driver_profile_update_success',
      desc: '',
      args: [],
    );
  }

  /// `Your account has been successfully registered and is now under review.\nThe review process may take between 5 to 10 hours.\nThank you for your patience!`
  String get driver_register_success_message {
    return Intl.message(
      'Your account has been successfully registered and is now under review.\nThe review process may take between 5 to 10 hours.\nThank you for your patience!',
      name: 'driver_register_success_message',
      desc: '',
      args: [],
    );
  }

  /// `No Internet Connection`
  String get no_internet_title {
    return Intl.message(
      'No Internet Connection',
      name: 'no_internet_title',
      desc: '',
      args: [],
    );
  }

  /// `Please check your internet connection and try again.`
  String get no_internet_subtitle {
    return Intl.message(
      'Please check your internet connection and try again.',
      name: 'no_internet_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Try Again`
  String get no_internet_try_again {
    return Intl.message(
      'Try Again',
      name: 'no_internet_try_again',
      desc: '',
      args: [],
    );
  }

  /// `Troubleshooting Tips`
  String get no_internet_troubleshooting_tips {
    return Intl.message(
      'Troubleshooting Tips',
      name: 'no_internet_troubleshooting_tips',
      desc: '',
      args: [],
    );
  }

  /// `Check your WiFi or mobile data connection`
  String get no_internet_tip_wifi {
    return Intl.message(
      'Check your WiFi or mobile data connection',
      name: 'no_internet_tip_wifi',
      desc: '',
      args: [],
    );
  }

  /// `Make sure airplane mode is turned off`
  String get no_internet_tip_airplane {
    return Intl.message(
      'Make sure airplane mode is turned off',
      name: 'no_internet_tip_airplane',
      desc: '',
      args: [],
    );
  }

  /// `Try moving to an area with better signal`
  String get no_internet_tip_signal {
    return Intl.message(
      'Try moving to an area with better signal',
      name: 'no_internet_tip_signal',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get no_internet_retry {
    return Intl.message('Retry', name: 'no_internet_retry', desc: '', args: []);
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
