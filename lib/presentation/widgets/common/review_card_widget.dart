import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewCardWidget extends StatelessWidget {
  const ReviewCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(13),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                maxRadius: 23.w,
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 5.w),
                  Row(
                    children: [
                      Text(
                        "Stephanie",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 14.sp),
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        "October, 2019",
                        style: Theme.of(context).textTheme.labelSmall,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "(4.5)",
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
              )
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            "This is a great way to experience the Grand Canyon from Phoenix. I could never have done this trip on my own... Read More",
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
