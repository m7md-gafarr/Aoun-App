// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
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
  String get localeName => 'ar';

  static String m0(year) => "أدخل سنة صالحة بين 2000 و .";

  static String m1(count) =>
      "${Intl.plural(count, zero: 'لا يوجد مقاعد', one: 'مقعد', two: 'مقعدان', few: '${count} مقاعد', many: '${count} مقعد', other: '${count} مقعد')}";

  static String m2(count) =>
      "${Intl.plural(count, zero: 'لا رحلات', one: '1 رحلة', other: '${count} رحلات')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "account_created_message": MessageLookupByLibrary.simpleMessage(
      "تم إنشاء الحساب بنجاح!",
    ),
    "activities_opportunities": MessageLookupByLibrary.simpleMessage(
      "أنشطة وفرص",
    ),
    "age_validation": MessageLookupByLibrary.simpleMessage(
      "يجب أن يكون العمر 5 سنوات على الأقل",
    ),
    "already_have_account": MessageLookupByLibrary.simpleMessage(
      "هل لديك حساب بالفعل؟",
    ),
    "and": MessageLookupByLibrary.simpleMessage(" و "),
    "appName": MessageLookupByLibrary.simpleMessage("عون"),
    "book_trip_add_note": MessageLookupByLibrary.simpleMessage("إضافة ملاحظة"),
    "book_trip_continue_payment": MessageLookupByLibrary.simpleMessage(
      "المتابعة إلى الدفع",
    ),
    "book_trip_meeting_point_desc": MessageLookupByLibrary.simpleMessage(
      "اختر نقطة اللقاء المفضلة على الخريطة",
    ),
    "book_trip_meeting_point_title": MessageLookupByLibrary.simpleMessage(
      "نقطة اللقاء",
    ),
    "book_trip_note_hint": MessageLookupByLibrary.simpleMessage(
      "أضف أي تعليمات أو متطلبات خاصة",
    ),
    "book_trip_number_of_seats": MessageLookupByLibrary.simpleMessage(
      "عدد المقاعد",
    ),
    "book_trip_title": MessageLookupByLibrary.simpleMessage("حجز رحلة"),
    "cancel": MessageLookupByLibrary.simpleMessage("إغلاق"),
    "complete_your_information": MessageLookupByLibrary.simpleMessage(
      "أكمل معلوماتك",
    ),
    "confirm_password": MessageLookupByLibrary.simpleMessage(
      "تأكيد كلمة المرور",
    ),
    "confirmed_successfully": MessageLookupByLibrary.simpleMessage(
      "تم التأكيد بنجاح!",
    ),
    "create_account": MessageLookupByLibrary.simpleMessage("إنشاء حساب"),
    "create_new_password": MessageLookupByLibrary.simpleMessage(
      "إنشاء كلمة مرور جديدة",
    ),
    "create_password_instruction": MessageLookupByLibrary.simpleMessage(
      "قم بإنشاء كلمة مرور جديدة، من فضلك لا تنسَ هذه أيضًا.",
    ),
    "create_trip_air_conditioning": MessageLookupByLibrary.simpleMessage(
      "تكييف الهواء",
    ),
    "create_trip_amenities_title": MessageLookupByLibrary.simpleMessage(
      "المرافق",
    ),
    "create_trip_available_seats_hint": MessageLookupByLibrary.simpleMessage(
      "المقاعد المتاحة",
    ),
    "create_trip_available_seats_validation":
        MessageLookupByLibrary.simpleMessage("الرجاء إدخال المقاعد المتاحة"),
    "create_trip_child_seat": MessageLookupByLibrary.simpleMessage(
      "مقعد الأطفال",
    ),
    "create_trip_choose_map": MessageLookupByLibrary.simpleMessage(
      "اختر على الخريطة",
    ),
    "create_trip_confirm_button": MessageLookupByLibrary.simpleMessage(
      "تأكيد نشر الرحلة",
    ),
    "create_trip_departure_time_hint": MessageLookupByLibrary.simpleMessage(
      "وقت المغادرة",
    ),
    "create_trip_departure_time_validation":
        MessageLookupByLibrary.simpleMessage("الرجاء اختيار الوقت"),
    "create_trip_distance_error": MessageLookupByLibrary.simpleMessage(
      "يجب اختيار المسافة",
    ),
    "create_trip_driver_notes_hint": MessageLookupByLibrary.simpleMessage(
      "اكتب ملاحظاتك إذا كان لديك أي.",
    ),
    "create_trip_driver_notes_title": MessageLookupByLibrary.simpleMessage(
      "ملاحظات السائق",
    ),
    "create_trip_driver_notes_validation": MessageLookupByLibrary.simpleMessage(
      "الرجاء إدخال ملاحظتك",
    ),
    "create_trip_free_water": MessageLookupByLibrary.simpleMessage("ماء مجاني"),
    "create_trip_from_label": MessageLookupByLibrary.simpleMessage("من"),
    "create_trip_music": MessageLookupByLibrary.simpleMessage(
      "USB/AUX للموسيقى",
    ),
    "create_trip_phone_charger": MessageLookupByLibrary.simpleMessage(
      "شاحن الهاتف",
    ),
    "create_trip_price_hint": MessageLookupByLibrary.simpleMessage(
      "سعر المقعد",
    ),
    "create_trip_price_validation": MessageLookupByLibrary.simpleMessage(
      "الرجاء إدخال السعر",
    ),
    "create_trip_title": MessageLookupByLibrary.simpleMessage("إنشاء رحلة"),
    "create_trip_to_label": MessageLookupByLibrary.simpleMessage("إلى"),
    "create_trip_wifi": MessageLookupByLibrary.simpleMessage("واي فاي"),
    "date_of_birth": MessageLookupByLibrary.simpleMessage("تاريخ الميلاد"),
    "did_not_receive_code": MessageLookupByLibrary.simpleMessage(
      "لم تستلم الكود؟",
    ),
    "driver_edit_profile_email_hint": MessageLookupByLibrary.simpleMessage(
      "البريد الإلكتروني",
    ),
    "driver_edit_profile_full_name_hint": MessageLookupByLibrary.simpleMessage(
      "الاسم الكامل",
    ),
    "driver_edit_profile_title": MessageLookupByLibrary.simpleMessage(
      "تعديل الملف الشخصي",
    ),
    "driver_edit_profile_update_button": MessageLookupByLibrary.simpleMessage(
      "تحديث",
    ),
    "driver_image_choose_gallery": MessageLookupByLibrary.simpleMessage(
      "اختر من المعرض",
    ),
    "driver_image_take_picture": MessageLookupByLibrary.simpleMessage(
      "التقط صورة",
    ),
    "driver_profile_cancel": MessageLookupByLibrary.simpleMessage("الإلغاء"),
    "driver_profile_certificate_back": MessageLookupByLibrary.simpleMessage(
      "الوجه الخلفي للشهادة",
    ),
    "driver_profile_edit_button": MessageLookupByLibrary.simpleMessage(
      "تعديل الملف الشخصي",
    ),
    "driver_profile_overview_tab": MessageLookupByLibrary.simpleMessage(
      "نظرة عامة",
    ),
    "driver_profile_plate_number": MessageLookupByLibrary.simpleMessage(
      "رقم اللوحة",
    ),
    "driver_profile_production_year": MessageLookupByLibrary.simpleMessage(
      "سنة الإنتاج",
    ),
    "driver_profile_rating": MessageLookupByLibrary.simpleMessage("التقييم"),
    "driver_profile_registration_certificate":
        MessageLookupByLibrary.simpleMessage("شهادة تسجيل المركبة"),
    "driver_profile_satisfy": MessageLookupByLibrary.simpleMessage("الرضا"),
    "driver_profile_seats": MessageLookupByLibrary.simpleMessage("عدد المقاعد"),
    "driver_profile_title": MessageLookupByLibrary.simpleMessage(
      "الملف الشخصي",
    ),
    "driver_profile_vehicle_brand": MessageLookupByLibrary.simpleMessage(
      "ماركة المركبة",
    ),
    "driver_profile_vehicle_color": MessageLookupByLibrary.simpleMessage(
      "لون المركبة",
    ),
    "driver_profile_vehicle_data_tab": MessageLookupByLibrary.simpleMessage(
      "بيانات المركبة",
    ),
    "driver_profile_vehicle_model": MessageLookupByLibrary.simpleMessage(
      "طراز المركبة",
    ),
    "driver_profile_vehicle_picture": MessageLookupByLibrary.simpleMessage(
      "صورة المركبة",
    ),
    "driver_register_brand_required": MessageLookupByLibrary.simpleMessage(
      "يرجى إدخال ماركة المركبة.",
    ),
    "driver_register_certificate_back": MessageLookupByLibrary.simpleMessage(
      "الوجه الخلفي للشهادة",
    ),
    "driver_register_color_required": MessageLookupByLibrary.simpleMessage(
      "يرجى إدخال لون المركبة.",
    ),
    "driver_register_criminal_record": MessageLookupByLibrary.simpleMessage(
      "السجل الجنائي",
    ),
    "driver_register_criminal_record_desc_1":
        MessageLookupByLibrary.simpleMessage(
          "قم بتحميل سجلك الجنائي الصادر خلال آخر 3 أشهر.",
        ),
    "driver_register_criminal_record_desc_2":
        MessageLookupByLibrary.simpleMessage(
          "تأكد من وضوح جميع الأختام والتوقيعات.",
        ),
    "driver_register_criminal_record_desc_3":
        MessageLookupByLibrary.simpleMessage(
          "تأكد من مسح المستند بالكامل وعدم اقتصاصه.",
        ),
    "driver_register_criminal_record_title":
        MessageLookupByLibrary.simpleMessage("السجل الجنائي"),
    "driver_register_documents_required": MessageLookupByLibrary.simpleMessage(
      "يرجى تحميل جميع المستندات المطلوبة قبل المتابعة.",
    ),
    "driver_register_documents_title": MessageLookupByLibrary.simpleMessage(
      "المستندات الشخصية",
    ),
    "driver_register_expiration_date": MessageLookupByLibrary.simpleMessage(
      "تاريخ الانتهاء",
    ),
    "driver_register_id_back": MessageLookupByLibrary.simpleMessage(
      "الوجه الخلفي للبطاقة",
    ),
    "driver_register_id_back_desc_1": MessageLookupByLibrary.simpleMessage(
      "قم بتحميل صورة للوجه الخلفي من بطاقتك الوطنية.",
    ),
    "driver_register_id_back_desc_2": MessageLookupByLibrary.simpleMessage(
      "تأكد من وضوح العنوان والرقم التسلسلي.",
    ),
    "driver_register_id_back_desc_3": MessageLookupByLibrary.simpleMessage(
      "استخدم إضاءة طبيعية وضع البطاقة على سطح مستوٍ.",
    ),
    "driver_register_id_back_title": MessageLookupByLibrary.simpleMessage(
      "البطاقة الوطنية (الوجه الخلفي)",
    ),
    "driver_register_id_digits_only": MessageLookupByLibrary.simpleMessage(
      "يجب أن يحتوي رقم البطاقة على أرقام فقط.",
    ),
    "driver_register_id_front_desc_1": MessageLookupByLibrary.simpleMessage(
      "قم بتحميل صورة عالية الدقة للوجه الأمامي من بطاقتك الوطنية.",
    ),
    "driver_register_id_front_desc_2": MessageLookupByLibrary.simpleMessage(
      "تأكد من وضوح اسمك وصورتك ورقم البطاقة.",
    ),
    "driver_register_id_front_desc_3": MessageLookupByLibrary.simpleMessage(
      "تجنب الظلال أو الانعكاسات على البطاقة.",
    ),
    "driver_register_id_front_title": MessageLookupByLibrary.simpleMessage(
      "البطاقة الوطنية (الوجه الأمامي)",
    ),
    "driver_register_id_length": MessageLookupByLibrary.simpleMessage(
      "يجب أن يتكون رقم البطاقة من 14 رقمًا.",
    ),
    "driver_register_id_number": MessageLookupByLibrary.simpleMessage(
      "رقم البطاقة",
    ),
    "driver_register_id_required": MessageLookupByLibrary.simpleMessage(
      "يرجى إدخال رقم البطاقة.",
    ),
    "driver_register_license_back_desc_1": MessageLookupByLibrary.simpleMessage(
      "التقط صورة للوجه الخلفي من رخصة القيادة السارية.",
    ),
    "driver_register_license_back_desc_2": MessageLookupByLibrary.simpleMessage(
      "تأكد من أن المستند غير منتهي الصلاحية.",
    ),
    "driver_register_license_back_desc_3": MessageLookupByLibrary.simpleMessage(
      "تأكد من وضوح جميع الرموز الشريطية وميزات الأمان.",
    ),
    "driver_register_license_back_title": MessageLookupByLibrary.simpleMessage(
      "رخصة القيادة (الوجه الخلفي)",
    ),
    "driver_register_license_digits_only": MessageLookupByLibrary.simpleMessage(
      "يجب أن يحتوي رقم الرخصة على أرقام فقط.",
    ),
    "driver_register_license_front_desc_1":
        MessageLookupByLibrary.simpleMessage(
          "التقط صورة للوجه الأمامي من رخصة القيادة السارية.",
        ),
    "driver_register_license_front_desc_2":
        MessageLookupByLibrary.simpleMessage(
          "تأكد من أن الصورة غير ضبابية وأن جميع النصوص مقروءة.",
        ),
    "driver_register_license_front_desc_3":
        MessageLookupByLibrary.simpleMessage(
          "لا تغطي أي جزء من الرخصة بأصابعك.",
        ),
    "driver_register_license_front_title": MessageLookupByLibrary.simpleMessage(
      "رخصة القيادة (الوجه الأمامي)",
    ),
    "driver_register_license_images_required":
        MessageLookupByLibrary.simpleMessage(
          "يرجى تحميل جميع صور الرخصة المطلوبة قبل المتابعة.",
        ),
    "driver_register_license_length": MessageLookupByLibrary.simpleMessage(
      "يجب أن يتكون رقم الرخصة من 14 رقمًا.",
    ),
    "driver_register_license_number": MessageLookupByLibrary.simpleMessage(
      "رقم الرخصة",
    ),
    "driver_register_license_number_required":
        MessageLookupByLibrary.simpleMessage("يرجى إدخال رقم الرخصة."),
    "driver_register_license_selfie_desc_1":
        MessageLookupByLibrary.simpleMessage(
          "التقط صورة سيلفي وأنت تحمل رخصتك بوضوح بجانب وجهك.",
        ),
    "driver_register_license_selfie_desc_2":
        MessageLookupByLibrary.simpleMessage(
          "تأكد من وضوح وجهك وتفاصيل الرخصة.",
        ),
    "driver_register_license_selfie_desc_3":
        MessageLookupByLibrary.simpleMessage(
          "لا تستخدم أي فلاتر أو تحسينات للصورة.",
        ),
    "driver_register_license_selfie_title":
        MessageLookupByLibrary.simpleMessage("سيلفي مع الرخصة"),
    "driver_register_license_title": MessageLookupByLibrary.simpleMessage(
      "رخصة القيادة",
    ),
    "driver_register_login_title": MessageLookupByLibrary.simpleMessage(
      "معلومات تسجيل الدخول",
    ),
    "driver_register_model_required": MessageLookupByLibrary.simpleMessage(
      "يرجى إدخال طراز المركبة.",
    ),
    "driver_register_national_id": MessageLookupByLibrary.simpleMessage(
      "البطاقة الوطنية",
    ),
    "driver_register_next": MessageLookupByLibrary.simpleMessage("التالي"),
    "driver_register_personal_info_title": MessageLookupByLibrary.simpleMessage(
      "المعلومات الشخصية",
    ),
    "driver_register_personal_picture": MessageLookupByLibrary.simpleMessage(
      "الصورة الشخصية",
    ),
    "driver_register_personal_picture_desc_1":
        MessageLookupByLibrary.simpleMessage(
          "التقط صورة حديثة وعالية الجودة لنفسك.",
        ),
    "driver_register_personal_picture_desc_2":
        MessageLookupByLibrary.simpleMessage(
          "يجب أن يكون وجهك بالكامل واضحًا، بدون نظارات شمسية أو قبعات.",
        ),
    "driver_register_personal_picture_desc_3":
        MessageLookupByLibrary.simpleMessage("استخدم خلفية بسيطة وإضاءة جيدة."),
    "driver_register_personal_picture_title":
        MessageLookupByLibrary.simpleMessage("الصورة الشخصية"),
    "driver_register_picture_required": MessageLookupByLibrary.simpleMessage(
      "الصورة الشخصية مطلوبة",
    ),
    "driver_register_plate_digits": MessageLookupByLibrary.simpleMessage(
      "يجب ألا يحتوي رقم اللوحة على أكثر من 4 أرقام.",
    ),
    "driver_register_plate_format": MessageLookupByLibrary.simpleMessage(
      "يجب أن يبدأ رقم اللوحة بأحرف متبوعة بأرقام.",
    ),
    "driver_register_plate_length": MessageLookupByLibrary.simpleMessage(
      "يجب ألا يتجاوز رقم اللوحة 7 أحرف.",
    ),
    "driver_register_plate_letters": MessageLookupByLibrary.simpleMessage(
      "يجب ألا يحتوي رقم اللوحة على أكثر من 3 أحرف.",
    ),
    "driver_register_plate_number": MessageLookupByLibrary.simpleMessage(
      "رقم اللوحة",
    ),
    "driver_register_plate_required": MessageLookupByLibrary.simpleMessage(
      "يرجى إدخال رقم اللوحة",
    ),
    "driver_register_production_year": MessageLookupByLibrary.simpleMessage(
      "سنة الإنتاج",
    ),
    "driver_register_seats_number": MessageLookupByLibrary.simpleMessage(
      "عدد المقاعد",
    ),
    "driver_register_seats_range": MessageLookupByLibrary.simpleMessage(
      "أدخل رقمًا صالحًا بين 1 و 20.",
    ),
    "driver_register_seats_required": MessageLookupByLibrary.simpleMessage(
      "يرجى إدخال عدد المقاعد.",
    ),
    "driver_register_sign_in": MessageLookupByLibrary.simpleMessage(
      "تسجيل الدخول",
    ),
    "driver_register_title": MessageLookupByLibrary.simpleMessage(
      "إنشاء حساب سائق",
    ),
    "driver_register_vehicle_brand": MessageLookupByLibrary.simpleMessage(
      "ماركة المركبة",
    ),
    "driver_register_vehicle_certificate": MessageLookupByLibrary.simpleMessage(
      "شهادة تسجيل المركبة",
    ),
    "driver_register_vehicle_color": MessageLookupByLibrary.simpleMessage(
      "لون المركبة",
    ),
    "driver_register_vehicle_images_required":
        MessageLookupByLibrary.simpleMessage(
          "يرجى تحميل جميع صور المركبة المطلوبة قبل المتابعة.",
        ),
    "driver_register_vehicle_model": MessageLookupByLibrary.simpleMessage(
      "طراز المركبة",
    ),
    "driver_register_vehicle_picture": MessageLookupByLibrary.simpleMessage(
      "صورة المركبة",
    ),
    "driver_register_vehicle_picture_desc_1":
        MessageLookupByLibrary.simpleMessage(
          "قم بتحميل صورة جانبية كاملة لمركبتك.",
        ),
    "driver_register_vehicle_picture_desc_2":
        MessageLookupByLibrary.simpleMessage("تأكد من وضوح لوحة الترخيص."),
    "driver_register_vehicle_picture_desc_3":
        MessageLookupByLibrary.simpleMessage(
          "يجب أن تكون المركبة نظيفة وغير متضررة.",
        ),
    "driver_register_vehicle_picture_title":
        MessageLookupByLibrary.simpleMessage("صورة المركبة"),
    "driver_register_vehicle_reg_back_desc_1":
        MessageLookupByLibrary.simpleMessage(
          "قم بتحميل الصفحة الخلفية من شهادة تسجيل مركبتك.",
        ),
    "driver_register_vehicle_reg_back_desc_2":
        MessageLookupByLibrary.simpleMessage(
          "تأكد من وضوح رقم الهيكل وتاريخ الانتهاء.",
        ),
    "driver_register_vehicle_reg_back_title":
        MessageLookupByLibrary.simpleMessage(
          "شهادة تسجيل المركبة (الوجه الخلفي)",
        ),
    "driver_register_vehicle_reg_front_desc_1":
        MessageLookupByLibrary.simpleMessage(
          "قم بتحميل الصفحة الأمامية من شهادة تسجيل المركبة الرسمية.",
        ),
    "driver_register_vehicle_reg_front_desc_2":
        MessageLookupByLibrary.simpleMessage(
          "يجب أن تكون جميع تفاصيل التسجيل واضحة ومقروءة.",
        ),
    "driver_register_vehicle_reg_front_title":
        MessageLookupByLibrary.simpleMessage(
          "شهادة تسجيل المركبة (الوجه الأمامي)",
        ),
    "driver_register_vehicle_title": MessageLookupByLibrary.simpleMessage(
      "معلومات المركبة",
    ),
    "driver_register_year_range": m0,
    "driver_register_year_required": MessageLookupByLibrary.simpleMessage(
      "يرجى إدخال سنة الإنتاج.",
    ),
    "driver_safety_call_error": MessageLookupByLibrary.simpleMessage(
      "لا يمكن إجراء المكالمة",
    ),
    "driver_safety_call_now": MessageLookupByLibrary.simpleMessage("اتصل الآن"),
    "driver_safety_contact_support": MessageLookupByLibrary.simpleMessage(
      "اتصل بالدعم",
    ),
    "driver_safety_emergency_subtitle": MessageLookupByLibrary.simpleMessage(
      "اتصل بالطوارئ",
    ),
    "driver_safety_emergency_title": MessageLookupByLibrary.simpleMessage(
      "الطوارئ",
    ),
    "driver_safety_help_subtitle": MessageLookupByLibrary.simpleMessage(
      "نحن هنا على مدار الساعة طوال أيام الأسبوع",
    ),
    "driver_safety_help_title": MessageLookupByLibrary.simpleMessage(
      "تحتاج مساعدة؟",
    ),
    "driver_safety_tip_check_plate": MessageLookupByLibrary.simpleMessage(
      "تحقق دائمًا من رقم اللوحة",
    ),
    "driver_safety_tip_seatbelt": MessageLookupByLibrary.simpleMessage(
      "ارتدِ حزام الأمان",
    ),
    "driver_safety_tip_share_trip": MessageLookupByLibrary.simpleMessage(
      "شارك رحلتك",
    ),
    "driver_safety_tips_title": MessageLookupByLibrary.simpleMessage(
      "نصائح للسفر الآمن",
    ),
    "driver_safety_title": MessageLookupByLibrary.simpleMessage("السلامة"),
    "driver_safety_verification_subtitle": MessageLookupByLibrary.simpleMessage(
      "جميع السائقين يخضعون للتحقق من الهوية والمركبة",
    ),
    "driver_safety_verification_title": MessageLookupByLibrary.simpleMessage(
      "التحقق من السائق",
    ),
    "driver_settings_change_password": MessageLookupByLibrary.simpleMessage(
      "تغيير كلمة المرور",
    ),
    "driver_settings_contact_us": MessageLookupByLibrary.simpleMessage(
      "اتصل بنا",
    ),
    "driver_settings_dark_mode": MessageLookupByLibrary.simpleMessage(
      "الوضع الداكن",
    ),
    "driver_settings_language": MessageLookupByLibrary.simpleMessage("اللغة"),
    "driver_settings_language_arabic": MessageLookupByLibrary.simpleMessage(
      "العربية",
    ),
    "driver_settings_language_english": MessageLookupByLibrary.simpleMessage(
      "English",
    ),
    "driver_settings_logout": MessageLookupByLibrary.simpleMessage(
      "تسجيل الخروج",
    ),
    "driver_settings_privacy": MessageLookupByLibrary.simpleMessage(
      "سياسة الخصوصية",
    ),
    "driver_settings_rate": MessageLookupByLibrary.simpleMessage("قيم التطبيق"),
    "driver_settings_terms": MessageLookupByLibrary.simpleMessage(
      "الشروط والأحكام",
    ),
    "driver_settings_theme": MessageLookupByLibrary.simpleMessage("المظهر"),
    "driver_settings_title": MessageLookupByLibrary.simpleMessage(
      "إعدادات الحساب",
    ),
    "egypt": MessageLookupByLibrary.simpleMessage("مصر"),
    "email": MessageLookupByLibrary.simpleMessage("البريد الإلكتروني"),
    "email_already_exists": MessageLookupByLibrary.simpleMessage(
      "البريد الإلكتروني موجود بالفعل.",
    ),
    "email_not_confirmed": MessageLookupByLibrary.simpleMessage(
      "البريد الإلكتروني غير مؤكد يرجى التحقق من صندوق الوارد.",
    ),
    "email_not_found": MessageLookupByLibrary.simpleMessage(
      "البريد الإلكتروني غير موجود يرجى التأكد من صحة البريد الإلكتروني.",
    ),
    "enter_email": MessageLookupByLibrary.simpleMessage(
      "يرجى إدخال بريد إلكتروني",
    ),
    "enter_password": MessageLookupByLibrary.simpleMessage(
      "يرجى إدخال كلمة مرور",
    ),
    "enter_valid_email": MessageLookupByLibrary.simpleMessage(
      "يرجى إدخال بريد إلكتروني صالح",
    ),
    "female": MessageLookupByLibrary.simpleMessage("أنثى"),
    "find_nearby_housing": MessageLookupByLibrary.simpleMessage(
      "ابحث عن سكن قريب",
    ),
    "full_name": MessageLookupByLibrary.simpleMessage("الاسم الكامل"),
    "help_feedback_contact_support_answer": MessageLookupByLibrary.simpleMessage(
      "انقر على \'اتصل بالدعم\' أدناه أو راسلنا على البريد الإلكتروني support@aounapp.com.",
    ),
    "help_feedback_contact_support_question":
        MessageLookupByLibrary.simpleMessage("كيفية الاتصال بالدعم؟"),
    "help_feedback_contact_support_title": MessageLookupByLibrary.simpleMessage(
      "اتصل بالدعم",
    ),
    "help_feedback_faqs_title": MessageLookupByLibrary.simpleMessage(
      "الأسئلة الشائعة",
    ),
    "help_feedback_how_to_use_answer": MessageLookupByLibrary.simpleMessage(
      "يمكنك تصفح الخدمات، حجز الرحلات، حجز السكن، والتقدم للوظائف مباشرة من الشاشة الرئيسية.",
    ),
    "help_feedback_how_to_use_question": MessageLookupByLibrary.simpleMessage(
      "كيفية استخدام التطبيق؟",
    ),
    "help_feedback_language_theme_answer": MessageLookupByLibrary.simpleMessage(
      "انتقل إلى \'الإعدادات\' → \'اللغة\' أو \'المظهر\' واختر الخيارات المفضلة لديك.",
    ),
    "help_feedback_language_theme_question":
        MessageLookupByLibrary.simpleMessage("كيفية تغيير اللغة أو المظهر؟"),
    "help_feedback_report_problem_answer": MessageLookupByLibrary.simpleMessage(
      "انتقل إلى \'المساعدة والتعليقات\'، اختر \'اتصل بالدعم\' وصف مشكلتك.",
    ),
    "help_feedback_report_problem_question":
        MessageLookupByLibrary.simpleMessage("كيفية الإبلاغ عن مشكلة؟"),
    "help_feedback_safety_info_answer": MessageLookupByLibrary.simpleMessage(
      "انتقل إلى \'السلامة\' من القائمة الرئيسية لقراءة جهات الاتصال في حالات الطوارئ، ونصائح السلامة، والتحقق من السائق.",
    ),
    "help_feedback_safety_info_question": MessageLookupByLibrary.simpleMessage(
      "أين يمكنني العثور على معلومات السلامة؟",
    ),
    "help_feedback_support_email": MessageLookupByLibrary.simpleMessage(
      "support@aounapp.com",
    ),
    "help_feedback_support_phone": MessageLookupByLibrary.simpleMessage(
      "+20 101 3379 651",
    ),
    "help_feedback_title": MessageLookupByLibrary.simpleMessage(
      "المساعدة والتعليقات",
    ),
    "home_driver_balance_title": MessageLookupByLibrary.simpleMessage("رصيدك"),
    "home_driver_completed_trips": MessageLookupByLibrary.simpleMessage(
      "عدد الرحلات المكتملة",
    ),
    "home_driver_create_trip": MessageLookupByLibrary.simpleMessage(
      "إنشاء رحلة",
    ),
    "home_driver_drawer_help": MessageLookupByLibrary.simpleMessage(
      "المساعدة والتعليقات",
    ),
    "home_driver_drawer_history": MessageLookupByLibrary.simpleMessage(
      "سجل الرحلات",
    ),
    "home_driver_drawer_profile": MessageLookupByLibrary.simpleMessage(
      "الملف الشخصي",
    ),
    "home_driver_drawer_safety": MessageLookupByLibrary.simpleMessage(
      "السلامة",
    ),
    "home_driver_drawer_settings": MessageLookupByLibrary.simpleMessage(
      "الإعدادات",
    ),
    "home_driver_drawer_wallet": MessageLookupByLibrary.simpleMessage(
      "المحفظة والأرباح",
    ),
    "home_driver_earnings_summary": MessageLookupByLibrary.simpleMessage(
      "ملخص الأرباح",
    ),
    "home_driver_loading": MessageLookupByLibrary.simpleMessage("جاري التحميل"),
    "home_driver_recent_orders": MessageLookupByLibrary.simpleMessage(
      "الطلبات الأخيرة",
    ),
    "home_driver_trip_departure": MessageLookupByLibrary.simpleMessage(
      "وقت المغادرة: ",
    ),
    "home_driver_trip_from": MessageLookupByLibrary.simpleMessage("من: "),
    "home_driver_trip_price": MessageLookupByLibrary.simpleMessage(
      "سعر المقعد: ",
    ),
    "home_driver_trip_seats": MessageLookupByLibrary.simpleMessage(
      "المقاعد المتاحة: ",
    ),
    "home_driver_trip_to": MessageLookupByLibrary.simpleMessage("إلى: "),
    "intro_activities_text": MessageLookupByLibrary.simpleMessage(
      "شارك في الأنشطة الطلابية، احضر جلسات تعليمية، أو استكشف فرص العمل بجانب دراستك.",
    ),
    "intro_activities_title": MessageLookupByLibrary.simpleMessage(
      "أنشطة وفرص للطلاب",
    ),
    "intro_getstated_button": MessageLookupByLibrary.simpleMessage("هيا للبدء"),
    "intro_housing_text": MessageLookupByLibrary.simpleMessage(
      "اكتشف السكن بالقرب من جامعتك، تصفح العروض، واحجز بسهولة وأمان.",
    ),
    "intro_housing_title": MessageLookupByLibrary.simpleMessage(
      "ابحث عن السكن القريب",
    ),
    "intro_next_button": MessageLookupByLibrary.simpleMessage("التالى"),
    "intro_transport_text": MessageLookupByLibrary.simpleMessage(
      "انضم إلى رحلات موثوقة، احجز مقعدك، ادفع بأمان، وتجنب عناء التنقل اليومي.",
    ),
    "intro_transport_title": MessageLookupByLibrary.simpleMessage(
      "رحلات آمنة وسهلة",
    ),
    "introduce_yourself": MessageLookupByLibrary.simpleMessage(
      "يرجى تقديم نفسك",
    ),
    "invalid_or_expired_otp": MessageLookupByLibrary.simpleMessage(
      "رمز التحقق غير صالح أو منتهي الصلاحية.",
    ),
    "israel": MessageLookupByLibrary.simpleMessage("إسرائيل"),
    "joining_terms": MessageLookupByLibrary.simpleMessage(
      "بالانضمام إلى تطبيقنا، فإنك توافق على",
    ),
    "jordan": MessageLookupByLibrary.simpleMessage("الأردن"),
    "libya": MessageLookupByLibrary.simpleMessage("ليبيا"),
    "login_dont_have_account": MessageLookupByLibrary.simpleMessage(
      " ليس لديك حساب؟",
    ),
    "login_enter_details": MessageLookupByLibrary.simpleMessage(
      "أدخل بياناتك أدناه",
    ),
    "login_forgot_password": MessageLookupByLibrary.simpleMessage(
      "هل نسيت كلمة المرور؟",
    ),
    "login_hint_search": MessageLookupByLibrary.simpleMessage(
      "ابحث باسم الدولة",
    ),
    "login_next": MessageLookupByLibrary.simpleMessage("التالى"),
    "login_or_continue_with": MessageLookupByLibrary.simpleMessage(
      "أو المتابعة باستخدام",
    ),
    "login_phone_number": MessageLookupByLibrary.simpleMessage("رقم الهاتف"),
    "login_select_country": MessageLookupByLibrary.simpleMessage("اختر الدولة"),
    "login_successful": MessageLookupByLibrary.simpleMessage(
      "تم تسجيل الدخول بنجاح",
    ),
    "login_welcome_back": MessageLookupByLibrary.simpleMessage(
      "مرحبًا بعودتك!",
    ),
    "male": MessageLookupByLibrary.simpleMessage("ذكر"),
    "name_label": MessageLookupByLibrary.simpleMessage("الاسم"),
    "name_length_validation": MessageLookupByLibrary.simpleMessage(
      "يجب أن يتكون الاسم من 5 أحرف على الأقل",
    ),
    "no_internet_connection": MessageLookupByLibrary.simpleMessage(
      "لا يوجد اتصال بالإنترنت",
    ),
    "ok_AlertDialogt": MessageLookupByLibrary.simpleMessage("حسنا"),
    "otp_verification_expired": MessageLookupByLibrary.simpleMessage(
      "انتهت صلاحية التحقق برمز OTP يرجى طلب رمز جديد.",
    ),
    "palestine": MessageLookupByLibrary.simpleMessage("فلسطين"),
    "password": MessageLookupByLibrary.simpleMessage("كلمة المرور"),
    "password_complexity_validation": MessageLookupByLibrary.simpleMessage(
      "يجب أن تحتوي كلمة المرور على حرف كبير واحد على الأقل، ورقم واحد، ورمز خاص واحد",
    ),
    "password_length_validation": MessageLookupByLibrary.simpleMessage(
      "يجب أن تتكون كلمة المرور من 6 أحرف على الأقل",
    ),
    "password_reset_successful": MessageLookupByLibrary.simpleMessage(
      "تم إعادة تعيين كلمة المرور بنجاح يمكنك الآن تسجيل الدخول باستخدام كلمة المرور الجديدة.",
    ),
    "passwords_do_not_match": MessageLookupByLibrary.simpleMessage(
      "كلمات المرور غير متطابقة.",
    ),
    "payment_add_new_card": MessageLookupByLibrary.simpleMessage(
      "إضافة بطاقة جديدة",
    ),
    "payment_amount": MessageLookupByLibrary.simpleMessage("ادفع: 24 جنيه"),
    "payment_cancel": MessageLookupByLibrary.simpleMessage("إلغاء"),
    "payment_card_tab": MessageLookupByLibrary.simpleMessage("البطاقة"),
    "payment_loading": MessageLookupByLibrary.simpleMessage("جاري التحميل"),
    "payment_no_cards": MessageLookupByLibrary.simpleMessage(
      "لا توجد بطاقات متاحة",
    ),
    "payment_no_debit_card": MessageLookupByLibrary.simpleMessage(
      "لم يتم العثور على بطاقة خصم",
    ),
    "payment_pay_from": MessageLookupByLibrary.simpleMessage("ادفع من"),
    "payment_phone_hint": MessageLookupByLibrary.simpleMessage("01X XXXX XXXX"),
    "payment_phone_length": MessageLookupByLibrary.simpleMessage(
      "يجب أن يتكون رقم الهاتف من 11 رقمًا بالضبط",
    ),
    "payment_phone_prefix": MessageLookupByLibrary.simpleMessage(
      "يجب أن يبدأ رقم الهاتف بـ 010 أو 011 أو 012 أو 015",
    ),
    "payment_phone_required": MessageLookupByLibrary.simpleMessage(
      "رقم الهاتف مطلوب",
    ),
    "payment_proceed": MessageLookupByLibrary.simpleMessage("متابعة"),
    "payment_seats_count": MessageLookupByLibrary.simpleMessage("عدد المقاعد"),
    "payment_success_message": MessageLookupByLibrary.simpleMessage(
      "سيتم توجيهك الآن لإكمال عملية الدفع.\nتم إرسال بريد إلكتروني للتأكيد أيضًا.",
    ),
    "payment_success_title": MessageLookupByLibrary.simpleMessage(
      "تم بدء الدفع بنجاح",
    ),
    "payment_title": MessageLookupByLibrary.simpleMessage("الدفع"),
    "payment_total_amount": MessageLookupByLibrary.simpleMessage(
      "المبلغ الإجمالي",
    ),
    "payment_wallet_number": MessageLookupByLibrary.simpleMessage(
      "رقم المحفظة",
    ),
    "payment_wallet_tab": MessageLookupByLibrary.simpleMessage("المحفظة"),
    "phone_number_required": MessageLookupByLibrary.simpleMessage(
      "رقم الهاتف مطلوب",
    ),
    "please_enter_name": MessageLookupByLibrary.simpleMessage(
      "من فضلك، أدخل اسمك",
    ),
    "privacy_policy": MessageLookupByLibrary.simpleMessage("سياسة الخصوصية"),
    "registration_successful": MessageLookupByLibrary.simpleMessage(
      "تم إنشاء حسابك بنجاح\nيرجى التحقق من بريدك الإلكتروني لتفعيل حسابك قبل تسجيل الدخول.",
    ),
    "resend_code": MessageLookupByLibrary.simpleMessage("إعادة إرسال الكود"),
    "reset_password_description": MessageLookupByLibrary.simpleMessage(
      "نحتاج إلى بريدك الإلكتروني لنتمكن من إرسال رمز إعادة تعيين كلمة المرور.",
    ),
    "reset_password_forget_password": MessageLookupByLibrary.simpleMessage(
      "نسيت كلمة المرور",
    ),
    "reset_password_send_code": MessageLookupByLibrary.simpleMessage(
      "إرسال الرمز",
    ),
    "reset_password_title": MessageLookupByLibrary.simpleMessage(
      "إعادة تعيين كلمة المرور",
    ),
    "safe_easy_rides": MessageLookupByLibrary.simpleMessage("رحلات آمنة وسهلة"),
    "saudi_Arabia": MessageLookupByLibrary.simpleMessage("السعودية"),
    "search_trip_active_passengers": MessageLookupByLibrary.simpleMessage(
      "الركاب النشطين: ",
    ),
    "search_trip_all_trips": MessageLookupByLibrary.simpleMessage(
      "جميع الرحلات",
    ),
    "search_trip_from_hint": MessageLookupByLibrary.simpleMessage("من"),
    "search_trip_from_label": MessageLookupByLibrary.simpleMessage("من: "),
    "search_trip_no_trips_message": MessageLookupByLibrary.simpleMessage(
      "لم يتم العثور على رحلات لهذا الوجهة.\nيمكنك تعيينها كوجهة نشطة ليتم إخطارك عندما يقوم السائق بإنشاء رحلة.",
    ),
    "search_trip_set_active_destination": MessageLookupByLibrary.simpleMessage(
      "تعيين كوجهة نشطة",
    ),
    "search_trip_title": MessageLookupByLibrary.simpleMessage("أدخل مسارك"),
    "search_trip_to_hint": MessageLookupByLibrary.simpleMessage("إلى"),
    "search_trip_to_label": MessageLookupByLibrary.simpleMessage("إلى: "),
    "seats": m1,
    "select_birthdate": MessageLookupByLibrary.simpleMessage(
      "يرجى اختيار تاريخ الميلاد",
    ),
    "select_gender": MessageLookupByLibrary.simpleMessage("يرجى اختيار الجنس"),
    "select_route_confirm_location": MessageLookupByLibrary.simpleMessage(
      "تأكيد هذا الموقع",
    ),
    "select_route_search_hint": MessageLookupByLibrary.simpleMessage("بحث"),
    "select_type_driver": MessageLookupByLibrary.simpleMessage("سائق"),
    "select_type_instruction": MessageLookupByLibrary.simpleMessage(
      "اختر كيف تريد المتابعة",
    ),
    "select_type_passenger": MessageLookupByLibrary.simpleMessage("راكب"),
    "select_type_sign_in": MessageLookupByLibrary.simpleMessage("تسجيل الدخول"),
    "select_type_sign_up": MessageLookupByLibrary.simpleMessage("إنشاء حساب"),
    "select_type_welcome": MessageLookupByLibrary.simpleMessage(
      "مرحبًا بك في عون",
    ),
    "sign_in": MessageLookupByLibrary.simpleMessage("تسجيل دخول "),
    "sign_up": MessageLookupByLibrary.simpleMessage("إنشاء حساب"),
    "sudan": MessageLookupByLibrary.simpleMessage("السودان"),
    "terms_of_use": MessageLookupByLibrary.simpleMessage(" شروط الاستخدام "),
    "transport_add_new_card": MessageLookupByLibrary.simpleMessage(
      "إضافة بطاقة جديدة",
    ),
    "transport_delete": MessageLookupByLibrary.simpleMessage("حذف"),
    "transport_destination": MessageLookupByLibrary.simpleMessage("إلى"),
    "transport_latest_trips": MessageLookupByLibrary.simpleMessage(
      "آخر الرحلات",
    ),
    "transport_location_loading": MessageLookupByLibrary.simpleMessage(
      "جاري التحميل...",
    ),
    "transport_no_trips": MessageLookupByLibrary.simpleMessage(
      "لم يتم العثور على رحلات.",
    ),
    "trip": m2,
    "trip_currency_symbol": MessageLookupByLibrary.simpleMessage("\$"),
    "trip_details_additional_info": MessageLookupByLibrary.simpleMessage(
      "معلومات إضافية",
    ),
    "trip_details_amenities": MessageLookupByLibrary.simpleMessage("المرافق"),
    "trip_details_available_seats": MessageLookupByLibrary.simpleMessage(
      "المقاعد المتاحة",
    ),
    "trip_details_basic_info": MessageLookupByLibrary.simpleMessage(
      "معلومات الرحلة الأساسية",
    ),
    "trip_details_book": MessageLookupByLibrary.simpleMessage("حجز"),
    "trip_details_car_model": MessageLookupByLibrary.simpleMessage(
      "طراز السيارة",
    ),
    "trip_details_created_at": MessageLookupByLibrary.simpleMessage(
      "تاريخ الإنشاء",
    ),
    "trip_details_delete_button": MessageLookupByLibrary.simpleMessage(
      "حذف الرحلة",
    ),
    "trip_details_departure_date": MessageLookupByLibrary.simpleMessage(
      "تاريخ المغادرة",
    ),
    "trip_details_departure_time": MessageLookupByLibrary.simpleMessage(
      "وقت المغادرة",
    ),
    "trip_details_display_route": MessageLookupByLibrary.simpleMessage(
      "عرض المسار على الخريطة",
    ),
    "trip_details_driver_info": MessageLookupByLibrary.simpleMessage(
      "معلومات السائق",
    ),
    "trip_details_driver_notes": MessageLookupByLibrary.simpleMessage(
      "ملاحظات السائق",
    ),
    "trip_details_duration": MessageLookupByLibrary.simpleMessage("المدة"),
    "trip_details_estimated_arrival": MessageLookupByLibrary.simpleMessage(
      "وقت الوصول المقدر",
    ),
    "trip_details_estimated_distance": MessageLookupByLibrary.simpleMessage(
      "المسافة المقدرة",
    ),
    "trip_details_from": MessageLookupByLibrary.simpleMessage("من"),
    "trip_details_last_reviews": MessageLookupByLibrary.simpleMessage(
      "آخر التقييمات",
    ),
    "trip_details_license_plate": MessageLookupByLibrary.simpleMessage(
      "رقم اللوحة",
    ),
    "trip_details_mobile_number": MessageLookupByLibrary.simpleMessage(
      "رقم الهاتف",
    ),
    "trip_details_pickup_point": MessageLookupByLibrary.simpleMessage(
      "نقطة الانطلاق",
    ),
    "trip_details_price_per_seat": MessageLookupByLibrary.simpleMessage(
      "سعر المقعد",
    ),
    "trip_details_rating_behavior": MessageLookupByLibrary.simpleMessage(
      "السلوك",
    ),
    "trip_details_rating_driving_skills": MessageLookupByLibrary.simpleMessage(
      "مهارات القيادة",
    ),
    "trip_details_rating_pricing": MessageLookupByLibrary.simpleMessage(
      "التسعير",
    ),
    "trip_details_rating_punctuality": MessageLookupByLibrary.simpleMessage(
      "الالتزام بالمواعيد",
    ),
    "trip_details_rating_title": MessageLookupByLibrary.simpleMessage(
      "التقييم",
    ),
    "trip_details_seating_capacity": MessageLookupByLibrary.simpleMessage(
      "سعة المقاعد",
    ),
    "trip_details_seats": MessageLookupByLibrary.simpleMessage("المقاعد"),
    "trip_details_seats_suffix": MessageLookupByLibrary.simpleMessage("مقاعد"),
    "trip_details_title": MessageLookupByLibrary.simpleMessage("تفاصيل الرحلة"),
    "trip_details_to": MessageLookupByLibrary.simpleMessage("إلى"),
    "trip_details_view_map": MessageLookupByLibrary.simpleMessage(
      "عرض على الخريطة",
    ),
    "trip_from_label": MessageLookupByLibrary.simpleMessage("من: "),
    "trip_to_label": MessageLookupByLibrary.simpleMessage("إلى: "),
    "validation_invalid_number": MessageLookupByLibrary.simpleMessage(
      "رقم غير صالح لهذه الدولة.",
    ),
    "validation_phone_empty": MessageLookupByLibrary.simpleMessage(
      "رقم الهاتف مطلوب.",
    ),
    "validation_phone_long": MessageLookupByLibrary.simpleMessage(
      "رقم الهاتف طويل جدًا.",
    ),
    "validation_phone_short": MessageLookupByLibrary.simpleMessage(
      "رقم الهاتف قصير جدا.",
    ),
    "validation_select_country": MessageLookupByLibrary.simpleMessage(
      "اختر دولة.",
    ),
    "validation_success": MessageLookupByLibrary.simpleMessage("التحقق ناجح."),
    "verification_instruction": MessageLookupByLibrary.simpleMessage(
      "يجب عليك إدخال الرمز المكون من 6 أرقام الذي أرسلناه إلى بريدك الإلكتروني.",
    ),
    "verification_title": MessageLookupByLibrary.simpleMessage("رمز التحقق"),
    "verify": MessageLookupByLibrary.simpleMessage("تحقق"),
    "warning": MessageLookupByLibrary.simpleMessage("تحذير"),
    "welcome_message": MessageLookupByLibrary.simpleMessage(
      "مرحبًا بك في عون!",
    ),
    "wrong_password_or_email": MessageLookupByLibrary.simpleMessage(
      "كلمة المرور أو البريد الإلكتروني غير صحيح",
    ),
  };
}
