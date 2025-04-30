import 'dart:developer';
import 'dart:math' as math;

import 'package:animations/animations.dart';
import 'package:aoun_app/core/constant/constant.dart';
import 'package:aoun_app/core/router/route_name.dart';
import 'package:aoun_app/data/model/driver%20models/active_trip_requests/active_trip_requests.dart';
import 'package:aoun_app/presentation/driver/home/view/create_trip_screen.dart';
import 'package:aoun_app/presentation/driver/home/view_model/active%20trip%20request/active_trip_requests_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeDriverScreen extends StatefulWidget {
  const HomeDriverScreen({super.key});

  @override
  State<HomeDriverScreen> createState() => _HomeDriverScreenState();
}

class _HomeDriverScreenState extends State<HomeDriverScreen> {
  List<_SalesData> data = [
    _SalesData('Monday', 35),
    _SalesData('Tuesday', 28),
    _SalesData('Wednesday', 34),
    _SalesData('Thursday', 32),
    _SalesData('Friday', 40),
    _SalesData('Saturday', 40),
    _SalesData('Sunday', 40),
  ];
  @override
  void initState() {
    super.initState();
    context.read<ActiveTripRequestsCubit>().getActiveTripRequests();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Iconsax.notification),
          )
        ],
      ),
      drawer: Container(
        width: MediaQuery.of(context).size.width / 1.6,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(height: 40.h),
              CircleAvatar(
                minRadius: 30.w,
              ),
              SizedBox(height: 7.h),
              Text(
                "Mohamed Sobhy saber",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(height: 15.h),
              Divider(thickness: 1),
              _drawercard(
                icon: Iconsax.user,
                title: "Profile",
                context: context,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(
                      context, AppRoutesName.driverProfileScreenRoute);
                },
              ),
              _drawercard(
                icon: Iconsax.wallet_1,
                title: "Wallet & Earnings",
                context: context,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(
                      context, AppRoutesName.userProfileScreenRoute);
                },
              ),
              _drawercard(
                icon: Iconsax.clock,
                title: "History trips",
                context: context,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(
                      context, AppRoutesName.userProfileScreenRoute);
                },
              ),
              _drawercard(
                icon: Iconsax.shield_tick,
                title: "safety",
                context: context,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(
                      context, AppRoutesName.userProfileScreenRoute);
                },
              ),
              _drawercard(
                icon: Iconsax.support,
                title: "Help & feedback",
                context: context,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(
                      context, AppRoutesName.userProfileScreenRoute);
                },
              ),
              _drawercard(
                icon: Iconsax.setting,
                title: "Setting",
                context: context,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(
                      context, AppRoutesName.driverSettingScreenRoute);
                },
              ),
            ],
          ),
        ),
      ),
      drawerEdgeDragWidth: MediaQuery.of(context).size.width / 3,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 13.0,
          ),
          child: Column(
            children: [
              Container(
                height: 70.h,
                width: MediaQuery.of(context).size.width,
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
                      "Balance Your",
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            fontSize: 14.sp,
                          ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      "\$ 144.05",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _InfoCard(title: "Earnings summary", value: "\$ 2.1588,465"),
                  _InfoCard(title: "Completed trip count", value: "123 trips"),
                ],
              ),
              SizedBox(height: 10.h),
              SizedBox(
                height: 200.h,
                child: SfCartesianChart(
                  enableAxisAnimation: true,
                  primaryXAxis: CategoryAxis(
                    axisLine: AxisLine(width: 0),
                    majorGridLines: MajorGridLines(width: 0),
                    majorTickLines: MajorTickLines(width: 0),
                    labelStyle:
                        TextStyle(fontSize: 12.sp, color: Colors.teal[800]),
                  ),
                  primaryYAxis: NumericAxis(
                    minimum: 0,
                    maximum: 50,
                    interval: 7,
                    axisLine: AxisLine(width: 0),
                    majorGridLines: MajorGridLines(color: Colors.grey.shade300),
                    majorTickLines: MajorTickLines(width: 0),
                    labelStyle: TextStyle(
                      fontSize: 12.sp,
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                  ),
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <CartesianSeries<_SalesData, String>>[
                    ColumnSeries<_SalesData, String>(
                      width: 0.2,
                      dataSource: data,
                      xValueMapper: (_SalesData sales, _) => sales.year,
                      yValueMapper: (_SalesData sales, _) => sales.sales,
                      name: 'Sales',
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, AppRoutesName.createTripScreenRoute);
                  },
                  child: Text("Create a trip")),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Resent orders",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
              BlocBuilder<ActiveTripRequestsCubit, ActiveTripRequestsState>(
                builder: (context, state) {
                  if (state is ActiveTripRequestsSuccess) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.tripList.length,
                      itemBuilder: (context, index) {
                        return _recentOrderWidget(
                            context, state.tripList[index]);
                      },
                    );
                  } else if (state is ActiveTripRequestsFailure) {
                    log(state.errorMessage);
                    return Center(child: Text(state.errorMessage));
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawercard(
      {required String title,
      required IconData icon,
      required BuildContext context,
      required void Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Icon(icon),
            SizedBox(
              width: 7.w,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 17.sp,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _recentOrderWidget(BuildContext context, ActiveTripRequests model) {
    return OpenContainer(
      closedElevation: 0,
      openElevation: 0,
      closedColor: Theme.of(context).scaffoldBackgroundColor,
      transitionType: ContainerTransitionType.fadeThrough,
      openBuilder: (context, action) => CreateTripScreen(),
      closedBuilder: (context, action) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Container(
          height: 80.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
          child: Row(
            children: [
              SizedBox(width: 7.w),
              Container(
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.r),
                  border: Border.all(
                    width: 1,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                child: Icon(Iconsax.profile_2user),
              ),
              SizedBox(width: 7.w),
              _TripDetails(model),
              const Spacer(),
              Icon(isRTL(context)
                  ? Iconsax.arrow_left_2
                  : Iconsax.arrow_right_3),
              SizedBox(width: 7.w),
            ],
          ),
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
      width: MediaQuery.of(context).size.width / 2 - 20,
      height: 65.h,
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
                  fontSize: 16.sp,
                ),
          ),
        ],
      ),
    );
  }
}

class _TripDetails extends StatelessWidget {
  ActiveTripRequests model;
  _TripDetails(this.model);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _TripDetailRow(
            iconRotation: math.pi / 4,
            label: "From: ${model.fromLocation!.fullAddress}"),
        _TripDetailRow(
            iconRotation: -3 * math.pi / 4,
            label: "To: ${model.toLocation!.fullAddress}"),
        _TripDetailRow(
            icon: Iconsax.map_1,
            label: " Active passengers: ${model.activePassengers}"),
      ],
    );
  }
}

class _TripDetailRow extends StatelessWidget {
  final double? iconRotation;
  final IconData icon;
  final String label;

  const _TripDetailRow({
    this.iconRotation,
    this.icon = Iconsax.arrow_right_1,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        iconRotation != null
            ? Transform.rotate(
                angle: iconRotation!,
                child: Icon(icon, size: 20.w),
              )
            : Icon(icon, size: 17.w),
        SizedBox(width: 2.w),
        SizedBox(
          width: 220.w,
          child: Text(
            label,
            style: Theme.of(context).textTheme.labelSmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
