import 'package:animations/animations.dart';
import 'package:aoun_app/core/app_color/app_color_dark.dart';
import 'package:aoun_app/core/app_images/app_images.dart';
import 'package:aoun_app/core/constant/constant.dart';
import 'package:aoun_app/core/router/route_name.dart';
import 'package:aoun_app/core/utils/map/google_map.dart';
import 'package:aoun_app/data/model/map%20models/route_model/route_model.dart';
import 'package:aoun_app/data/model/trip%20models/trip_model/trip_model.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:aoun_app/presentation/user/transport/view/map_view_pickup_point_screen.dart';
import 'package:aoun_app/presentation/widgets/common/appBar_widget.dart';
import 'package:aoun_app/presentation/widgets/common/divider_widget.dart';
import 'package:aoun_app/presentation/widgets/common/review_card_widget.dart';
import 'package:aoun_app/presentation/widgets/common/title_Info_trip_widget.dart';
import 'package:aoun_app/presentation/widgets/trip_map.dart' show TripMapWidget;
import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax/iconsax.dart';

class TripDetailsScreen extends StatefulWidget {
  TripDetailsScreen({super.key, this.tripModel});
  TripModel? tripModel;
  @override
  State<TripDetailsScreen> createState() => _TripDetailsScreenState();
}

class _TripDetailsScreenState extends State<TripDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late dynamic itemsInfotrip, itemsInfoDriver, ratings;
  RouteModel? routeModel;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    getRoute();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    itemsInfotrip = [
      {
        "title": S.of(context).trip_details_departure_date,
        "value": "${widget.tripModel!.basicInfo!.formattedDepartureTime}"
      },
      {
        "title": S.of(context).trip_details_estimated_distance,
        "value": "${widget.tripModel!.basicInfo!.formattedDistance}"
      },
      {
        "title": S.of(context).trip_details_estimated_arrival,
        "value": "${widget.tripModel!.basicInfo!.formattedDuration}"
      },
      {
        "title": S.of(context).trip_details_available_seats,
        "value":
            "${widget.tripModel!.basicInfo!.availableSeats} ${S.of(context).trip_details_seats_suffix}"
      },
    ];

    itemsInfoDriver = [
      {
        "title": S.of(context).trip_details_car_model,
        "value": "${widget.tripModel!.driverInfo!.vehicleInfo!.vehicleModel}"
      },
      {
        "title": S.of(context).trip_details_seats,
        "value": "${widget.tripModel!.driverInfo!.vehicleInfo!.seatingCapacity}"
      },
      {
        "title": S.of(context).trip_details_license_plate,
        "value": "${widget.tripModel!.driverInfo!.vehicleInfo!.plateNumber}"
      },
      {
        "title": S.of(context).trip_details_mobile_number,
        "value": "${widget.tripModel!.driverInfo!.driverPhone}"
      },
    ];

    ratings = [
      {"title": S.of(context).trip_details_rating_driving_skills, "value": 1.0},
      {"title": S.of(context).trip_details_rating_punctuality, "value": 0.2},
      {"title": S.of(context).trip_details_rating_behavior, "value": 0.9},
      {"title": S.of(context).trip_details_rating_pricing, "value": 0.75},
    ];
  }

  getRoute() async {
    final route = await GoogleMapUtils().getRoute(
      LatLng(widget.tripModel!.fromLocation!.latitude!,
          widget.tripModel!.fromLocation!.longitude!),
      LatLng(widget.tripModel!.toLocation!.latitude!,
          widget.tripModel!.toLocation!.longitude!),
    );
    if (!mounted) return;
    setState(() {
      routeModel = route;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: S.of(context).trip_details_title,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.share),
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
                    height: 180.h,
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
                                height: 80.h,
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
                              S.of(context).trip_details_from,
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                            SizedBox(
                              width: 280.w,
                              child: Text(
                                "${widget.tripModel!.fromLocation!.fullAddress}",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      fontFamily: isArabicText(widget.tripModel!
                                              .fromLocation!.fullAddress!)
                                          ? fontArabic
                                          : fontEnglish,
                                    ),
                              ),
                            ),
                            SizedBox(height: 42.h),
                            Text(
                              S.of(context).trip_details_to,
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                            SizedBox(
                              width: 280.w,
                              child: Text(
                                "${widget.tripModel!.toLocation!.fullAddress}",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      fontFamily: isArabicText(widget.tripModel!
                                              .toLocation!.fullAddress!)
                                          ? fontArabic
                                          : fontEnglish,
                                    ),
                              ),
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
                    Tab(
                        text: S
                            .of(context)
                            .trip_details_basic_info
                            .toUpperCase()),
                    Tab(
                        text: S
                            .of(context)
                            .trip_details_driver_info
                            .toUpperCase()),
                    Tab(
                        text: S
                            .of(context)
                            .trip_details_additional_info
                            .toUpperCase()),
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
              "\$ ${widget.tripModel!.pricePerSeat}",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Spacer(),
            widget.tripModel!.basicInfo!.availableSeats != 0
                ? SizedBox(
                    width: 140.w,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutesName.bookTripScreenRoute,
                          arguments: [widget.tripModel, routeModel],
                        );
                      },
                      child: Text(S.of(context).trip_details_book),
                    ),
                  )
                : Text(
                    S.of(context).trip_details_completed_booking,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: AppColorDark.errorColor,
                          fontWeight: FontWeight.bold,
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
            TitleInfoTripWidget(title: S.of(context).trip_details_pickup_point),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Text(
                "${widget.tripModel!.additionalInfo!.startingPoint}",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontFamily: isArabicText(
                              widget.tripModel!.additionalInfo!.startingPoint!)
                          ? fontArabic
                          : fontEnglish,
                    ),
              ),
            ),
            Text(
              S.of(context).trip_details_view_map,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
            SizedBox(height: 7.h),
            SizedBox(
              height: 180.h,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15.r)),
                child: OpenContainer(
                  closedElevation: 0,
                  openElevation: 0,
                  transitionType: ContainerTransitionType.fadeThrough,
                  openBuilder: (context, action) => MapViewPickupPointScreen(
                    locationModel: widget.tripModel!.fromLocation!,
                  ),
                  closedBuilder: (context, action) => GestureDetector(
                    onTap: action,
                    child: Image.asset(
                      Assets.imageMapMakerMap,
                    ),
                  ),
                ),
              ),
            ),
            DividerWidget(),
            TitleInfoTripWidget(title: S.of(context).trip_details_driver_notes),
            SizedBox(height: 7.h),
            _DriverNote(widget.tripModel!.additionalInfo!.notes!),
            DividerWidget(),
            TitleInfoTripWidget(title: S.of(context).trip_details_amenities),
            Wrap(
              spacing: 0,
              runSpacing: 0,
              children: List.generate(
                widget.tripModel!.additionalInfo!.amenities!.length,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.all(Radius.circular(12.r)),
                    ),
                    child: Text(
                      widget.tripModel!.additionalInfo!.amenities![index],
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _DriverNote(String note) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
      child: Text(
        "• $note",
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontFamily: isArabicText(note) ? fontArabic : fontEnglish,
            ),
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
                ClipOval(
                  child: Image.network(
                    "https://studentpathapitest.runasp.net/${widget.tripModel!.driverInfo!.personalPhotoPath!.replaceAll(r'\\', '/')}",
                    width: 70.w,
                    height: 70.w,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        Icon(Icons.error),
                  ),
                ),
                SizedBox(width: 20.w),
                Text(
                  "${widget.tripModel!.driverInfo!.driverName}",
                  style: Theme.of(context).textTheme.titleSmall,
                )
              ],
            ),
            DividerWidget(),
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
            DividerWidget(),
            Row(
              children: [
                TitleInfoTripWidget(
                    title: S.of(context).trip_details_rating_title),
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
                        fontSize: 13.sp,
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
            DividerWidget(),
            TitleInfoTripWidget(title: S.of(context).trip_details_last_reviews),
            Column(
              children: List.generate(
                5,
                (index) => ReviewCardWidget(),
              ),
            )
          ],
        ),
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
            DividerWidget(),
            TitleInfoTripWidget(
                title: S.of(context).trip_details_display_route),
            SizedBox(height: 20.h),
            TripMapWidget(routeModel: routeModel),
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
