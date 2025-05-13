import 'package:aoun_app/presentation/widgets/common/review_card_shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class DriverProfileShimmerWidget extends StatefulWidget {
  const DriverProfileShimmerWidget({super.key});

  @override
  State<DriverProfileShimmerWidget> createState() =>
      _DriverProfileScreenState();
}

class _DriverProfileScreenState extends State<DriverProfileShimmerWidget>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(
      animationDuration: const Duration(milliseconds: 300),
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10.h),
                Shimmer.fromColors(
                  baseColor: Theme.of(context).colorScheme.primaryContainer,
                  highlightColor: Theme.of(context).scaffoldBackgroundColor,
                  child: CircleAvatar(
                    maxRadius: 45.w,
                  ),
                ),
                SizedBox(height: 10.h),
                Shimmer.fromColors(
                  baseColor: Theme.of(context).colorScheme.primaryContainer,
                  highlightColor: Theme.of(context).scaffoldBackgroundColor,
                  child: Container(
                    width: 200.w,
                    height: 12.h,
                    decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.all(Radius.circular(7.r))),
                  ),
                ),
                SizedBox(height: 10.h),
                Shimmer.fromColors(
                  baseColor: Theme.of(context).colorScheme.primaryContainer,
                  highlightColor: Theme.of(context).scaffoldBackgroundColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PannableRatingBar(
                        rate: .4,
                        items: List.generate(
                          1,
                          (index) => RatingWidget(
                            selectedColor: Color(0xffffcf4a),
                            unSelectedColor: Colors.grey,
                            child: Icon(
                              Icons.star,
                              size: 20.h,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        "0.0",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        "(0)",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(150.w, double.infinity)),
                  child: Text("Edit profile"),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: TabBar(
                    dividerColor: Theme.of(context).primaryColor,
                    indicatorColor: Colors.transparent,
                    overlayColor: WidgetStatePropertyAll(Colors.transparent),
                    unselectedLabelStyle:
                        Theme.of(context).textTheme.labelSmall!.copyWith(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                            ),
                    controller: _tabController,
                    labelStyle:
                        Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                            ),
                    isScrollable: true,
                    tabAlignment: TabAlignment.center,
                    tabs: [
                      Tab(text: "Overview".toUpperCase()),
                      Tab(text: "Vehicle data".toUpperCase()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
        body: TabBarView(
          physics: const BouncingScrollPhysics(),
          controller: _tabController,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 13.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _InfoCard(),
                        _InfoCard(),
                        _InfoCard(),
                      ],
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) =>
                          ReviewCardShimmerWidget(),
                      itemCount: 5,
                    ),
                  ],
                ),
              ),
            ),
            vehicleDate(),
          ],
        ),
      ),
    );
  }

  Widget vehicleDate() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 13.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              vehicleDocumentCard(),
              vehicleDocumentCard(),
              vehicleDocumentCard(),
            ],
          ),
          SizedBox(height: 7.h),
          Column(children: [
            vehicleInfo(),
            vehicleInfo(),
            vehicleInfo(),
            vehicleInfo(),
            vehicleInfo(),
            vehicleInfo(),
            vehicleInfo(),
          ])
        ],
      ),
    );
  }

  Widget vehicleDocumentCard() => Shimmer.fromColors(
        baseColor: Theme.of(context).colorScheme.primaryContainer,
        highlightColor: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          children: [
            Container(
              height: 100.h,
              width: 100.w,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
              ),
            ),
            SizedBox(height: 5.h),
            SizedBox(
              width: 80.w,
              child: Container(
                height: 9.h,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(7.r)),
                ),
              ),
            ),
          ],
        ),
      );

  Widget vehicleInfo() {
    return Padding(
      padding: EdgeInsets.all(13.0),
      child: Shimmer.fromColors(
        baseColor: Theme.of(context).colorScheme.primaryContainer,
        highlightColor: Theme.of(context).scaffoldBackgroundColor,
        child: Container(
          padding: EdgeInsets.all(10),
          constraints: BoxConstraints(minHeight: 45.h),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
          ),
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.primaryContainer,
      highlightColor: Theme.of(context).scaffoldBackgroundColor,
      child: Container(
        width: 100.w,
        height: 60.h,
        padding: EdgeInsets.all(7.r),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}
