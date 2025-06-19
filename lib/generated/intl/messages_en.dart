// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(year) => "Enter a valid year between 2000 and ${year}.";

  static String m1(count) =>
      "${Intl.plural(count, zero: 'No seats', one: '1 seat', other: '${count} seats')}";

  static String m2(count) =>
      "${Intl.plural(count, zero: 'No trips', one: '1 trip', other: '${count} trips')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "account_created_message": MessageLookupByLibrary.simpleMessage(
      "Account Created Successfully!",
    ),
    "activities_opportunities": MessageLookupByLibrary.simpleMessage(
      "Activities & Opportunities",
    ),
    "age_validation": MessageLookupByLibrary.simpleMessage(
      "Age must be at least 5 years old",
    ),
    "already_have_account": MessageLookupByLibrary.simpleMessage(
      "Already have an account? ",
    ),
    "and": MessageLookupByLibrary.simpleMessage(" and "),
    "appName": MessageLookupByLibrary.simpleMessage("Aoun"),
    "book_trip_add_note": MessageLookupByLibrary.simpleMessage("Add Note"),
    "book_trip_continue_payment": MessageLookupByLibrary.simpleMessage(
      "Continue to Payment",
    ),
    "book_trip_meeting_point_desc": MessageLookupByLibrary.simpleMessage(
      "Select your preferred meeting point on the map",
    ),
    "book_trip_meeting_point_title": MessageLookupByLibrary.simpleMessage(
      "Meeting Point",
    ),
    "book_trip_note_hint": MessageLookupByLibrary.simpleMessage(
      "Add any special instructions or requirements",
    ),
    "book_trip_number_of_seats": MessageLookupByLibrary.simpleMessage(
      "Number of Seats",
    ),
    "book_trip_title": MessageLookupByLibrary.simpleMessage("Book Trip"),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "complete_your_information": MessageLookupByLibrary.simpleMessage(
      "Complete your information",
    ),
    "confirm_password": MessageLookupByLibrary.simpleMessage(
      "Confirm Password",
    ),
    "confirmed_successfully": MessageLookupByLibrary.simpleMessage(
      "Confirmed successfully!",
    ),
    "create_account": MessageLookupByLibrary.simpleMessage("Create Account"),
    "create_new_password": MessageLookupByLibrary.simpleMessage(
      "Create New Password",
    ),
    "create_password_instruction": MessageLookupByLibrary.simpleMessage(
      "Create a new password, please don\'t forget this one too.",
    ),
    "create_trip_air_conditioning": MessageLookupByLibrary.simpleMessage(
      "Air Conditioning",
    ),
    "create_trip_amenities_title": MessageLookupByLibrary.simpleMessage(
      "Amenities",
    ),
    "create_trip_available_seats_hint": MessageLookupByLibrary.simpleMessage(
      "Available Seats",
    ),
    "create_trip_available_seats_validation":
        MessageLookupByLibrary.simpleMessage("Please enter available seats"),
    "create_trip_child_seat": MessageLookupByLibrary.simpleMessage(
      "Child Seat",
    ),
    "create_trip_choose_map": MessageLookupByLibrary.simpleMessage(
      "Choose in map",
    ),
    "create_trip_confirm_button": MessageLookupByLibrary.simpleMessage(
      "Confirm publish trip",
    ),
    "create_trip_departure_time_hint": MessageLookupByLibrary.simpleMessage(
      "Departure Time",
    ),
    "create_trip_departure_time_validation":
        MessageLookupByLibrary.simpleMessage("Please select time"),
    "create_trip_distance_error": MessageLookupByLibrary.simpleMessage(
      "Must select distance",
    ),
    "create_trip_driver_notes_hint": MessageLookupByLibrary.simpleMessage(
      "Write your notes if you have any.",
    ),
    "create_trip_driver_notes_title": MessageLookupByLibrary.simpleMessage(
      "Driver Notes",
    ),
    "create_trip_driver_notes_validation": MessageLookupByLibrary.simpleMessage(
      "Please enter your note",
    ),
    "create_trip_free_water": MessageLookupByLibrary.simpleMessage(
      "Free Water",
    ),
    "create_trip_from_label": MessageLookupByLibrary.simpleMessage("From"),
    "create_trip_music": MessageLookupByLibrary.simpleMessage(
      "USB/AUX for Music",
    ),
    "create_trip_phone_charger": MessageLookupByLibrary.simpleMessage(
      "Phone Charger",
    ),
    "create_trip_price_hint": MessageLookupByLibrary.simpleMessage(
      "Price of Seat",
    ),
    "create_trip_price_validation": MessageLookupByLibrary.simpleMessage(
      "Please enter the price",
    ),
    "create_trip_title": MessageLookupByLibrary.simpleMessage("Create trip"),
    "create_trip_to_label": MessageLookupByLibrary.simpleMessage("To"),
    "create_trip_wifi": MessageLookupByLibrary.simpleMessage("Wi-Fi"),
    "date_of_birth": MessageLookupByLibrary.simpleMessage("Date of birth"),
    "did_not_receive_code": MessageLookupByLibrary.simpleMessage(
      "Didn\'t receive the code?",
    ),
    "driver_edit_profile_email_hint": MessageLookupByLibrary.simpleMessage(
      "Email",
    ),
    "driver_edit_profile_full_name_hint": MessageLookupByLibrary.simpleMessage(
      "Full name",
    ),
    "driver_edit_profile_title": MessageLookupByLibrary.simpleMessage(
      "Edit Profile",
    ),
    "driver_edit_profile_update_button": MessageLookupByLibrary.simpleMessage(
      "Update",
    ),
    "driver_image_choose_gallery": MessageLookupByLibrary.simpleMessage(
      "Choose from Gallery",
    ),
    "driver_image_take_picture": MessageLookupByLibrary.simpleMessage(
      "Take a picture",
    ),
    "driver_profile_cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "driver_profile_certificate_back": MessageLookupByLibrary.simpleMessage(
      "Back side of certificate",
    ),
    "driver_profile_edit_button": MessageLookupByLibrary.simpleMessage(
      "Edit profile",
    ),
    "driver_profile_overview_tab": MessageLookupByLibrary.simpleMessage(
      "Overview",
    ),
    "driver_profile_plate_number": MessageLookupByLibrary.simpleMessage(
      "Plate Number",
    ),
    "driver_profile_production_year": MessageLookupByLibrary.simpleMessage(
      "Production Year",
    ),
    "driver_profile_rating": MessageLookupByLibrary.simpleMessage("Rating"),
    "driver_profile_registration_certificate":
        MessageLookupByLibrary.simpleMessage(
          "Vehicle registration certificate",
        ),
    "driver_profile_satisfy": MessageLookupByLibrary.simpleMessage("Satisfy"),
    "driver_profile_seats": MessageLookupByLibrary.simpleMessage(
      "Number of Seats",
    ),
    "driver_profile_title": MessageLookupByLibrary.simpleMessage("Profile"),
    "driver_profile_vehicle_brand": MessageLookupByLibrary.simpleMessage(
      "Vehicle Brand",
    ),
    "driver_profile_vehicle_color": MessageLookupByLibrary.simpleMessage(
      "Vehicle Color",
    ),
    "driver_profile_vehicle_data_tab": MessageLookupByLibrary.simpleMessage(
      "Vehicle data",
    ),
    "driver_profile_vehicle_model": MessageLookupByLibrary.simpleMessage(
      "Vehicle Model",
    ),
    "driver_profile_vehicle_picture": MessageLookupByLibrary.simpleMessage(
      "Vehicle picture",
    ),
    "driver_register_brand_required": MessageLookupByLibrary.simpleMessage(
      "Please enter the vehicle brand.",
    ),
    "driver_register_certificate_back": MessageLookupByLibrary.simpleMessage(
      "Back side of certificate",
    ),
    "driver_register_color_required": MessageLookupByLibrary.simpleMessage(
      "Please enter the vehicle color.",
    ),
    "driver_register_criminal_record": MessageLookupByLibrary.simpleMessage(
      "Criminal Status Record",
    ),
    "driver_register_criminal_record_desc_1":
        MessageLookupByLibrary.simpleMessage(
          "Upload your Criminal Status Record issued within the last 3 months.",
        ),
    "driver_register_criminal_record_desc_2":
        MessageLookupByLibrary.simpleMessage(
          "Make sure all stamps and signatures are visible.",
        ),
    "driver_register_criminal_record_desc_3":
        MessageLookupByLibrary.simpleMessage(
          "Ensure the document is fully scanned and not cropped.",
        ),
    "driver_register_criminal_record_title":
        MessageLookupByLibrary.simpleMessage("Criminal Status Record"),
    "driver_register_documents_required": MessageLookupByLibrary.simpleMessage(
      "Please upload all required document images before continuing.",
    ),
    "driver_register_documents_title": MessageLookupByLibrary.simpleMessage(
      "Personal documents",
    ),
    "driver_register_expiration_date": MessageLookupByLibrary.simpleMessage(
      "Expiration date",
    ),
    "driver_register_id_back": MessageLookupByLibrary.simpleMessage(
      "Back Side of ID",
    ),
    "driver_register_id_back_desc_1": MessageLookupByLibrary.simpleMessage(
      "Upload the back side of your National ID.",
    ),
    "driver_register_id_back_desc_2": MessageLookupByLibrary.simpleMessage(
      "Ensure the address and serial number are readable.",
    ),
    "driver_register_id_back_desc_3": MessageLookupByLibrary.simpleMessage(
      "Use natural light and place the card on a flat surface.",
    ),
    "driver_register_id_back_title": MessageLookupByLibrary.simpleMessage(
      "National ID (Back)",
    ),
    "driver_register_id_digits_only": MessageLookupByLibrary.simpleMessage(
      "ID number must contain only digits.",
    ),
    "driver_register_id_front_desc_1": MessageLookupByLibrary.simpleMessage(
      "Upload a high-resolution image of the front side of your National ID.",
    ),
    "driver_register_id_front_desc_2": MessageLookupByLibrary.simpleMessage(
      "Make sure your name, photo, and ID number are clearly visible.",
    ),
    "driver_register_id_front_desc_3": MessageLookupByLibrary.simpleMessage(
      "Avoid shadows or reflections on the card.",
    ),
    "driver_register_id_front_title": MessageLookupByLibrary.simpleMessage(
      "National ID (Front)",
    ),
    "driver_register_id_length": MessageLookupByLibrary.simpleMessage(
      "ID number must be 14 digits long.",
    ),
    "driver_register_id_number": MessageLookupByLibrary.simpleMessage(
      "ID number",
    ),
    "driver_register_id_required": MessageLookupByLibrary.simpleMessage(
      "Please enter an ID number.",
    ),
    "driver_register_license_back_desc_1": MessageLookupByLibrary.simpleMessage(
      "Capture the back side of your valid driver\'s license.",
    ),
    "driver_register_license_back_desc_2": MessageLookupByLibrary.simpleMessage(
      "Make sure the document is not expired.",
    ),
    "driver_register_license_back_desc_3": MessageLookupByLibrary.simpleMessage(
      "Ensure all barcode and security features are visible.",
    ),
    "driver_register_license_back_title": MessageLookupByLibrary.simpleMessage(
      "Driver License (Back)",
    ),
    "driver_register_license_digits_only": MessageLookupByLibrary.simpleMessage(
      "License number must contain only digits.",
    ),
    "driver_register_license_front_desc_1":
        MessageLookupByLibrary.simpleMessage(
          "Capture the front side of your valid driver\'s license.",
        ),
    "driver_register_license_front_desc_2":
        MessageLookupByLibrary.simpleMessage(
          "Ensure the photo is not blurry and all text is readable.",
        ),
    "driver_register_license_front_desc_3":
        MessageLookupByLibrary.simpleMessage(
          "Do not cover any part of the license with your fingers.",
        ),
    "driver_register_license_front_title": MessageLookupByLibrary.simpleMessage(
      "Driver License (Front)",
    ),
    "driver_register_license_images_required":
        MessageLookupByLibrary.simpleMessage(
          "Please upload all required license images before continuing.",
        ),
    "driver_register_license_length": MessageLookupByLibrary.simpleMessage(
      "License number must be 14 digits long.",
    ),
    "driver_register_license_number": MessageLookupByLibrary.simpleMessage(
      "License number",
    ),
    "driver_register_license_number_required":
        MessageLookupByLibrary.simpleMessage("Please enter an License number."),
    "driver_register_license_selfie_desc_1":
        MessageLookupByLibrary.simpleMessage(
          "Take a selfie holding your license clearly next to your face.",
        ),
    "driver_register_license_selfie_desc_2": MessageLookupByLibrary.simpleMessage(
      "Make sure both your face and the license details are visible and clear.",
    ),
    "driver_register_license_selfie_desc_3":
        MessageLookupByLibrary.simpleMessage(
          "Do not use any filters or image enhancements.",
        ),
    "driver_register_license_selfie_title":
        MessageLookupByLibrary.simpleMessage("Selfie with License"),
    "driver_register_license_title": MessageLookupByLibrary.simpleMessage(
      "Driver License",
    ),
    "driver_register_login_title": MessageLookupByLibrary.simpleMessage(
      "Login information",
    ),
    "driver_register_model_required": MessageLookupByLibrary.simpleMessage(
      "Please enter the vehicle model.",
    ),
    "driver_register_national_id": MessageLookupByLibrary.simpleMessage(
      "National ID",
    ),
    "driver_register_next": MessageLookupByLibrary.simpleMessage("Next"),
    "driver_register_personal_info_title": MessageLookupByLibrary.simpleMessage(
      "Personal information",
    ),
    "driver_register_personal_picture": MessageLookupByLibrary.simpleMessage(
      "Personal picture",
    ),
    "driver_register_personal_picture_desc_1":
        MessageLookupByLibrary.simpleMessage(
          "Take a recent, high-quality photo of yourself.",
        ),
    "driver_register_personal_picture_desc_2":
        MessageLookupByLibrary.simpleMessage(
          "Your full face must be clearly visible, without sunglasses or hats.",
        ),
    "driver_register_personal_picture_desc_3":
        MessageLookupByLibrary.simpleMessage(
          "Use a plain background and good lighting.",
        ),
    "driver_register_personal_picture_title":
        MessageLookupByLibrary.simpleMessage("Personal Picture"),
    "driver_register_picture_required": MessageLookupByLibrary.simpleMessage(
      "Personal picture required",
    ),
    "driver_register_plate_digits": MessageLookupByLibrary.simpleMessage(
      "The license number should not have more than 4 digits.",
    ),
    "driver_register_plate_format": MessageLookupByLibrary.simpleMessage(
      "The license number must start with letters followed by digits.",
    ),
    "driver_register_plate_length": MessageLookupByLibrary.simpleMessage(
      "The license number should not exceed 7 characters.",
    ),
    "driver_register_plate_letters": MessageLookupByLibrary.simpleMessage(
      "The license number should not have more than 3 letters.",
    ),
    "driver_register_plate_number": MessageLookupByLibrary.simpleMessage(
      "Plate number",
    ),
    "driver_register_plate_required": MessageLookupByLibrary.simpleMessage(
      "Please enter license number",
    ),
    "driver_register_production_year": MessageLookupByLibrary.simpleMessage(
      "Production year",
    ),
    "driver_register_seats_number": MessageLookupByLibrary.simpleMessage(
      "Number seats",
    ),
    "driver_register_seats_range": MessageLookupByLibrary.simpleMessage(
      "Enter a valid number between 1 and 20.",
    ),
    "driver_register_seats_required": MessageLookupByLibrary.simpleMessage(
      "Please enter number of seats.",
    ),
    "driver_register_sign_in": MessageLookupByLibrary.simpleMessage("Sign In"),
    "driver_register_title": MessageLookupByLibrary.simpleMessage(
      "Create Driver account",
    ),
    "driver_register_vehicle_brand": MessageLookupByLibrary.simpleMessage(
      "Vehicle brand",
    ),
    "driver_register_vehicle_certificate": MessageLookupByLibrary.simpleMessage(
      "Vehicle registration certificate",
    ),
    "driver_register_vehicle_color": MessageLookupByLibrary.simpleMessage(
      "Vehicle color",
    ),
    "driver_register_vehicle_images_required":
        MessageLookupByLibrary.simpleMessage(
          "Please upload all required vehicle images before continuing.",
        ),
    "driver_register_vehicle_model": MessageLookupByLibrary.simpleMessage(
      "Vehicle model",
    ),
    "driver_register_vehicle_picture": MessageLookupByLibrary.simpleMessage(
      "Vehicle picture",
    ),
    "driver_register_vehicle_picture_desc_1":
        MessageLookupByLibrary.simpleMessage(
          "Upload a full side view of your vehicle.",
        ),
    "driver_register_vehicle_picture_desc_2":
        MessageLookupByLibrary.simpleMessage(
          "Ensure the license plate is visible.",
        ),
    "driver_register_vehicle_picture_desc_3":
        MessageLookupByLibrary.simpleMessage(
          "Vehicle must be clean and undamaged.",
        ),
    "driver_register_vehicle_picture_title":
        MessageLookupByLibrary.simpleMessage("Vehicle Picture"),
    "driver_register_vehicle_reg_back_desc_1":
        MessageLookupByLibrary.simpleMessage(
          "Upload the back page of your vehicle registration.",
        ),
    "driver_register_vehicle_reg_back_desc_2":
        MessageLookupByLibrary.simpleMessage(
          "Ensure the chassis number and expiry date are clear.",
        ),
    "driver_register_vehicle_reg_back_title":
        MessageLookupByLibrary.simpleMessage("Vehicle Registration (Back)"),
    "driver_register_vehicle_reg_front_desc_1":
        MessageLookupByLibrary.simpleMessage(
          "Upload the front page of the official vehicle registration certificate.",
        ),
    "driver_register_vehicle_reg_front_desc_2":
        MessageLookupByLibrary.simpleMessage(
          "All registration details must be visible and readable.",
        ),
    "driver_register_vehicle_reg_front_title":
        MessageLookupByLibrary.simpleMessage("Vehicle Registration (Front)"),
    "driver_register_vehicle_title": MessageLookupByLibrary.simpleMessage(
      "Vehicle information",
    ),
    "driver_register_year_range": m0,
    "driver_register_year_required": MessageLookupByLibrary.simpleMessage(
      "Please enter the production year.",
    ),
    "driver_safety_call_error": MessageLookupByLibrary.simpleMessage(
      "Can\'t make the call",
    ),
    "driver_safety_call_now": MessageLookupByLibrary.simpleMessage("Call Now"),
    "driver_safety_contact_support": MessageLookupByLibrary.simpleMessage(
      "Contact Support",
    ),
    "driver_safety_emergency_subtitle": MessageLookupByLibrary.simpleMessage(
      "Call emergency",
    ),
    "driver_safety_emergency_title": MessageLookupByLibrary.simpleMessage(
      "Emergency",
    ),
    "driver_safety_help_subtitle": MessageLookupByLibrary.simpleMessage(
      "We\'re here 24/7",
    ),
    "driver_safety_help_title": MessageLookupByLibrary.simpleMessage(
      "Need Help?",
    ),
    "driver_safety_tip_check_plate": MessageLookupByLibrary.simpleMessage(
      "Always check car plate",
    ),
    "driver_safety_tip_seatbelt": MessageLookupByLibrary.simpleMessage(
      "Wear your seatbelt",
    ),
    "driver_safety_tip_share_trip": MessageLookupByLibrary.simpleMessage(
      "Share your trip",
    ),
    "driver_safety_tips_title": MessageLookupByLibrary.simpleMessage(
      "Tips for Safe Travel",
    ),
    "driver_safety_title": MessageLookupByLibrary.simpleMessage("Safety"),
    "driver_safety_verification_subtitle": MessageLookupByLibrary.simpleMessage(
      "All drivers go through ID & vehicle checks",
    ),
    "driver_safety_verification_title": MessageLookupByLibrary.simpleMessage(
      "Driver Verification",
    ),
    "driver_settings_change_password": MessageLookupByLibrary.simpleMessage(
      "Change Password",
    ),
    "driver_settings_contact_us": MessageLookupByLibrary.simpleMessage(
      "Contact Us",
    ),
    "driver_settings_dark_mode": MessageLookupByLibrary.simpleMessage(
      "Dark mode",
    ),
    "driver_settings_language": MessageLookupByLibrary.simpleMessage(
      "Language",
    ),
    "driver_settings_language_arabic": MessageLookupByLibrary.simpleMessage(
      "العربية",
    ),
    "driver_settings_language_english": MessageLookupByLibrary.simpleMessage(
      "English",
    ),
    "driver_settings_logout": MessageLookupByLibrary.simpleMessage("Logout"),
    "driver_settings_privacy": MessageLookupByLibrary.simpleMessage(
      "Privacy Policy",
    ),
    "driver_settings_rate": MessageLookupByLibrary.simpleMessage(
      "Rate the App",
    ),
    "driver_settings_terms": MessageLookupByLibrary.simpleMessage(
      "Terms & Conditions",
    ),
    "driver_settings_theme": MessageLookupByLibrary.simpleMessage("Theme"),
    "driver_settings_title": MessageLookupByLibrary.simpleMessage(
      "Account settings",
    ),
    "egypt": MessageLookupByLibrary.simpleMessage("Egypt"),
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "email_already_exists": MessageLookupByLibrary.simpleMessage(
      "Email already exists.",
    ),
    "email_not_confirmed": MessageLookupByLibrary.simpleMessage(
      "Email not confirmed Please check your inbox.",
    ),
    "email_not_found": MessageLookupByLibrary.simpleMessage(
      "Email not found Please make sure the email is correct.",
    ),
    "enter_email": MessageLookupByLibrary.simpleMessage(
      "Please enter an email",
    ),
    "enter_password": MessageLookupByLibrary.simpleMessage(
      "Please enter a password",
    ),
    "enter_valid_email": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid email",
    ),
    "female": MessageLookupByLibrary.simpleMessage("Female"),
    "find_nearby_housing": MessageLookupByLibrary.simpleMessage(
      "Find Nearby Housing",
    ),
    "full_name": MessageLookupByLibrary.simpleMessage("Full Name"),
    "help_feedback_contact_support_answer":
        MessageLookupByLibrary.simpleMessage(
          "Tap \'Contact Support\' below or email us at support@aounapp.com.",
        ),
    "help_feedback_contact_support_question":
        MessageLookupByLibrary.simpleMessage("How to contact support?"),
    "help_feedback_contact_support_title": MessageLookupByLibrary.simpleMessage(
      "Contact Support",
    ),
    "help_feedback_faqs_title": MessageLookupByLibrary.simpleMessage("FAQs"),
    "help_feedback_how_to_use_answer": MessageLookupByLibrary.simpleMessage(
      "You can browse services, book rides, reserve housing, and apply for jobs directly from the main screen.",
    ),
    "help_feedback_how_to_use_question": MessageLookupByLibrary.simpleMessage(
      "How to use the app?",
    ),
    "help_feedback_language_theme_answer": MessageLookupByLibrary.simpleMessage(
      "Go to \'Settings\' → \'Language\' or \'Appearance\' and choose your preferred options.",
    ),
    "help_feedback_language_theme_question":
        MessageLookupByLibrary.simpleMessage(
          "How to change language or theme?",
        ),
    "help_feedback_report_problem_answer": MessageLookupByLibrary.simpleMessage(
      "Go to \'Help & Feedback\', choose \'Contact Support\' and describe your issue.",
    ),
    "help_feedback_report_problem_question":
        MessageLookupByLibrary.simpleMessage("How to report a problem?"),
    "help_feedback_safety_info_answer": MessageLookupByLibrary.simpleMessage(
      "Go to \'Safety\' from the main menu to read emergency contacts, safety tips, and driver verification.",
    ),
    "help_feedback_safety_info_question": MessageLookupByLibrary.simpleMessage(
      "Where to find safety info?",
    ),
    "help_feedback_support_email": MessageLookupByLibrary.simpleMessage(
      "support@aounapp.com",
    ),
    "help_feedback_support_phone": MessageLookupByLibrary.simpleMessage(
      "+20 101 3379 651",
    ),
    "help_feedback_title": MessageLookupByLibrary.simpleMessage(
      "Help & Feedback",
    ),
    "home_driver_balance_title": MessageLookupByLibrary.simpleMessage(
      "Balance Your",
    ),
    "home_driver_completed_trips": MessageLookupByLibrary.simpleMessage(
      "Completed trip count",
    ),
    "home_driver_create_trip": MessageLookupByLibrary.simpleMessage(
      "Create a trip",
    ),
    "home_driver_drawer_help": MessageLookupByLibrary.simpleMessage(
      "Help & feedback",
    ),
    "home_driver_drawer_history": MessageLookupByLibrary.simpleMessage(
      "History trips",
    ),
    "home_driver_drawer_profile": MessageLookupByLibrary.simpleMessage(
      "Profile",
    ),
    "home_driver_drawer_safety": MessageLookupByLibrary.simpleMessage("Safety"),
    "home_driver_drawer_settings": MessageLookupByLibrary.simpleMessage(
      "Settings",
    ),
    "home_driver_drawer_wallet": MessageLookupByLibrary.simpleMessage(
      "Wallet & Earnings",
    ),
    "home_driver_earnings_summary": MessageLookupByLibrary.simpleMessage(
      "Earnings summary",
    ),
    "home_driver_loading": MessageLookupByLibrary.simpleMessage("Loading"),
    "home_driver_recent_orders": MessageLookupByLibrary.simpleMessage(
      "Recent orders",
    ),
    "home_driver_trip_departure": MessageLookupByLibrary.simpleMessage(
      "Departure Time: ",
    ),
    "home_driver_trip_from": MessageLookupByLibrary.simpleMessage("From: "),
    "home_driver_trip_price": MessageLookupByLibrary.simpleMessage(
      "Price Per Seat: ",
    ),
    "home_driver_trip_seats": MessageLookupByLibrary.simpleMessage(
      "Available Seats: ",
    ),
    "home_driver_trip_to": MessageLookupByLibrary.simpleMessage("To: "),
    "intro_activities_text": MessageLookupByLibrary.simpleMessage(
      "Join student activities, attend sessions, or explore job opportunities alongside your studies.",
    ),
    "intro_activities_title": MessageLookupByLibrary.simpleMessage(
      "Activities & Opportunities",
    ),
    "intro_getstated_button": MessageLookupByLibrary.simpleMessage(
      "Get Started",
    ),
    "intro_housing_text": MessageLookupByLibrary.simpleMessage(
      "Discover housing near your university, browse offers, and book securely with ease.",
    ),
    "intro_housing_title": MessageLookupByLibrary.simpleMessage(
      "Find Nearby Housing",
    ),
    "intro_next_button": MessageLookupByLibrary.simpleMessage("Next"),
    "intro_transport_text": MessageLookupByLibrary.simpleMessage(
      "Join reliable trips, book your seat, pay securely, and skip commuting hassles.",
    ),
    "intro_transport_title": MessageLookupByLibrary.simpleMessage(
      "Safe & Easy Rides",
    ),
    "introduce_yourself": MessageLookupByLibrary.simpleMessage(
      "Please introduce yourself",
    ),
    "invalid_or_expired_otp": MessageLookupByLibrary.simpleMessage(
      "Invalid or expired OTP.",
    ),
    "israel": MessageLookupByLibrary.simpleMessage("Israel"),
    "joining_terms": MessageLookupByLibrary.simpleMessage(
      "Joining our app means you agree with our",
    ),
    "jordan": MessageLookupByLibrary.simpleMessage("Jordan"),
    "libya": MessageLookupByLibrary.simpleMessage("Libya"),
    "login_dont_have_account": MessageLookupByLibrary.simpleMessage(
      "Don\'t have an account? ",
    ),
    "login_enter_details": MessageLookupByLibrary.simpleMessage(
      "Enter your details below",
    ),
    "login_forgot_password": MessageLookupByLibrary.simpleMessage(
      "Forget your password?",
    ),
    "login_hint_search": MessageLookupByLibrary.simpleMessage(
      "Search by country name",
    ),
    "login_next": MessageLookupByLibrary.simpleMessage("Next"),
    "login_or_continue_with": MessageLookupByLibrary.simpleMessage(
      "Or continue with",
    ),
    "login_phone_number": MessageLookupByLibrary.simpleMessage("Phone Number"),
    "login_select_country": MessageLookupByLibrary.simpleMessage(
      "Select Country",
    ),
    "login_successful": MessageLookupByLibrary.simpleMessage(
      "Login successful",
    ),
    "login_welcome_back": MessageLookupByLibrary.simpleMessage("Welcome Back!"),
    "male": MessageLookupByLibrary.simpleMessage("Male"),
    "name_label": MessageLookupByLibrary.simpleMessage("Name"),
    "name_length_validation": MessageLookupByLibrary.simpleMessage(
      "Name must be at least 5 characters long",
    ),
    "no_internet_connection": MessageLookupByLibrary.simpleMessage(
      "No internet connection",
    ),
    "ok_AlertDialogt": MessageLookupByLibrary.simpleMessage("Ok"),
    "otp_verification_expired": MessageLookupByLibrary.simpleMessage(
      "OTP verification expired Please request a new OTP.",
    ),
    "palestine": MessageLookupByLibrary.simpleMessage("Palestine"),
    "password": MessageLookupByLibrary.simpleMessage("Password"),
    "password_complexity_validation": MessageLookupByLibrary.simpleMessage(
      "Password must contain at least one uppercase letter, one number, and one special character",
    ),
    "password_length_validation": MessageLookupByLibrary.simpleMessage(
      "Password must be at least 6 characters long",
    ),
    "password_reset_successful": MessageLookupByLibrary.simpleMessage(
      "Password reset successful You can now log in with your new password.",
    ),
    "passwords_do_not_match": MessageLookupByLibrary.simpleMessage(
      "Passwords do not match.",
    ),
    "payment_add_new_card": MessageLookupByLibrary.simpleMessage(
      "Add a new card",
    ),
    "payment_amount": MessageLookupByLibrary.simpleMessage("Pay: 24 EG"),
    "payment_cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "payment_card_tab": MessageLookupByLibrary.simpleMessage("Card"),
    "payment_done_button": MessageLookupByLibrary.simpleMessage("Done"),
    "payment_loading": MessageLookupByLibrary.simpleMessage("loading"),
    "payment_no_cards": MessageLookupByLibrary.simpleMessage(
      "No cards available",
    ),
    "payment_no_debit_card": MessageLookupByLibrary.simpleMessage(
      "No Debit Card Found",
    ),
    "payment_pay_again_button": MessageLookupByLibrary.simpleMessage(
      "Pay again",
    ),
    "payment_pay_from": MessageLookupByLibrary.simpleMessage("Pay from"),
    "payment_phone_hint": MessageLookupByLibrary.simpleMessage("01X XXXX XXXX"),
    "payment_phone_length": MessageLookupByLibrary.simpleMessage(
      "Phone number must be exactly 11 digits",
    ),
    "payment_phone_prefix": MessageLookupByLibrary.simpleMessage(
      "Phone number must start with 010, 011, 012, or 015",
    ),
    "payment_phone_required": MessageLookupByLibrary.simpleMessage(
      "Phone number is required",
    ),
    "payment_proceed": MessageLookupByLibrary.simpleMessage("Proceed"),
    "payment_receipt_title": MessageLookupByLibrary.simpleMessage(
      "Payment Receipt",
    ),
    "payment_seats_count": MessageLookupByLibrary.simpleMessage(
      "Number of seats",
    ),
    "payment_success_description": MessageLookupByLibrary.simpleMessage(
      "Your payment for Starbucks Coffee has been successfully done",
    ),
    "payment_success_message": MessageLookupByLibrary.simpleMessage(
      "You will now be redirected to complete the payment.\nA confirmation email has also been sent.",
    ),
    "payment_success_title": MessageLookupByLibrary.simpleMessage(
      "Payment Success",
    ),
    "payment_title": MessageLookupByLibrary.simpleMessage("Payment"),
    "payment_total_amount": MessageLookupByLibrary.simpleMessage(
      "Total amount",
    ),
    "payment_total_payment": MessageLookupByLibrary.simpleMessage(
      "Total Payment",
    ),
    "payment_total_seats": MessageLookupByLibrary.simpleMessage("Total Seats"),
    "payment_wallet_number": MessageLookupByLibrary.simpleMessage(
      "Wallet Number",
    ),
    "payment_wallet_tab": MessageLookupByLibrary.simpleMessage("Wallet"),
    "paymob_error_message": MessageLookupByLibrary.simpleMessage("error"),
    "paymob_payment_title": MessageLookupByLibrary.simpleMessage(
      "Paymob Payment",
    ),
    "phone_number_required": MessageLookupByLibrary.simpleMessage(
      "Phone number is required",
    ),
    "please_enter_name": MessageLookupByLibrary.simpleMessage(
      "Please enter your name",
    ),
    "privacy_policy": MessageLookupByLibrary.simpleMessage("Privacy Policy"),
    "registration_successful": MessageLookupByLibrary.simpleMessage(
      "Your account has been created successfully. Please check your email to activate your account before logging in.",
    ),
    "resend_code": MessageLookupByLibrary.simpleMessage("Resend Code"),
    "reset_password_description": MessageLookupByLibrary.simpleMessage(
      "We need your Email so we can send you the password reset code.",
    ),
    "reset_password_forget_password": MessageLookupByLibrary.simpleMessage(
      "Forget Password",
    ),
    "reset_password_send_code": MessageLookupByLibrary.simpleMessage(
      "Send Code",
    ),
    "reset_password_title": MessageLookupByLibrary.simpleMessage(
      "Reset your Password",
    ),
    "safe_easy_rides": MessageLookupByLibrary.simpleMessage(
      "Safe & Easy Rides",
    ),
    "saudi_Arabia": MessageLookupByLibrary.simpleMessage("Saudi Arabia"),
    "search_trip_active_passengers": MessageLookupByLibrary.simpleMessage(
      "Active passengers: ",
    ),
    "search_trip_all_trips": MessageLookupByLibrary.simpleMessage("All trips"),
    "search_trip_from_hint": MessageLookupByLibrary.simpleMessage("From"),
    "search_trip_from_label": MessageLookupByLibrary.simpleMessage("From: "),
    "search_trip_no_trips_message": MessageLookupByLibrary.simpleMessage(
      "No trips found for this destination.\nYou can set it as your active destination to get notified when a driver creates a trip.",
    ),
    "search_trip_set_active_destination": MessageLookupByLibrary.simpleMessage(
      "Set Active Destination",
    ),
    "search_trip_title": MessageLookupByLibrary.simpleMessage(
      "Enter your route",
    ),
    "search_trip_to_hint": MessageLookupByLibrary.simpleMessage("To"),
    "search_trip_to_label": MessageLookupByLibrary.simpleMessage("To: "),
    "seats": m1,
    "select_birthdate": MessageLookupByLibrary.simpleMessage(
      "Please select a Birthdate",
    ),
    "select_gender": MessageLookupByLibrary.simpleMessage(
      "Please select a gender",
    ),
    "select_route_confirm_location": MessageLookupByLibrary.simpleMessage(
      "Confirm this location",
    ),
    "select_route_search_hint": MessageLookupByLibrary.simpleMessage("Search"),
    "select_type_driver": MessageLookupByLibrary.simpleMessage("Driver"),
    "select_type_instruction": MessageLookupByLibrary.simpleMessage(
      "Choose how you want to continue",
    ),
    "select_type_passenger": MessageLookupByLibrary.simpleMessage("Passenger"),
    "select_type_sign_in": MessageLookupByLibrary.simpleMessage("Sign In"),
    "select_type_sign_up": MessageLookupByLibrary.simpleMessage("Sign Up"),
    "select_type_welcome": MessageLookupByLibrary.simpleMessage(
      "Welcome to Aoun",
    ),
    "sign_in": MessageLookupByLibrary.simpleMessage("Sign In"),
    "sign_up": MessageLookupByLibrary.simpleMessage("Sign Up"),
    "sudan": MessageLookupByLibrary.simpleMessage("Sudan"),
    "terms_of_use": MessageLookupByLibrary.simpleMessage(" Terms of Use "),
    "transport_add_new_card": MessageLookupByLibrary.simpleMessage(
      "Add New Card",
    ),
    "transport_delete": MessageLookupByLibrary.simpleMessage("Delete"),
    "transport_destination": MessageLookupByLibrary.simpleMessage("To"),
    "transport_latest_trips": MessageLookupByLibrary.simpleMessage(
      "Lasted trips",
    ),
    "transport_location_loading": MessageLookupByLibrary.simpleMessage(
      "Loading...",
    ),
    "transport_no_trips": MessageLookupByLibrary.simpleMessage(
      "No trips found.",
    ),
    "trip": m2,
    "trip_currency_symbol": MessageLookupByLibrary.simpleMessage("\$"),
    "trip_details_additional_info": MessageLookupByLibrary.simpleMessage(
      "Additional Info",
    ),
    "trip_details_amenities": MessageLookupByLibrary.simpleMessage("Amenities"),
    "trip_details_available_seats": MessageLookupByLibrary.simpleMessage(
      "Available Seats",
    ),
    "trip_details_basic_info": MessageLookupByLibrary.simpleMessage(
      "Basic Trip Info",
    ),
    "trip_details_book": MessageLookupByLibrary.simpleMessage("Book"),
    "trip_details_car_model": MessageLookupByLibrary.simpleMessage("Car Model"),
    "trip_details_created_at": MessageLookupByLibrary.simpleMessage(
      "Created At",
    ),
    "trip_details_delete_button": MessageLookupByLibrary.simpleMessage(
      "Delete Trip",
    ),
    "trip_details_departure_date": MessageLookupByLibrary.simpleMessage(
      "Departure date",
    ),
    "trip_details_departure_time": MessageLookupByLibrary.simpleMessage(
      "Departure Time",
    ),
    "trip_details_display_route": MessageLookupByLibrary.simpleMessage(
      "Display Route in map",
    ),
    "trip_details_driver_info": MessageLookupByLibrary.simpleMessage(
      "Driver Info",
    ),
    "trip_details_driver_notes": MessageLookupByLibrary.simpleMessage(
      "Driver Notes",
    ),
    "trip_details_duration": MessageLookupByLibrary.simpleMessage("Duration"),
    "trip_details_estimated_arrival": MessageLookupByLibrary.simpleMessage(
      "Estimated Arrival Time",
    ),
    "trip_details_estimated_distance": MessageLookupByLibrary.simpleMessage(
      "Estimated Distance",
    ),
    "trip_details_from": MessageLookupByLibrary.simpleMessage("From"),
    "trip_details_last_reviews": MessageLookupByLibrary.simpleMessage(
      "Last Reviews",
    ),
    "trip_details_license_plate": MessageLookupByLibrary.simpleMessage(
      "License Plate",
    ),
    "trip_details_mobile_number": MessageLookupByLibrary.simpleMessage(
      "Mobile number",
    ),
    "trip_details_pickup_point": MessageLookupByLibrary.simpleMessage(
      "Pickup Point",
    ),
    "trip_details_price_per_seat": MessageLookupByLibrary.simpleMessage(
      "Price Per Seat",
    ),
    "trip_details_rating_behavior": MessageLookupByLibrary.simpleMessage(
      "Behavior",
    ),
    "trip_details_rating_driving_skills": MessageLookupByLibrary.simpleMessage(
      "Driving skills",
    ),
    "trip_details_rating_pricing": MessageLookupByLibrary.simpleMessage(
      "Pricing",
    ),
    "trip_details_rating_punctuality": MessageLookupByLibrary.simpleMessage(
      "Punctuality",
    ),
    "trip_details_rating_title": MessageLookupByLibrary.simpleMessage("Rating"),
    "trip_details_seating_capacity": MessageLookupByLibrary.simpleMessage(
      "Seating Capacity",
    ),
    "trip_details_seats": MessageLookupByLibrary.simpleMessage("Seats"),
    "trip_details_seats_suffix": MessageLookupByLibrary.simpleMessage("Seats"),
    "trip_details_title": MessageLookupByLibrary.simpleMessage("Trip detail"),
    "trip_details_to": MessageLookupByLibrary.simpleMessage("To"),
    "trip_details_view_map": MessageLookupByLibrary.simpleMessage(
      "View in map",
    ),
    "trip_from_label": MessageLookupByLibrary.simpleMessage("From: "),
    "trip_to_label": MessageLookupByLibrary.simpleMessage("To: "),
    "user_profile_booking_history": MessageLookupByLibrary.simpleMessage(
      "Booking history",
    ),
    "user_profile_theme_dark": MessageLookupByLibrary.simpleMessage("Dark"),
    "user_profile_theme_light": MessageLookupByLibrary.simpleMessage("Light"),
    "user_profile_transactions": MessageLookupByLibrary.simpleMessage(
      "Transactions",
    ),
    "validation_invalid_number": MessageLookupByLibrary.simpleMessage(
      "Invalid number for this country.",
    ),
    "validation_phone_empty": MessageLookupByLibrary.simpleMessage(
      "Phone number required.",
    ),
    "validation_phone_long": MessageLookupByLibrary.simpleMessage(
      "Phone number too long.",
    ),
    "validation_phone_short": MessageLookupByLibrary.simpleMessage(
      "Phone number too short.",
    ),
    "validation_select_country": MessageLookupByLibrary.simpleMessage(
      "Select a country.",
    ),
    "validation_success": MessageLookupByLibrary.simpleMessage(
      "Validation successful.",
    ),
    "verification_instruction": MessageLookupByLibrary.simpleMessage(
      "You need to enter 6-digit code we send to your Email",
    ),
    "verification_title": MessageLookupByLibrary.simpleMessage(
      "Verification Code",
    ),
    "verify": MessageLookupByLibrary.simpleMessage("Verify"),
    "warning": MessageLookupByLibrary.simpleMessage("Warning"),
    "welcome_message": MessageLookupByLibrary.simpleMessage("Welcome to Aoun!"),
    "wrong_password_or_email": MessageLookupByLibrary.simpleMessage(
      "Wrong Password or Email",
    ),
  };
}
