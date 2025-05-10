import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class TripShimmerWidget extends StatelessWidget {
  const TripShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
      child: Shimmer.fromColors(
        baseColor: Theme.of(context).colorScheme.primaryContainer,
        highlightColor: Theme.of(context).scaffoldBackgroundColor,
        enabled: true,
        child: Container(
          height: 80.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.r),
          ),
          child: Row(
            children: [
              SizedBox(width: 7.w),
              _buildIconShimmer(context),
              SizedBox(width: 7.w),
              _buildTripDetailsShimmer(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconShimmer(BuildContext context) {
    return Container(
      width: 45.w,
      height: 45.w,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(7.r),
        border: Border.all(width: 1, color: Colors.black),
      ),
    );
  }

  Widget _buildTripDetailsShimmer(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(3, (index) {
        return Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.all(Radius.circular(5.r))),
          margin: EdgeInsets.symmetric(vertical: 2.h),
          width: 100.h + Random().nextInt(100),
          height: 10.h,
        );
      }),
    );
  }
}
