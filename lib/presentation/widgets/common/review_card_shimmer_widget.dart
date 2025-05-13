import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ReviewCardShimmerWidget extends StatelessWidget {
  const ReviewCardShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(13),
      child: Column(
        children: [
          Row(
            children: [
              Shimmer.fromColors(
                baseColor: Theme.of(context).colorScheme.primaryContainer,
                highlightColor: Theme.of(context).scaffoldBackgroundColor,
                child: CircleAvatar(
                  maxRadius: 23.w,
                ),
              ),
              SizedBox(width: 10.w),
              Shimmer.fromColors(
                baseColor: Theme.of(context).colorScheme.primaryContainer,
                highlightColor: Theme.of(context).scaffoldBackgroundColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 7.w),
                    Container(
                      width: 150.w,
                      height: 8.h,
                      decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.all(Radius.circular(7.r))),
                    ),
                    SizedBox(height: 5.w),
                    Row(
                      children: [
                        Text(
                          "(0.0)",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        SizedBox(width: 5.w),
                        PannableRatingBar(
                          rate: 4.5,
                          items: List.generate(
                            5,
                            (index) => RatingWidget(
                              selectedColor: Color(0xffffcf4a),
                              unSelectedColor: Colors.grey,
                              child: Icon(
                                Icons.star,
                                size: 15.h,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Shimmer.fromColors(
            baseColor: Theme.of(context).colorScheme.primaryContainer,
            highlightColor: Theme.of(context).scaffoldBackgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 8.h,
                  decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.all(Radius.circular(7.r))),
                ),
                SizedBox(height: 5.w),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 8.h,
                  decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.all(Radius.circular(7.r))),
                ),
                SizedBox(height: 5.w),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 8.h,
                  decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.all(Radius.circular(7.r))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
