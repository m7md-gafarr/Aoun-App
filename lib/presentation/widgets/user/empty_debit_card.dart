import 'package:aoun_app/core/app_images/app_images.dart';
import 'package:aoun_app/core/router/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class EmptyDebitCardWidget extends StatelessWidget {
  const EmptyDebitCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        Navigator.pushNamed(context, AppRoutesName.addNewCardScreenRoute);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(7),
        child: Stack(
          fit: StackFit.expand,
          children: [
            SvgPicture.asset(
              Assets.imageDebitCard,
              fit: BoxFit.cover,
              colorFilter: const ColorFilter.mode(
                Colors.grey,
                BlendMode.saturation,
              ),
            ),
            Positioned(
              top: 5,
              left: 5,
              child: SizedBox(
                height: 55.h,
                width: 55.h,
                child: SvgPicture.asset(Assets.imageLogoLogo,
                    color: Colors.white54),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 7,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 215.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildCardText("•••• •••• •••• 0000", 17.sp),
                        _buildCardText("NO CARD FOUND", 17.sp),
                      ],
                    ),
                  ),
                  SizedBox(width: 35.w),
                  _buildCardLabelValue('VALID\nTHRU', "--/--"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardText(String text, double fontSize) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white70,
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
          style: TextStyle(color: Colors.white60, fontSize: 10.sp),
        ),
        SizedBox(width: 5.w),
        _buildCardText(value, 12.sp),
      ],
    );
  }
}
