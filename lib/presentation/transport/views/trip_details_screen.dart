import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:aoun_app/core/constant/constant.dart';
import 'package:aoun_app/presentation/transport/views/mapViewRoute_screen.dart';
import 'package:aoun_app/presentation/widgets/specific/trip_map.dart'
    show TripMapWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax/iconsax.dart';

class TripDetailsScreen extends StatefulWidget {
  const TripDetailsScreen({super.key});

  @override
  State<TripDetailsScreen> createState() => _TripDetailsScreenState();
}

class _TripDetailsScreenState extends State<TripDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  final itemsInfotrip = [
    {"title": "Departure date", "value": "Today / 16:00 AM"},
    {"title": "Estimated Distance", "value": "220 KM"},
    {"title": "Estimated Arrival Time", "value": "2h 30min"},
    {"title": "Available Seats", "value": "3 Seats"},
  ];
  final itemsInfoDriver = [
    {"title": "Car Model", "value": "Toyota Corolla 2022"},
    {"title": "Seats", "value": "License Plate :"},
    {"title": "License Plate", "value": "ABC-1234"},
  ];
  final List<Map<String, dynamic>> ratings = [
    {"title": "Driving skills", "value": 1.0},
    {"title": "Punctuality", "value": 0.2},
    {"title": "Behavior", "value": 0.9},
    {"title": "Pricing", "value": 0.75},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            isRTL(context) ? Iconsax.arrow_right_1 : Iconsax.arrow_left,
            size: 30,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        title: Text(
          "Trip detail",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Iconsax.share),
          ),
        ],
      ),
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13.0),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 6,
                          spreadRadius: 2,
                          offset: Offset(2, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 23.h),
                          child: Column(
                            children: [
                              _buildCircle(Theme.of(context).primaryColor),
                              SizedBox(
                                width: 0,
                                height: 65.h,
                                child: CustomPaint(
                                  painter: DottedGradientLinePainter(
                                    gradient: LinearGradient(
                                      colors: [
                                        Theme.of(context).primaryColor,
                                        Theme.of(context).secondaryHeaderColor
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                  ),
                                ),
                              ),
                              _buildCircle(
                                  Theme.of(context).secondaryHeaderColor),
                            ],
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "From",
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                            Text(
                              "Cairo, Egypt",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            SizedBox(height: 30.h),
                            Text(
                              "To",
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                            Text(
                              "Alexandria, Egypt",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                TabBar(
                  dividerColor: Colors.transparent,
                  indicatorColor: Colors.transparent,
                  overlayColor: WidgetStatePropertyAll(Colors.transparent),
                  unselectedLabelStyle:
                      Theme.of(context).textTheme.labelSmall!.copyWith(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                          ),
                  controller: _tabController,
                  labelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  tabs: [
                    Tab(text: "Basic Trip Info".toUpperCase()),
                    Tab(text: "Driver Info".toUpperCase()),
                    Tab(text: "Additional Info".toUpperCase()),
                  ],
                ),
              ],
            ),
          )
        ],
        body: TabBarView(
          physics: const BouncingScrollPhysics(),
          controller: _tabController,
          children: [
            _BasicTripInfo(),
            _DriverInfo(),
            _AdditionalInfo(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shadowColor: Colors.black,
        elevation: 10,
        height: 60.h,
        child: Row(
          children: [
            Text(
              "\$ 7.00",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Spacer(),
            SizedBox(
              width: 140.w,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Book"),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _AdditionalInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _titleWidget(context, "Pickup Point"),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Text(
                "Downtown Cairo - Gate 5",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Text(
              "View in map",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
            SizedBox(height: 7.h),
            TripMapWidget(),
            _divider(),
            _titleWidget(context, "Driver Notes"),
            SizedBox(height: 7.h),
            Column(
              children: List.generate(
                5,
                (index) => _DriverNote(),
              ),
            ),
            _divider(),
            _titleWidget(context, "Amenities"),
            Row(
              children: List.generate(
                3,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.all(Radius.circular(12.r))),
                    child: Text("Charge"),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _DriverNote() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
      child: Text(
        "• Downtown Cairo - Gate 5",
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }

  Widget _DriverInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  maxRadius: 33.h,
                ),
                SizedBox(width: 20.w),
                Text(
                  "Mohamed Sobhy",
                  style: Theme.of(context).textTheme.titleSmall,
                )
              ],
            ),
            SizedBox(height: 10.h),
            Text(
              "I am a lifelong explorer and entrepreneur. I have lived all over the U.S., born in Hawaii, and lived in Belgium. I have traveled across Europe, Australia, Bulgaria, Canada, Mexico, Belize, and Grand Cayman.... Read More",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            _divider(),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: itemsInfoDriver.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.h,
                crossAxisSpacing: 8.w,
                childAspectRatio: 2.5,
              ),
              itemBuilder: (context, index) {
                return _InfoCard(
                  title: itemsInfoDriver[index]["title"]!,
                  value: itemsInfoDriver[index]["value"]!,
                );
              },
            ),
            _divider(),
            Row(
              children: [
                _titleWidget(context, "Rating"),
                Spacer(),
                PannableRatingBar(
                  rate: 3.5,
                  items: List.generate(
                    5,
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
                Text(
                  "(3.2)",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Column(
              children: List.generate(ratings.length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 120,
                        child: Text(
                          ratings[index]["title"],
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ),
                      Expanded(
                        child: LinearProgressIndicator(
                          value: ratings[index]["value"],
                          backgroundColor: Colors.grey[200],
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(5),
                          minHeight: 6,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
            _divider(),
            _titleWidget(context, "Last Reviews"),
            Column(
              children: List.generate(
                5,
                (index) => _ReviewCard(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _ReviewCard() {
    return Container(
      padding: EdgeInsets.all(13),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                maxRadius: 25.w,
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
                            .copyWith(fontSize: 15.sp),
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
                        style: Theme.of(context).textTheme.bodyMedium,
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

  Widget _BasicTripInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: itemsInfotrip.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.h,
                crossAxisSpacing: 8.w,
                childAspectRatio: 2.5,
              ),
              itemBuilder: (context, index) {
                return _InfoCard(
                  title: itemsInfotrip[index]["title"]!,
                  value: itemsInfotrip[index]["value"]!,
                );
              },
            ),
            _divider(),
            _titleWidget(context, "Display Route in map"),
            SizedBox(height: 20.h),
            TripMapWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildCircle(Color color) {
    return Container(
      width: 8.h,
      height: 8.h,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }

  Widget _divider() {
    return Divider(
      endIndent: 30.w,
      indent: 30.w,
      thickness: .7,
      height: 40.h,
    );
  }

  Widget _titleWidget(BuildContext context, String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleSmall!.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 17.sp,
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

class DottedGradientLinePainter extends CustomPainter {
  final Gradient gradient;

  DottedGradientLinePainter({required this.gradient});

  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 5, spaceHeight = 5;
    double startY = 0;

    final paint = Paint()
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..shader =
          gradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + spaceHeight;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
