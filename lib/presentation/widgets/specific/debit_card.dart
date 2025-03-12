import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:aoun_app/core/app_images/app_images.dart';

class DebitCardWidget extends StatelessWidget {
  const DebitCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(7),
      child: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(
            Assets.imageDebitCard,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 5,
            left: 5,
            child: SizedBox(
              height: 55.h,
              width: 55.h,
              child: SvgPicture.asset(Assets.imageLogoLogo),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 7,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCardText("•••• •••• •••• 4586", 17.sp),
                    _buildCardText("MOHAMED SOBHY GAFAR", 17.sp),
                  ],
                ),
                SizedBox(width: 35.w),
                _buildCardLabelValue('VALID\nTHRU', '44/64'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardText(String text, double fontSize) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
      ),
    );
  }

  Widget _buildCardLabelValue(String label, String value) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 10.sp),
        ),
        SizedBox(width: 5.w),
        _buildCardText(value, 12.sp),
      ],
    );
  }
}
