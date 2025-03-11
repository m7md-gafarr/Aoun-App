import 'package:aoun_app/core/constant/constant.dart';
import 'package:aoun_app/presentation/widgets/specific/debit_card.dart';
import 'package:aoun_app/presentation/widgets/specific/trip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class TransportScreen extends StatelessWidget {
  const TransportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverPadding(
        padding: EdgeInsets.symmetric(horizontal: 13),
        sliver: SliverToBoxAdapter(
          child: SizedBox(
            height: 160.h,
            child: CardSwiper(
              cardsCount: 3,
              isLoop: true,
              numberOfCardsDisplayed: 3,
              padding: EdgeInsets.zero,
              backCardOffset: const Offset(0, 20),
              scale: 0.9,
              cardBuilder:
                  (context, index, percentThresholdX, percentThresholdY) {
                return DebitCardWidget();
              },
            ),
          ),
        ),
      ),
      SliverPadding(
        padding: EdgeInsets.symmetric(horizontal: 50),
        sliver: SliverToBoxAdapter(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Column(
                children: [
                  SizedBox(height: 40.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 13),
                    height: 40.h,
                    width: 350.w,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.all(Radius.circular(7))),
                    child: Row(
                      children: [
                        Icon(
                          Iconsax.location,
                          size: 22.w,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "AZ Zafaran",
                          style: Theme.of(context).textTheme.labelMedium,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 13),
                    height: 40.h,
                    width: 350.w,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.all(Radius.circular(7))),
                    child: Row(
                      children: [
                        Icon(
                          Iconsax.search_normal,
                          size: 22.w,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "To",
                          style: Theme.of(context).textTheme.labelMedium,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 70.h,
                right: -25,
                child: Container(
                  height: 40.h,
                  width: 40.h,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(7))),
                  child: Icon(
                    Iconsax.arrow_3,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
              )
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
            "Lasted",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return TripWidget();
          },
          childCount: 10,
        ),
      ),
    ]);
  }
}
