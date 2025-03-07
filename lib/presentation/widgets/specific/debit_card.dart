import 'package:aoun_app/core/app_images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DebitCardWidget extends StatelessWidget {
  const DebitCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(7)),
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
            child: Container(
              height: 50,
              width: 50,
              alignment: Alignment.center,
              child: SvgPicture.asset(
                Assets.imageLogoLogo,
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(width: 7),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "•••• •••• •••• 4586",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      "Moahmed Sobhy gafar".toUpperCase(),
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Row(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'VALID THRU',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(
                                    color: Colors.white,
                                    fontSize: 10.sp,
                                  ),
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              "44/64",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp,
                                  ),
                            ),
                          ],
                        ),
                        SizedBox(width: 50.w),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'CVC',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(
                                    color: Colors.white,
                                    fontSize: 10.sp,
                                  ),
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              "484",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
