import 'package:aoun_app/presentation/widgets/common/appBar_widget.dart';
import 'package:aoun_app/presentation/widgets/common/review_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DriverProfileScreen extends StatefulWidget {
  const DriverProfileScreen({super.key});

  @override
  State<DriverProfileScreen> createState() => _DriverProfileScreenState();
}

class _DriverProfileScreenState extends State<DriverProfileScreen>
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
      appBar: AppbarWidget(
        title: "Profile",
      ),
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10.h),
                CircleAvatar(
                  maxRadius: 45.w,
                  backgroundColor: Colors.blueGrey,
                ),
                SizedBox(height: 10.h),
                Text(
                  "Mohamed Sobhy Saber",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 20.sp),
                ),
                SizedBox(height: 10.h),
                Row(
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
                      "2.0",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      "(40)",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Edit profile"),
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(150.w, double.infinity)),
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
                        _InfoCard(
                          title: "Rating",
                          value: "4.0",
                        ),
                        _InfoCard(
                          title: "Satisfy",
                          value: "60%",
                        ),
                        _InfoCard(
                          title: "Cancel",
                          value: "8%",
                        ),
                      ],
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => ReviewCardWidget(),
                      itemCount: 50,
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
              vehicleDocumentCard(context, text: "Vehicle picture"),
              vehicleDocumentCard(context,
                  text: "Vehicle registration certificate"),
              vehicleDocumentCard(context, text: "Back side of certificate"),
            ],
          ),
          SizedBox(height: 7.h),
          Column(children: [
            vehicleInfo(title: "Plate Number", value: "1234 | ASD"),
            vehicleInfo(title: "Production Year", value: "2020"),
            vehicleInfo(title: "Vehicle Color", value: "Black"),
            vehicleInfo(title: "Vehicle Model", value: "Civic"),
            vehicleInfo(title: "Vehicle Brand", value: "Honda"),
            vehicleInfo(title: "Number of Seats", value: "4"),
          ])
        ],
      ),
    );
  }

  Widget vehicleDocumentCard(BuildContext context, {required String text}) =>
      Column(
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
            width: 100.w,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    fontSize: 12.sp,
                  ),
            ),
          ),
        ],
      );

  Widget vehicleInfo({
    required String title,
    required String value,
  }) {
    return Padding(
      padding: EdgeInsets.all(13.0),
      child: Container(
        padding: EdgeInsets.all(10),
        constraints: BoxConstraints(minHeight: 45.h),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    fontSize: 14.sp,
                  ),
            ),
            Text(
              value,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final String value;

  const _InfoCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.all(7.r),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  fontSize: 12.sp,
                ),
          ),
          SizedBox(height: 5.h),
          Text(
            value,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 13.sp,
                ),
          ),
        ],
      ),
    );
  }
}
