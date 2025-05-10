import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class PlaceAutocompleteShimmerWidget extends StatelessWidget {
  const PlaceAutocompleteShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 7.h),
      child: Shimmer.fromColors(
        baseColor: Theme.of(context).colorScheme.primaryContainer,
        highlightColor: Theme.of(context).scaffoldBackgroundColor,
        enabled: true,
        child: Container(
          height: 50.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.r),
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
          child: Row(
            children: [
              SizedBox(width: 10.w),
              _buildIconShimmer(context),
              SizedBox(width: 10.w),
              _buildTextShimmer(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconShimmer(BuildContext context) {
    return Container(
      width: 24.w,
      height: 24.w,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(4.r),
      ),
    );
  }

  Widget _buildTextShimmer(BuildContext context) {
    return Container(
      width: 200.w,
      height: 14.h,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(4.r),
      ),
    );
  }
}
