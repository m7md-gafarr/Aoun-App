import 'package:aoun_app/core/app_images/app_images.dart';
import 'package:aoun_app/core/constant/constant.dart';
import 'package:aoun_app/data/model/service_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreenWidget extends StatelessWidget {
  final Function(int) onServiceTap;
  const HomeScreenWidget({super.key, required this.onServiceTap});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          floating: true,
          pinned: false,
          actions: [
            SizedBox(width: 13),
            Text(
              "Welcome Sokar ,",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Spacer(
              flex: 1,
            ),
            Icon(
              Iconsax.notification,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(width: 13),
          ],
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 110.h,
            child: Stack(
              children: [
                Positioned(
                  top: 90.h,
                  left: isRTL(context) ? null : 25.h,
                  right: isRTL(context) ? 25.h : null,
                  child: SvgPicture.asset(
                    Assets.imageLine,
                    width: 150.w,
                  ),
                ),
                Positioned(
                  left: isRTL(context) ? 0 : 13,
                  right: isRTL(context) ? 13 : 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Move easily,\nexplore freely,",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            "find opportunities!",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                      SvgPicture.asset(
                        Assets.imageLogoLogo,
                        width: 110.w,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(
              left: isRTL(context) ? 0 : 13,
              right: isRTL(context) ? 13 : 0,
              bottom: 7.h,
              top: 7.h,
            ),
            child: Text(
              "What do you need today?",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 16.sp,
                  ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: ServiceModel.service(context)
                .asMap()
                .entries
                .map(
                  (e) => InkWell(
                    onTap: () {
                      onServiceTap(e.key + 1);
                    },
                    child: Container(
                      height: 80.h,
                      width: 110.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12).r,
                        ),
                        color: Theme.of(context).colorScheme.primaryContainer,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 45.w,
                            width: 45.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100).r),
                            ),
                            child: SvgPicture.asset(
                              e.value.path,
                              height: 25.w,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Text(
                            e.value.text,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                    color:
                                        Theme.of(context).secondaryHeaderColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(
              left: isRTL(context) ? 0 : 13,
              right: isRTL(context) ? 13 : 0,
              bottom: 7.h,
              top: 7.h,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200.w,
                  child: Text(
                    "Most Popular Locations at Your Fingertips",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 16.sp,
                        ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "View more",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Theme.of(context).primaryColor),
                    ),
                    Icon(
                      Iconsax.arrow_left,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                height: 50,
                color: Colors.teal[100 * ((index % 8) + 1)],
                child: Center(child: Text('Item #$index')),
              );
            },
            childCount: 20,
          ),
        ),
      ],
    );
  }
}
