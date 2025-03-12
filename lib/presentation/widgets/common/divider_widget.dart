import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      endIndent: 30.w,
      indent: 30.w,
      thickness: .7,
      height: 40.h,
    );
  }
}
