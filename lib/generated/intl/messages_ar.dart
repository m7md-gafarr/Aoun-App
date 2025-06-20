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

  static String m1(userName) => "مرحبًا، ${userName}";

  static String m2(count) =>
      "${Intl.plural(count, zero: 'لا يوجد مقاعد', one: 'مقعد', two: 'مقعدان', few: '${count} مقاعد', many: '${count} مقعد', other: '${count} مقعد')}";

  static String m3(count) =>
      "${Intl.plural(count, zero: 'لا رحلات', one: '1 رحلة', other: '${count} رحلات')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "account_created_message": MessageLookupByLibrary.simpleMessage(
      "تم إنشاء الحساب بنجاح!",
    ),
    "activities_opportunities": MessageLookupByLibrary.simpleMessage(
      "أنشطة وفرص",
    ),
    "add_new_card_add_button": MessageLookupByLibrary.simpleMessage(
      "إضافة البطاقة",
    ),
    "add_new_card_authorized_signature": MessageLookupByLibrary.simpleMessage(
      "التوقيع المصرح",
    ),
    "add_new_card_cardholder_default": MessageLookupByLibrary.simpleMessage(
      "حامل البطاقة",
    ),
    "add_new_card_cvv_hint": MessageLookupByLibrary.simpleMessage("رمز الأمان"),
    "add_new_card_cvv_invalid": MessageLookupByLibrary.simpleMessage(
      "رمز الأمان يجب أن يكون 3 أرقام",
    ),
    "add_new_card_cvv_required": MessageLookupByLibrary.simpleMessage(
      "يرجى إدخال رمز الأمان",
    ),
    "add_new_card_expiry_expired": MessageLookupByLibrary.simpleMessage(
      "البطاقة منتهية الصلاحية",
    ),
    "add_new_card_expiry_hint": MessageLookupByLibrary.simpleMessage("شهر/سنة"),
    "add_new_card_expiry_invalid_digits": MessageLookupByLibrary.simpleMessage(
      "أدخل 4 أرقام (شهرسنة)",
    ),
    "add_new_card_expiry_invalid_month": MessageLookupByLibrary.simpleMessage(
      "الشهر غير صحيح",
    ),
    "add_new_card_expiry_required": MessageLookupByLibrary.simpleMessage(
      "يرجى إدخال تاريخ انتهاء الصلاحية",
    ),
    "add_new_card_full_name_hint": MessageLookupByLibrary.simpleMessage(
      "الاسم الكامل",
    ),
    "add_new_card_full_name_invalid_format":
        MessageLookupByLibrary.simpleMessage("تنسيق الاسم غير صحيح"),
    "add_new_card_full_name_required": MessageLookupByLibrary.simpleMessage(
      "أدخل الاسم الكامل",
    ),
    "add_new_card_number_hint": MessageLookupByLibrary.simpleMessage(
      "رقم البطاقة",
    ),
    "add_new_card_number_invalid_length": MessageLookupByLibrary.simpleMessage(
      "طول رقم البطاقة غير صحيح",
    ),
    "add_new_card_number_required": MessageLookupByLibrary.simpleMessage(
      "أدخل رقم البطاقة",
    ),
    "add_new_card_success_message": MessageLookupByLibrary.simpleMessage(
      "تم إضافة البطاقة بنجاح",
    ),
    "add_new_card_title": MessageLookupByLibrary.simpleMessage(
      "إضافة بطاقة جديدة",
    ),
    "add_new_card_valid_thru_label": MessageLookupByLibrary.simpleMessage(
      "صالح حتى\n",
    ),
    "add_new_card_website_url": MessageLookupByLibrary.simpleMessage(
      "http://www.Aoun.com",
    ),
    "age_validation": MessageLookupByLibrary.simpleMessage(
      "يجب أن يكون العمر 18 سنوات على الأقل",
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
    "contact_us_address_hint": MessageLookupByLibrary.simpleMessage("عنوانك"),
    "contact_us_email_hint": MessageLookupByLibrary.simpleMessage(
      "بريدك الإلكتروني",
    ),
    "contact_us_email_invalid": MessageLookupByLibrary.simpleMessage(
      "أدخل بريد إلكتروني صحيح",
    ),
    "contact_us_email_required": MessageLookupByLibrary.simpleMessage(
      "يرجى إدخال بريدك الإلكتروني",
    ),
    "contact_us_message_hint": MessageLookupByLibrary.simpleMessage(
      "رسالتك...",
    ),
    "contact_us_message_required": MessageLookupByLibrary.simpleMessage(
      "يرجى إدخال رسالتك",
    ),
    "contact_us_message_sent": MessageLookupByLibrary.simpleMessage(
      "تم إرسال الرسالة!",
    ),
    "contact_us_phone_hint": MessageLookupByLibrary.simpleMessage("رقم هاتفك"),
    "contact_us_phone_required": MessageLookupByLibrary.simpleMessage(
      "يرجى إدخال رقم هاتفك",
    ),
    "contact_us_send_button": MessageLookupByLibrary.simpleMessage(
      "إرسال الرسالة",
    ),
    "contact_us_title": MessageLookupByLibrary.simpleMessage("اتصل بنا"),
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
    "created_trip_bookings_passengers": MessageLookupByLibrary.simpleMessage(
      "حجوزات الركاب",
    ),
    "created_trip_cancel_info": MessageLookupByLibrary.simpleMessage(
      "يمكنك إلغاء الرحلة في أي وقت حتى ساعة واحدة قبل وقت المغادرة.\nقد يؤثر الإلغاء بعد ذلك على تقييمك.",
    ),
    "created_trip_canceled_trip": MessageLookupByLibrary.simpleMessage(
      "إلغاء الرحلة",
    ),
    "created_trip_confirm_cancel_button": MessageLookupByLibrary.simpleMessage(
      "تأكيد الإلغاء",
    ),
    "created_trip_confirm_cancel_content": MessageLookupByLibrary.simpleMessage(
      "هل أنت متأكد أنك تريد إلغاء هذه الرحلة؟",
    ),
    "created_trip_confirm_cancel_title": MessageLookupByLibrary.simpleMessage(
      "تأكيد الإلغاء",
    ),
    "created_trip_finish_trip": MessageLookupByLibrary.simpleMessage(
      "إنهاء الرحلة",
    ),
    "created_trip_from": MessageLookupByLibrary.simpleMessage("من"),
    "created_trip_status": MessageLookupByLibrary.simpleMessage("الحالة"),
    "created_trip_status_active": MessageLookupByLibrary.simpleMessage("نشطة"),
    "created_trip_status_canceled": MessageLookupByLibrary.simpleMessage(
      "ملغاة",
    ),
    "created_trip_status_completed": MessageLookupByLibrary.simpleMessage(
      "مكتملة",
    ),
    "created_trip_status_planned": MessageLookupByLibrary.simpleMessage("مخطط"),
    "created_trip_status_unknown": MessageLookupByLibrary.simpleMessage(
      "غير معروف",
    ),
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
    "driver_history_trips_no_history": MessageLookupByLibrary.simpleMessage(
      "لا توجد رحلات في السجل في الوقت الحالي.",
    ),
    "driver_history_trips_title": MessageLookupByLibrary.simpleMessage(
      "سجل الرحلات",
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
    "driver_wallet_earnings_amount_exceeds":
        MessageLookupByLibrary.simpleMessage("المبلغ يتجاوز رصيدك المتاح"),
    "driver_wallet_earnings_amount_hint": MessageLookupByLibrary.simpleMessage(
      "أدخل المبلغ المراد سحبه",
    ),
    "driver_wallet_earnings_amount_min": MessageLookupByLibrary.simpleMessage(
      "يجب أن يكون المبلغ أكبر من 0",
    ),
    "driver_wallet_earnings_amount_required":
        MessageLookupByLibrary.simpleMessage("يرجى إدخال المبلغ"),
    "driver_wallet_earnings_balance": MessageLookupByLibrary.simpleMessage(
      "رصيدك",
    ),
    "driver_wallet_earnings_card_number": MessageLookupByLibrary.simpleMessage(
      "رقم البطاقة",
    ),
    "driver_wallet_earnings_card_number_digits":
        MessageLookupByLibrary.simpleMessage("يسمح فقط بالأرقام"),
    "driver_wallet_earnings_card_number_length":
        MessageLookupByLibrary.simpleMessage(
          "يجب أن يتكون رقم البطاقة من 16 رقمًا",
        ),
    "driver_wallet_earnings_card_number_required":
        MessageLookupByLibrary.simpleMessage("يرجى إدخال رقم البطاقة"),
    "driver_wallet_earnings_last_transaction":
        MessageLookupByLibrary.simpleMessage("آخر معاملة"),
    "driver_wallet_earnings_no_transactions":
        MessageLookupByLibrary.simpleMessage("ليس لديك أي معاملات بعد."),
    "driver_wallet_earnings_title": MessageLookupByLibrary.simpleMessage(
      "المحفظة والأرباح",
    ),
    "driver_wallet_earnings_withdraw": MessageLookupByLibrary.simpleMessage(
      "سحب",
    ),
    "driver_wallet_earnings_withdrawal": MessageLookupByLibrary.simpleMessage(
      "سحب",
    ),
    "driver_wallet_earnings_withdrawal_request":
        MessageLookupByLibrary.simpleMessage("طلب سحب (الأربعاء فقط)"),
    "driver_wallet_earnings_withdrawal_success_message":
        MessageLookupByLibrary.simpleMessage("تمت عملية السحب بنجاح."),
    "driver_wallet_earnings_withdrawal_success_title":
        MessageLookupByLibrary.simpleMessage("تمت العملية"),
    "driver_wallet_earnings_withdrawal_wednesday_only":
        MessageLookupByLibrary.simpleMessage("السحب مسموح فقط أيام الأربعاء."),
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
      "انقر على \'اتصل بالدعم\' أدناه أو راسلنا على البريد الإلكتروني umssthasystem@gmail.com.",
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
      "umssthasystem@gmail.com",
    ),
    "help_feedback_support_phone": MessageLookupByLibrary.simpleMessage(
      "+20 101 3379 651",
    ),
    "help_feedback_title": MessageLookupByLibrary.simpleMessage(
      "المساعدة والتعليقات",
    ),
    "home_driver_active_passengers_label": MessageLookupByLibrary.simpleMessage(
      "الركاب النشطين: ",
    ),
    "home_driver_balance_title": MessageLookupByLibrary.simpleMessage("رصيدك"),
    "home_driver_chart_sales": MessageLookupByLibrary.simpleMessage("المبيعات"),
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
    "home_driver_friday": MessageLookupByLibrary.simpleMessage("الجمعة"),
    "home_driver_from_label": MessageLookupByLibrary.simpleMessage("من: "),
    "home_driver_loading": MessageLookupByLibrary.simpleMessage("جاري التحميل"),
    "home_driver_monday": MessageLookupByLibrary.simpleMessage("الإثنين"),
    "home_driver_no_active_passengers": MessageLookupByLibrary.simpleMessage(
      "لا يوجد ركاب نشطين في الوقت الحالي.",
    ),
    "home_driver_recent_orders": MessageLookupByLibrary.simpleMessage(
      "الطلبات الأخيرة",
    ),
    "home_driver_saturday": MessageLookupByLibrary.simpleMessage("السبت"),
    "home_driver_sunday": MessageLookupByLibrary.simpleMessage("الأحد"),
    "home_driver_thursday": MessageLookupByLibrary.simpleMessage("الخميس"),
    "home_driver_to_label": MessageLookupByLibrary.simpleMessage("إلى: "),
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
    "home_driver_tuesday": MessageLookupByLibrary.simpleMessage("الثلاثاء"),
    "home_driver_wednesday": MessageLookupByLibrary.simpleMessage("الأربعاء"),
    "home_user_welcome": m1,
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
    "payment_complete_payment_message": MessageLookupByLibrary.simpleMessage(
      "سيتم توجيهك الآن لإكمال عملية الدفع.\nتم إرسال بريد إلكتروني للتأكيد أيضًا.",
    ),
    "payment_complete_payment_title": MessageLookupByLibrary.simpleMessage(
      "إكمال الدفع",
    ),
    "payment_done_button": MessageLookupByLibrary.simpleMessage("تم"),
    "payment_loading": MessageLookupByLibrary.simpleMessage("جاري التحميل"),
    "payment_no_card_added": MessageLookupByLibrary.simpleMessage(
      "يبدو أنك لم تقم بإضافة بطاقة بعد. أضف واحدة الآن للمتابعة.",
    ),
    "payment_no_cards": MessageLookupByLibrary.simpleMessage(
      "لا توجد بطاقات متاحة",
    ),
    "payment_no_debit_card": MessageLookupByLibrary.simpleMessage(
      "لم يتم العثور على بطاقة خصم",
    ),
    "payment_pay_again_button": MessageLookupByLibrary.simpleMessage(
      "حجز مرة اخرى",
    ),
    "payment_pay_amount": MessageLookupByLibrary.simpleMessage("ادفع"),
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
    "payment_receipt_title": MessageLookupByLibrary.simpleMessage(
      "إيصال الدفع",
    ),
    "payment_seats_count": MessageLookupByLibrary.simpleMessage("عدد المقاعد"),
    "payment_success_description": MessageLookupByLibrary.simpleMessage(
      "تمت عملية الدفع لعون بنجاح",
    ),
    "payment_success_title": MessageLookupByLibrary.simpleMessage(
      "تم الدفع بنجاح",
    ),
    "payment_title": MessageLookupByLibrary.simpleMessage("الدفع"),
    "payment_total_amount": MessageLookupByLibrary.simpleMessage(
      "المبلغ الإجمالي",
    ),
    "payment_total_payment": MessageLookupByLibrary.simpleMessage(
      "إجمالي الدفع",
    ),
    "payment_total_seats": MessageLookupByLibrary.simpleMessage(
      "إجمالي المقاعد",
    ),
    "payment_wallet_number": MessageLookupByLibrary.simpleMessage(
      "رقم المحفظة",
    ),
    "payment_wallet_tab": MessageLookupByLibrary.simpleMessage("المحفظة"),
    "paymob_error_message": MessageLookupByLibrary.simpleMessage("خطأ"),
    "paymob_payment_title": MessageLookupByLibrary.simpleMessage("دفع بايموب"),
    "phone_number_required": MessageLookupByLibrary.simpleMessage(
      "رقم الهاتف مطلوب",
    ),
    "please_enter_name": MessageLookupByLibrary.simpleMessage(
      "من فضلك، أدخل اسمك",
    ),
    "privacy_policy": MessageLookupByLibrary.simpleMessage("سياسة الخصوصية"),
    "privacy_policy_acknowledgment_content": MessageLookupByLibrary.simpleMessage(
      "من خلال استخدام الخدمات أو التسجيل أو التحميل أو الدخول إلى المواقع الإلكترونية و/أو التطبيقات، فإنك تقر بأنك على علم أو كان لديك الفرصة للاطلاع على هذه السياسة، بما في ذلك معالجة (بما في ذلك جمع واستخدام وكشف والاحتفاظ أو التخلص من) معلوماتك.\n\nقد يتم الاحتفاظ بالمعلومات التي يحتفظ بها عون عنك ومعالجتها في ملفات الكمبيوتر و/أو الورقية. إذا قدمت لعون أي معلومات بخصوص شخص آخر، فمن مسؤوليتك إطلاعه على هذه السياسة.\n\nإذا كان لديك أي أسئلة أو تعليقات بخصوص قضايا الخصوصية، يرجى الاتصال بنا على legal@swvl.com.",
    ),
    "privacy_policy_acknowledgment_title": MessageLookupByLibrary.simpleMessage(
      "إقرار المستخدم بهذه السياسة",
    ),
    "privacy_policy_contact_content": MessageLookupByLibrary.simpleMessage(
      "إذا كان لديك أي أسئلة أو تعليقات بخصوص قضايا الخصوصية، يرجى الاتصال بنا:",
    ),
    "privacy_policy_contact_email": MessageLookupByLibrary.simpleMessage(
      "umssthasystem@gmail.com",
    ),
    "privacy_policy_contact_title": MessageLookupByLibrary.simpleMessage(
      "اتصل بنا",
    ),
    "privacy_policy_cookies_content": MessageLookupByLibrary.simpleMessage(
      "تستخدم المواقع الإلكترونية ملفات تعريف الارتباط والتقنيات ذات الصلة من أجل:\n• وظائف الموقع\n• التحليلات\n• الإعلانات\n\nيمكن أن يتضمن استخدام هذه التقنيات معالجة البيانات الشخصية. لمزيد من المعلومات حول كيفية استخدامنا لملفات تعريف الارتباط والتقنيات ذات الصلة، وخياراتك بخصوص ملفات تعريف الارتباط، يرجى الرجوع إلى إشعار ملفات تعريف الارتباط الخاص بنا.",
    ),
    "privacy_policy_cookies_title": MessageLookupByLibrary.simpleMessage(
      "ملفات تعريف الارتباط وتقنيات الويب",
    ),
    "privacy_policy_header": MessageLookupByLibrary.simpleMessage(
      "فهم التزامنا بحماية خصوصيتك",
    ),
    "privacy_policy_introduction": MessageLookupByLibrary.simpleMessage(
      "شركة عون المحدودة وشركاتها التابعة والشركات المرتبطة والشركات المشتركة والكيانات الخاضعة للسيطرة المشتركة (المشار إليها مجتمعة باسم \"عون\" أو \"نحن\" أو \"لنا\") تقدر حاجتك لحماية بياناتك الشخصية وتلتزم بحماية واحترام خصوصية جميع الأشخاص الذين يتواصلون أو يزورون أو يقدمون معلومات لعون بأي طريقة أخرى.\n\nتصف سياسة الخصوصية هذه كيفية جمع عون واستخدام ومعالجة وكشف بياناتك الشخصية من خلال استخدام تطبيقات ومواقع عون والمنتجات والميزات والخدمات الأخرى عالميًا. تنطبق هذه السياسة على الركاب والوكلاء والبائعين والموردين والشركاء والمقاولين ومقدمي الخدمات.",
    ),
    "privacy_policy_location_content": MessageLookupByLibrary.simpleMessage(
      "قد يتم الكشف عن معلوماتك الشخصية لكيانات عون الأخرى والأطراف الثالثة (بما في ذلك مقدمي الخدمات) في الولايات القضائية بما في ذلك، على سبيل المثال لا الحصر: جزر فيرجن البريطانية ومصر وكينيا وباكستان والإمارات العربية المتحدة.\n\nقد يتم نقل البيانات التي يجمعها عون منك وتخزينها في بلد لا يعتبر أنه يوفر مستوى كافٍ من الحماية بموجب قوانينك المحلية. قد تتم معالجتها أيضًا من قبل موظفين يعملون خارج بلد إقامتك.\n\nمن خلال تقديم معلوماتك الشخصية، فإنك تقر، وحيثما كان ذلك ضروريًا بموجب القوانين المحلية، توافق على هذا النقل أو التخزين أو المعالجة.",
    ),
    "privacy_policy_location_title": MessageLookupByLibrary.simpleMessage(
      "موقع معلوماتك",
    ),
    "privacy_policy_others_info_content": MessageLookupByLibrary.simpleMessage(
      "• نجمع المعلومات التي يقدمها الركاب عن السائقين، والعكس صحيح، بما في ذلك التقييمات والشكاوى والمنشورات في المنتديات أو لوحات الرسائل\n• قد يتلقى عون معلومات عنك من المواقع الإلكترونية أو الخدمات المرتبطة\n• نعمل مع أطراف ثالثة (الشركاء التجاريون والمقاولون من الباطن ومعالجات الدفع وشبكات الإعلانات ومقدمي التحليلات ومقدمي معلومات البحث ووكالات الائتمان المرجعية) وقد نتلقى معلومات عنك منهم\n• حيث يجمع الأطراف الثالثة معلومات عنك ويشاركونها معنا، يجب عليك الرجوع إلى سياسات الخصوصية المنفصلة التي يحتفظون بها",
    ),
    "privacy_policy_others_info_title": MessageLookupByLibrary.simpleMessage(
      "المعلومات المقدمة من الآخرين",
    ),
    "privacy_policy_security_content": MessageLookupByLibrary.simpleMessage(
      "نفذ عون إجراءات إدارية ومادية وإلكترونية مصممة لحماية معلوماتك من الوصول غير المصرح به والتعديل وعدم التوفر.\n\nسنلتزم بالقانون المعمول به في حالة أي خرق للأمان أو السرية أو سلامة بياناتك الشخصية، وحيثما كان ذلك مناسبًا أو مطلوبًا بموجب القانون، سنخطرك عبر البريد الإلكتروني أو الرسائل النصية أو نشر الموقع في أسرع وقت ممكن.\n\nعلى الرغم من عدم وجود أمان مضمون سواء على الإنترنت أو خارجه، فإننا نبذل جهودًا تجارية معقولة لضمان جمع وأمان المعلومات متسقة مع هذه السياسة وجميع القوانين واللوائح المعمول بها.",
    ),
    "privacy_policy_security_title": MessageLookupByLibrary.simpleMessage(
      "أمان معلوماتك",
    ),
    "privacy_policy_service_use_content": MessageLookupByLibrary.simpleMessage(
      "• بيانات الموقع الجغرافي: إذا وصلت إلى التطبيقات من خلال جهاز محمول، فقد نجمع إحداثيات GPS لرحلتك (بما في ذلك بيانات الانطلاق والوصول ومعلومات المسار) أو معلومات موقع مماثلة.\n\n• جهات الاتصال: قد نصل إلى تقويمك أو جهات اتصالك بإذنك.\n\n• بيانات المعاملات: نجمع المعلومات المنشأة أثناء تفاعلاتك مع الخدمات، بما في ذلك:\n  - تاريخ ووقت الطلبات\n  - قبول السائق والوصول\n  - تفاصيل إكمال الخدمة\n  - المسافة المقطوعة\n  - المبلغ المحتسب (الرسوم الأساسية والإكرامية والرسوم الإضافية)\n  - استخدام الرمز الترويجي",
    ),
    "privacy_policy_service_use_title": MessageLookupByLibrary.simpleMessage(
      "المعلومات المجمعة من خلال استخدام الخدمة",
    ),
    "privacy_policy_title": MessageLookupByLibrary.simpleMessage(
      "سياسة الخصوصية",
    ),
    "privacy_policy_types_info_content": MessageLookupByLibrary.simpleMessage(
      "يجمع عون كل من \"المعلومات الشخصية\" و\"المعلومات المجهولة\" عنك:\n\n• المعلومات الشخصية: المعلومات التي يمكن استخدامها لتحديد هويتك، مثل اسمك الكامل وعنوان بريدك الإلكتروني ورقم هاتفك وطريقة الدفع وكلمة المرور وعنوان المراسلة وعنوان IP وصورة الملف الشخصي والموقع، وكذلك المعلومات المرتبطة بهذه المعلومات.\n\n• المعلومات المجهولة: المعلومات التي لا يمكننا استخدامها لتحديد هويتك وليست مرتبطة بمعلومات يمكن استخدامها للقيام بذلك. تشمل المعلومات التي يتم جمعها بشكل سلبي عن أنشطتك على المواقع الإلكترونية أو التطبيقات، مثل بيانات الاستخدام.\n\nنحن أيضًا نجمع بشكل سلبي معلومات معينة من أجهزتك، مثل عنوان IP ومعلومات دقة الشاشة والموقع الجغرافي ومعلومات Wi-Fi ومعلومات المتصفح ومعرف الجهاز الفريد (UDID) و/أو نظام التشغيل المحمول الخاص بك.",
    ),
    "privacy_policy_types_info_title": MessageLookupByLibrary.simpleMessage(
      "أنواع المعلومات التي نجمعها",
    ),
    "privacy_policy_voluntary_info_content": MessageLookupByLibrary.simpleMessage(
      "نجمع المعلومات التي تقدمها لنا أثناء استخدامك للخدمات:\n\n• المعلومات الشخصية أثناء التسجيل: الاسم الكامل وعنوان البريد الإلكتروني ورقم الهاتف وطريقة الدفع ومعلومات الفواتير وصورة الملف الشخصي ومعلومات الملف الشخصي\n• التواصل معنا أو مع السائقين (رسائل البريد الإلكتروني والرسائل داخل التطبيق والصور والرسائل النصية والتعليمات المكتوبة)\n• معلومات تفضيلات المستخدم: تفضيلات التسويق وتفضيلات التواصل وعنوان المنزل وعنوان العمل والمفضلة وردود الاستطلاع\n• المعلومات المقدمة لدعم العملاء عبر البريد الإلكتروني أو الهاتف أو التطبيقات أو الرسائل النصية أو رسائل وسائل التواصل الاجتماعي أو القنوات الأخرى\n• المنشورات في المنتديات أو لوحات الرسائل، بما في ذلك صفحات وسائل التواصل الاجتماعي لعون\n• البيانات المقدمة في العروض الترويجية والمسابقات ونماذج التغذية الراجعة أو القضايا المتعلقة بالخدمة\n\nملاحظة: بعض المعلومات إلزامية لإنشاء حساب واستخدام خدماتنا.",
    ),
    "privacy_policy_voluntary_info_title": MessageLookupByLibrary.simpleMessage(
      "المعلومات المقدمة طواعية",
    ),
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
    "search_trip_active_destination_success":
        MessageLookupByLibrary.simpleMessage("تم تعيينك كنشط لهذه الوجهة."),
    "search_trip_active_passengers": MessageLookupByLibrary.simpleMessage(
      "الركاب النشطين: ",
    ),
    "search_trip_all_trips": MessageLookupByLibrary.simpleMessage(
      "جميع الرحلات",
    ),
    "search_trip_from_hint": MessageLookupByLibrary.simpleMessage("من"),
    "search_trip_from_label": MessageLookupByLibrary.simpleMessage("من: "),
    "search_trip_gathering_recommendations":
        MessageLookupByLibrary.simpleMessage(
          "نحن ما زلنا نجمع التوصيات لك. ابق على اطلاع!",
        ),
    "search_trip_no_active_passengers": MessageLookupByLibrary.simpleMessage(
      "لا يوجد ركاب نشطين في الوقت الحالي.",
    ),
    "search_trip_no_results_found": MessageLookupByLibrary.simpleMessage(
      "لم يتم العثور على نتائج للموقع المدخل.",
    ),
    "search_trip_no_trips_message": MessageLookupByLibrary.simpleMessage(
      "لم يتم العثور على رحلات لهذا الوجهة.\nيمكنك تعيينها كوجهة نشطة ليتم إخطارك عندما يقوم السائق بإنشاء رحلة.",
    ),
    "search_trip_set_active_destination": MessageLookupByLibrary.simpleMessage(
      "تعيين كوجهة نشطة",
    ),
    "search_trip_suggested_trips_title": MessageLookupByLibrary.simpleMessage(
      "رحلات مقترحة بناءً على موقعك",
    ),
    "search_trip_title": MessageLookupByLibrary.simpleMessage("البحث عن رحلة"),
    "search_trip_to_hint": MessageLookupByLibrary.simpleMessage("إلى"),
    "search_trip_to_label": MessageLookupByLibrary.simpleMessage("إلى: "),
    "seats": m2,
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
    "terms_conditions_acknowledgment": MessageLookupByLibrary.simpleMessage(
      "من خلال الاستمرار في استخدام خدمات عون، فإنك تعترف بأنك قد قرأت وفهمت وتوافق على الالتزام بهذه الشروط.",
    ),
    "terms_conditions_amendments_content": MessageLookupByLibrary.simpleMessage(
      "قد تنطبق شروط تكميلية على خدمات عون معينة، مثل السياسات الخاصة بحدث أو نشاط أو عرض معين، وستتم إفادتك بهذه الشروط التكميلية فيما يتعلق بخدمات عون المعنية. الشروط التكميلية إضافية إلى الشروط وستعتبر جزءًا منها لأغراض وفترة خدمات عون المعنية.\n\nيجوز لعون تعديل الشروط المتعلقة بخدمات عون من وقت لآخر. ستكون التعديلات سارية عند نشر عون لهذه الشروط المحدثة في هذا الموقع أو السياسات المعدلة أو الشروط التكميلية على الخدمة المعنية. استمرارك في الوصول إلى خدمات عون أو استخدامها بعد هذا النشر يشكل موافقتك على الالتزام بالشروط كما تم تعديلها.\n\nيتم توفير جمعنا واستخدامنا لمعلوماتك الشخصية في سياسة الخصوصية الخاصة بعون، والتي يمكن الوصول إليها على https://swvl.com/privacy_policy.",
    ),
    "terms_conditions_amendments_title": MessageLookupByLibrary.simpleMessage(
      "التعديلات والشروط التكميلية",
    ),
    "terms_conditions_contractual_relationship_content":
        MessageLookupByLibrary.simpleMessage(
          "تحكم شروط الاستخدام هذه (\"الشروط\") الوصول أو الاستخدام من قبلك، كفرد، من داخل أي بلد في العالم (باستثناء الولايات المتحدة وأقاليمها وممتلكاتها والصين القارية) للتطبيقات والمواقع الإلكترونية والمحتوى ومركز الاتصال ومنصة التكنولوجيا وخدمات الدفع الإلكتروني والمنتجات والخدمات (المشار إليها مجتمعة باسم \"خدمات عون\") المتاحة من قبل شركة عون المحدودة.\n\nتشكل هذه الشروط اتفاقية ملزمة قانونًا بينك وبين كيان عون المحلي. يرجى قراءة هذه الشروط بعناية قبل الوصول إلى خدمات عون أو استخدامها. إذا كنت لا توافق على الالتزام بالشروط، فلا يجوز لك استخدام أو الوصول إلى خدمات عون.\n\nيشكل وصولك واستخدامك لخدمات عون موافقتك على الالتزام بهذه الشروط، التي تنشئ علاقة تعاقدية بينك وبين عون وكيان عون المحلي. هذه الشروط تلغي صراحةً الاتفاقيات أو الترتيبات السابقة معك.\n\nيجوز لعون إنهاء هذه الشروط أو أي من خدمات عون فيما يتعلق بك فورًا، أو التوقف عن تقديم أو رفض الوصول إلى خدمات عون أو أي جزء منها، في أي وقت لأي سبب.",
        ),
    "terms_conditions_contractual_relationship_title":
        MessageLookupByLibrary.simpleMessage("العلاقة التعاقدية"),
    "terms_conditions_header": MessageLookupByLibrary.simpleMessage(
      "شروط الاستخدام",
    ),
    "terms_conditions_introduction": MessageLookupByLibrary.simpleMessage(
      "تحكم شروط الاستخدام هذه الوصول إلى خدمات عون واستخدامها، وهي متاحة من قبل شركة عون المحدودة، وهي شركة مسؤولية محدودة خاصة تأسست في جزر فيرجن البريطانية.\n\nمن خلال الوصول إلى خدمات عون أو استخدامها، فإنك توافق على الالتزام بهذه الشروط، التي تنشئ علاقة تعاقدية بينك وبين عون. يرجى قراءة هذه الشروط بعناية قبل استخدام خدماتنا.",
    ),
    "terms_conditions_license_content": MessageLookupByLibrary.simpleMessage(
      "خاضعًا لامتثالك لهذه الشروط، يمنحك عون ترخيصًا محدودًا وغير حصري وغير قابل للترخيص الفرعي وغير قابل للتنازل وقابل للإلغاء وغير قابل للتحويل لـ:\n\n• الوصول إلى التطبيقات واستخدامها على جهازك الشخصي حصريًا فيما يتعلق باستخدامك لخدمات عون\n\n• الوصول إلى أي محتوى أو معلومات أو مواد ذات صلة قد تكون متاحة من خلال خدمات عون، في كل حالة حصريًا لاستخدامك الشخصي وغير التجاري\n\nأي حقوق لم يتم منحها صراحةً هنا محفوظة لعون ومرخصي عون.",
    ),
    "terms_conditions_license_title": MessageLookupByLibrary.simpleMessage(
      "الترخيص",
    ),
    "terms_conditions_need_help_content": MessageLookupByLibrary.simpleMessage(
      "إذا كان لديك أي أسئلة حول شروط الاستخدام هذه أو تحتاج إلى مساعدة في خدماتنا، يرجى الاتصال بفريق الدعم لدينا.",
    ),
    "terms_conditions_need_help_title": MessageLookupByLibrary.simpleMessage(
      "تحتاج مساعدة؟",
    ),
    "terms_conditions_ownership_content": MessageLookupByLibrary.simpleMessage(
      "خدمات عون وجميع الحقوق فيها هي وستبقى ملكية عون أو ملكية مرخصي عون. لا تنقل هذه الشروط ولا استخدامك لخدمات عون أو تمنحك أي حقوق:\n\n• في خدمات عون أو المتعلقة بها إلا للترخيص المحدود الممنوح أعلاه\n\n• لاستخدام أو الإشارة بأي طريقة إلى أسماء الشركات أو الشعارات أو أسماء المنتجات والخدمات أو العلامات التجارية أو علامات الخدمة الخاصة بعون أو مرخصي عون بغض النظر عما إذا كانت مسجلة أم غير مسجلة",
    ),
    "terms_conditions_ownership_title": MessageLookupByLibrary.simpleMessage(
      "الملكية",
    ),
    "terms_conditions_provision_content": MessageLookupByLibrary.simpleMessage(
      "تعترف بأن أجزاء من خدمات عون قد تكون متاحة تحت العلامات التجارية المختلفة لعون أو خيارات الطلب المرتبطة بالنقل، بما في ذلك علامات طلب النقل المشار إليها حاليًا باسم \"بريميوم\" و\"إيكونومي\".\n\nتعترف أيضًا بأن خدمات عون قد تكون متاحة تحت هذه العلامات التجارية أو خيارات الطلب من قبل أو فيما يتعلق بـ:\n\n• بعض الشركات التابعة لعون\n• مزودي الطرف الثالث المستقلين، بما في ذلك سائقي شركات شبكة النقل أو حاملي تصاريح النقل السياحي أو حاملي تصاريح أو تراخيص النقل المماثلة",
    ),
    "terms_conditions_provision_title": MessageLookupByLibrary.simpleMessage(
      "توفير خدمات عون",
    ),
    "terms_conditions_restrictions_content": MessageLookupByLibrary.simpleMessage(
      "توافق تحديدًا على عدم القيام بما يلي، دون الموافقة الكتابية الصريحة المسبقة من عون:\n\n• إزالة أي إشعارات حقوق النشر أو العلامات التجارية أو الملكية الأخرى من أي جزء من خدمات عون\n\n• إعادة إنتاج أو تعديل أو إعداد أعمال مشتقة بناءً عليها أو توزيع أو ترخيص أو تأجير أو بيع أو إعادة بيع أو نقل أو عرض علني أو أداء علني أو إرسال أو بث أو استغلال خدمات عون بطريقة أخرى إلا كما يسمح به عون صراحةً\n\n• فك تجميع أو عكس هندسة أو تفكيك خدمات عون\n\n• ربط أو عكس أو تأطير أي جزء من خدمات عون\n\n• التسبب في إطلاق أي برامج أو نصوص لغرض الاستخراج أو الفهرسة أو المسح أو استخراج البيانات بطريقة أخرى من أي جزء من خدمات عون\n\n• محاولة الوصول غير المصرح به إلى أو إضعاف أي جانب من جوانب خدمات عون أو أنظمتها أو شبكاتها ذات الصلة",
    ),
    "terms_conditions_restrictions_title": MessageLookupByLibrary.simpleMessage(
      "القيود",
    ),
    "terms_conditions_services_content": MessageLookupByLibrary.simpleMessage(
      "تشكل خدمات عون منصة تكنولوجية تمكن مستخدمي تطبيقات عون المحمولة أو المواقع الإلكترونية المقدمة كجزء من خدمات عون (كل منها، \"تطبيق\") من ترتيب وجدولة خدمات النقل مع مزودي الطرف الثالث المستقلين لهذه الخدمات، بما في ذلك مزودي النقل المستقلين من الطرف الثالث بموجب اتفاقية مع عون أو بعض الشركات التابعة لعون (\"مزودو الطرف الثالث\").\n\nما لم يتفق عون على خلاف ذلك في اتفاقية منفصلة مكتوبة معك، يتم توفير خدمات عون حصريًا لاستخدامك الشخصي وغير التجاري. كل خدمة يقدمها مزود الطرف الثالث لك ستشكل اتفاقية قانونية منفصلة بينك وبين مزود الطرف الثالث.\n\nتعترف بأن عون لا يوفر أي شكل من أشكال خدمات النقل أو يعمل كشركة نقل أو مزود خدمة نقل أو يمتلك أي مركبات للنقل وأن جميع خدمات النقل هذه يقدمها مزودو الطرف الثالث الذين لا يعملون لدى عون أو أي من شركاته التابعة ولا يعملون تحت سيطرتهم.",
    ),
    "terms_conditions_services_title": MessageLookupByLibrary.simpleMessage(
      "خدمات عون",
    ),
    "terms_conditions_third_party_content": MessageLookupByLibrary.simpleMessage(
      "قد تكون خدمات عون متاحة أو يمكن الوصول إليها فيما يتعلق بخدمات ومحتوى الطرف الثالث (بما في ذلك الإعلانات) التي لا يتحكم فيها عون. تعترف بأن شروط استخدام وسياسات خصوصية مختلفة قد تنطبق على استخدامك لخدمات ومحتوى الطرف الثالث هذه.\n\nلا يؤيد عون خدمات ومحتوى الطرف الثالث هذه، وفي أي حال لن يكون عون مسؤولاً أو ملزماً بأي منتجات أو خدمات مزودي الطرف الثالث هؤلاء.\n\nبالإضافة إلى ذلك، ستكون شركة آبل المحدودة أو شركة جوجل المحدودة أو مزود أي نظام تشغيل محمول آخر قابل للتطبيق و/أو الشركات التابعة الدولية المعنية لهم مستفيدين من الطرف الثالث من هذه الشروط إذا وصلت إلى خدمات عون باستخدام التطبيقات المطورة لـ iOS من آبل أو أندرويد أو أي أجهزة محمولة مدعومة بنظام تشغيل آخر قابل للتطبيق، على التوالي.",
    ),
    "terms_conditions_third_party_title": MessageLookupByLibrary.simpleMessage(
      "خدمات ومحتوى الطرف الثالث",
    ),
    "terms_conditions_title": MessageLookupByLibrary.simpleMessage(
      "الشروط والأحكام",
    ),
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
    "trip": m3,
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
    "trip_details_completed_booking": MessageLookupByLibrary.simpleMessage(
      "تم الحجز",
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
    "trip_status_active": MessageLookupByLibrary.simpleMessage("نشطة"),
    "trip_status_canceled": MessageLookupByLibrary.simpleMessage("ملغاة"),
    "trip_status_completed": MessageLookupByLibrary.simpleMessage("مكتملة"),
    "trip_status_planned": MessageLookupByLibrary.simpleMessage("مخططة"),
    "trip_status_unknown": MessageLookupByLibrary.simpleMessage("غير معروفة"),
    "trip_to_label": MessageLookupByLibrary.simpleMessage("إلى: "),
    "user_edit_profile_update_success_ok": MessageLookupByLibrary.simpleMessage(
      "حسنًا",
    ),
    "user_edit_profile_update_success_title":
        MessageLookupByLibrary.simpleMessage("تم التحديث بنجاح"),
    "user_history_booking_from_label": MessageLookupByLibrary.simpleMessage(
      "من: ",
    ),
    "user_history_booking_no_history": MessageLookupByLibrary.simpleMessage(
      "لا توجد رحلات في السجل في الوقت الحالي.",
    ),
    "user_history_booking_status_label": MessageLookupByLibrary.simpleMessage(
      "الحالة: ",
    ),
    "user_history_booking_title": MessageLookupByLibrary.simpleMessage(
      "سجل الحجوزات",
    ),
    "user_history_booking_to_label": MessageLookupByLibrary.simpleMessage(
      "إلى: ",
    ),
    "user_history_booking_total_seats_label":
        MessageLookupByLibrary.simpleMessage("إجمالي المقاعد: "),
    "user_profile_booking_history": MessageLookupByLibrary.simpleMessage(
      "سجل الحجوزات",
    ),
    "user_profile_theme_dark": MessageLookupByLibrary.simpleMessage("داكن"),
    "user_profile_theme_light": MessageLookupByLibrary.simpleMessage("فاتح"),
    "user_profile_transactions": MessageLookupByLibrary.simpleMessage(
      "المعاملات",
    ),
    "user_transactions_no_transactions": MessageLookupByLibrary.simpleMessage(
      "ليس لديك أي معاملات بعد.",
    ),
    "user_transactions_title": MessageLookupByLibrary.simpleMessage(
      "المعاملات",
    ),
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
