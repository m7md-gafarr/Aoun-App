import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyDataWidget extends StatelessWidget {
  EmptyDataWidget({super.key, required this.image, required this.text});
  String image, text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          image,
          height: 115.h,
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelMedium,
        )
      ],
    );
  }
}
