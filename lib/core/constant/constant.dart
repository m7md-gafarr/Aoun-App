//APi Key

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/////////////////////////////////////////////////////////////

// Name Fonts

const fontArabic = "cairo";
const fontEnglish = "Poppins";

/////////////////////////////////////////////////////////////

bool isRTL(BuildContext context) {
  return Intl.getCurrentLocale() == "ar";
}

class ScaleSize {
  static double textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}

/////////////////////////////////////////////////////////////
