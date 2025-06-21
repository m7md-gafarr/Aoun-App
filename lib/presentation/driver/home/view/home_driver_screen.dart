import 'dart:math' as math;
import 'package:aoun_app/core/app_images/app_images.dart';
import 'package:aoun_app/core/constant/constant.dart';
import 'package:aoun_app/core/router/route_name.dart';
import 'package:aoun_app/core/utils/check_connection/check_connection_cubit.dart';
import 'package:aoun_app/core/utils/location/location_Provider.dart';
import 'package:aoun_app/data/model/trip_models/active_trip_requests/active_trip_requests.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:aoun_app/presentation/driver/home/view_model/active_trip_request/active_trip_requests_cubit.dart';
import 'package:aoun_app/presentation/driver/home/view_model/driver_create_trip_or_not/driver_create_trip_or_not_cubit.dart';
import 'package:aoun_app/presentation/driver/home/view_model/driver%20dashboard/driver_dashboard_cubit.dart';
import 'package:aoun_app/presentation/driver/profile/view_model/get_driver_data/get_driver_data_cubit.dart';
import 'package:aoun_app/presentation/widgets/common/empty_data.dart';
import 'package:aoun_app/presentation/widgets/internet/no_internet_widget.dart';
import 'package:aoun_app/presentation/widgets/shimmer/trip_shimmer_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shimmer/shimmer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeDriverScreen extends StatefulWidget {
  const HomeDriverScreen({super.key});

  @override
  State<HomeDriverScreen> createState() => _HomeDriverScreenState();
}

class _HomeDriverScreenState extends State<HomeDriverScreen> {
  @override
  void initState() {
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   context.read<LocationProvider>().startListening(context);
  //   context.read<ActiveTripRequestsCubit>().getActiveTripRequests();
  //   context.read<GetDriverDataCubit>().getDriverData(context);
  //   context.read<DriverCreateTripOrNotCubit>().driverCreateTripOrNot(context);
  //   context.read<DriverDashboardCubit>().getDashboard();
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {},
            icon: Icon(Iconsax.notification),
          ),
        ],
      ),
      drawer: BlocBuilder<CheckConnectionCubit, CheckConnectionState>(
        builder: (context, state) {
          if (state is CheckConnectionHasInternet ||
              state is CheckConnectionLoading) {
            return Container(
              width: MediaQuery.of(context).size.width / 1.6,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    SizedBox(height: 40.h),
                    BlocBuilder<GetDriverDataCubit, GetDriverDataState>(
                      builder: (context, state) {
                        if (state is GetDriverDataSucess &&
                            state.driverdata != null) {
                          return SizedBox(
                            height: 115.h,
                            child: Column(
                              children: [
                                ClipOval(
                                  child: Image.network(
                                    "https://studentpathapitest.runasp.net/${state.driverdata.data!.imgUrl!.replaceAll(r'\\', '/')}",
                                    width: 70.w,
                                    height: 70.w,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Icon(Icons.error),
                                  ),
                                ),
                                SizedBox(height: 7.h),
                                Text(
                                  state.driverdata.data!.userName!,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ],
                            ),
                          );
                        } else {
                          return SizedBox(
                            height: 100.h,
                            child: Column(
                              children: [
                                Shimmer.fromColors(
                                  baseColor: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                  highlightColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  child: CircleAvatar(
                                    maxRadius: 30.w,
                                  ),
                                ),
                                SizedBox(height: 7.h),
                                Shimmer.fromColors(
                                  baseColor: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                  highlightColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  child: Container(
                                    width: 150.w,
                                    height: 8.h,
                                    decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(7.r))),
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Shimmer.fromColors(
                                  baseColor: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                  highlightColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  child: Container(
                                    width: 50.w,
                                    height: 8.h,
                                    decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(7.r))),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                    ),
                    SizedBox(height: 15.h),
                    Divider(thickness: 1),
                    _drawercard(
                      icon: Iconsax.user,
                      title: S.of(context).home_driver_drawer_profile,
                      context: context,
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(
                            context, AppRoutesName.driverProfileScreenRoute);
                      },
                    ),
                    _drawercard(
                      icon: Iconsax.wallet_1,
                      title: S.of(context).home_driver_drawer_wallet,
                      context: context,
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context,
                            AppRoutesName.driverWalletAndEarningsScreenRoute);
                      },
                    ),
                    _drawercard(
                      icon: Iconsax.clock,
                      title: S.of(context).home_driver_drawer_history,
                      context: context,
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context,
                            AppRoutesName.driverHistoryTripsScreenRoute);
                      },
                    ),
                    _drawercard(
                      icon: Iconsax.shield_tick,
                      title: S.of(context).home_driver_drawer_safety,
                      context: context,
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(
                            context, AppRoutesName.driverSafetyScreenRoute);
                      },
                    ),
                    _drawercard(
                      icon: Iconsax.support,
                      title: S.of(context).home_driver_drawer_help,
                      context: context,
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context,
                            AppRoutesName.driverHelpFeedbackScreenRoute);
                      },
                    ),
                    _drawercard(
                      icon: Iconsax.setting,
                      title: S.of(context).home_driver_drawer_settings,
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
            );
          } else {
            return Container(
              width: MediaQuery.of(context).size.width / 1.6,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    SizedBox(height: 40.h),
                    SizedBox(
                      height: 115.h,
                      child: Column(
                        children: [
                          CircleAvatar(
                            maxRadius: 40.w,
                            backgroundImage: const AssetImage(Assets.imageUser)
                                as ImageProvider,
                          ),
                          SizedBox(height: 7.h),
                          Text(
                            "Gest",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Divider(thickness: 1),
                    _drawercard(
                      icon: Iconsax.user,
                      title: S.of(context).home_driver_drawer_profile,
                      context: context,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    _drawercard(
                      icon: Iconsax.wallet_1,
                      title: S.of(context).home_driver_drawer_wallet,
                      context: context,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    _drawercard(
                      icon: Iconsax.clock,
                      title: S.of(context).home_driver_drawer_history,
                      context: context,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    _drawercard(
                      icon: Iconsax.shield_tick,
                      title: S.of(context).home_driver_drawer_safety,
                      context: context,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    _drawercard(
                      icon: Iconsax.support,
                      title: S.of(context).home_driver_drawer_help,
                      context: context,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    _drawercard(
                      icon: Iconsax.setting,
                      title: S.of(context).home_driver_drawer_settings,
                      context: context,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
      drawerEdgeDragWidth: MediaQuery.of(context).size.width / 3,
      body: BlocListener<CheckConnectionCubit, CheckConnectionState>(
        listener: (context, state) {
          if (state is CheckConnectionHasInternet) {
            context.read<LocationProvider>().startListening(context);
            context.read<ActiveTripRequestsCubit>().getActiveTripRequests();
            context.read<GetDriverDataCubit>().getDriverData(context);
            context
                .read<DriverCreateTripOrNotCubit>()
                .driverCreateTripOrNot(context);
            context.read<DriverDashboardCubit>().getDashboard();
          }
        },
        child: BlocBuilder<CheckConnectionCubit, CheckConnectionState>(
          builder: (context, state) {
            if (state is CheckConnectionHasInternet ||
                state is CheckConnectionLoading) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 13.0,
                  ),
                  child: Column(
                    children: [
                      BlocBuilder<DriverDashboardCubit, DriverDashboardState>(
                        builder: (context, state) {
                          if (state is DriverDashboardSuccess) {
                            return Builder(builder: (context) {
                              return Column(
                                children: [
                                  Container(
                                    height: 70.h,
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.all(7.r),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primaryContainer,
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          S
                                              .of(context)
                                              .home_driver_balance_title,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall!
                                              .copyWith(
                                                fontSize: 14.sp,
                                              ),
                                        ),
                                        SizedBox(height: 5.h),
                                        Text(
                                          "\$ ${state.dashboardModel.balance!.toStringAsFixed(1)}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall
                                              ?.copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.sp,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      _InfoCard(
                                        title: S
                                            .of(context)
                                            .home_driver_earnings_summary,
                                        value:
                                            "\$ ${state.dashboardModel.earningsSummary!.toStringAsFixed(1)}",
                                      ),
                                      _InfoCard(
                                        title: S
                                            .of(context)
                                            .home_driver_completed_trips,
                                        value: S.of(context).trip(state
                                            .dashboardModel
                                            .completedTripsCount!),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.h),
                                  SizedBox(
                                    height: 200.h,
                                    child: SfCartesianChart(
                                      enableAxisAnimation: true,
                                      primaryXAxis: CategoryAxis(
                                        axisLine: AxisLine(width: 0),
                                        majorGridLines:
                                            MajorGridLines(width: 0),
                                        majorTickLines:
                                            MajorTickLines(width: 0),
                                        maximumLabels: 7,
                                        labelRotation: -45,
                                        labelIntersectAction:
                                            AxisLabelIntersectAction.rotate45,
                                        labelPlacement:
                                            LabelPlacement.betweenTicks,
                                        labelStyle: TextStyle(
                                          fontSize: 12.sp,
                                          color: Theme.of(context)
                                              .secondaryHeaderColor,
                                        ),
                                      ),
                                      primaryYAxis: NumericAxis(
                                        minimum: 0,
                                        maximum: [
                                              state.dashboardModel.weeklyStats!
                                                  .monday!
                                                  .toDouble(),
                                              state.dashboardModel.weeklyStats!
                                                  .tuesday!
                                                  .toDouble(),
                                              state.dashboardModel.weeklyStats!
                                                  .wednesday!
                                                  .toDouble(),
                                              state.dashboardModel.weeklyStats!
                                                  .thursday!
                                                  .toDouble(),
                                              state.dashboardModel.weeklyStats!
                                                  .friday!
                                                  .toDouble(),
                                              state.dashboardModel.weeklyStats!
                                                  .saturday!
                                                  .toDouble(),
                                              state.dashboardModel.weeklyStats!
                                                  .sunday!
                                                  .toDouble(),
                                            ].reduce((a, b) => a > b ? a : b) +
                                            4,
                                        interval: [
                                              state.dashboardModel.weeklyStats!
                                                  .monday!
                                                  .toDouble(),
                                              state.dashboardModel.weeklyStats!
                                                  .tuesday!
                                                  .toDouble(),
                                              state.dashboardModel.weeklyStats!
                                                  .wednesday!
                                                  .toDouble(),
                                              state.dashboardModel.weeklyStats!
                                                  .thursday!
                                                  .toDouble(),
                                              state.dashboardModel.weeklyStats!
                                                  .friday!
                                                  .toDouble(),
                                              state.dashboardModel.weeklyStats!
                                                  .saturday!
                                                  .toDouble(),
                                              state.dashboardModel.weeklyStats!
                                                  .sunday!
                                                  .toDouble(),
                                            ].reduce((a, b) => a < b ? a : b) +
                                            1,
                                        axisLine: AxisLine(width: 0),
                                        majorGridLines: MajorGridLines(
                                            color: Colors.grey.shade300),
                                        majorTickLines:
                                            MajorTickLines(width: 0),
                                        labelStyle: TextStyle(
                                          fontSize: 12.sp,
                                          color: Theme.of(context)
                                              .secondaryHeaderColor,
                                        ),
                                      ),
                                      tooltipBehavior:
                                          TooltipBehavior(enable: true),
                                      series: <CartesianSeries<_SalesData,
                                          String>>[
                                        ColumnSeries<_SalesData, String>(
                                          width: 0.2,
                                          dataSource: [
                                            _SalesData(
                                                S
                                                    .of(context)
                                                    .home_driver_monday,
                                                state.dashboardModel
                                                    .weeklyStats!.monday!),
                                            _SalesData(
                                                S
                                                    .of(context)
                                                    .home_driver_tuesday,
                                                state.dashboardModel
                                                    .weeklyStats!.tuesday!),
                                            _SalesData(
                                                S
                                                    .of(context)
                                                    .home_driver_wednesday,
                                                state.dashboardModel
                                                    .weeklyStats!.wednesday!),
                                            _SalesData(
                                                S
                                                    .of(context)
                                                    .home_driver_thursday,
                                                state.dashboardModel
                                                    .weeklyStats!.thursday!),
                                            _SalesData(
                                                S
                                                    .of(context)
                                                    .home_driver_friday,
                                                state.dashboardModel
                                                    .weeklyStats!.friday!),
                                            _SalesData(
                                                S
                                                    .of(context)
                                                    .home_driver_saturday,
                                                state.dashboardModel
                                                    .weeklyStats!.saturday!),
                                            _SalesData(
                                                S
                                                    .of(context)
                                                    .home_driver_sunday,
                                                state.dashboardModel
                                                    .weeklyStats!.sunday!),
                                          ],
                                          xValueMapper: (_SalesData sales, _) =>
                                              sales.year,
                                          yValueMapper: (_SalesData sales, _) =>
                                              sales.sales,
                                          name: S
                                              .of(context)
                                              .home_driver_chart_sales,
                                          color: Theme.of(context).primaryColor,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(5),
                                            topRight: Radius.circular(5),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            });
                          } else {
                            return Shimmer.fromColors(
                              baseColor: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              highlightColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              enabled: true,
                              child: Container(
                                height: 360.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.r),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 70.h,
                                      width: MediaQuery.of(context).size.width,
                                      padding: EdgeInsets.all(7.r),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.r),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 15.h,
                                            width: 100.w,
                                            padding: EdgeInsets.all(7.r),
                                            decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .scaffoldBackgroundColor,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5.r))),
                                          ),
                                          SizedBox(height: 5.h),
                                          Container(
                                            height: 15.h,
                                            width: 200.w,
                                            padding: EdgeInsets.all(7.r),
                                            decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primaryContainer,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5.r))),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2 -
                                              20,
                                          height: 65.h,
                                          padding: EdgeInsets.all(7.r),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12.r),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 15.h,
                                                width: 80.w,
                                                padding: EdgeInsets.all(7.r),
                                                decoration: BoxDecoration(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primaryContainer,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                5.r))),
                                              ),
                                              SizedBox(height: 5.h),
                                              Container(
                                                height: 15.h,
                                                width: 130.w,
                                                padding: EdgeInsets.all(7.r),
                                                decoration: BoxDecoration(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primaryContainer,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                5.r))),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2 -
                                              20,
                                          height: 65.h,
                                          padding: EdgeInsets.all(7.r),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12.r),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 15.h,
                                                width: 80.w,
                                                padding: EdgeInsets.all(7.r),
                                                decoration: BoxDecoration(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primaryContainer,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                5.r))),
                                              ),
                                              SizedBox(height: 5.h),
                                              Container(
                                                height: 15.h,
                                                width: 130.w,
                                                padding: EdgeInsets.all(7.r),
                                                decoration: BoxDecoration(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primaryContainer,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                5.r))),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10.h),
                                    SizedBox(
                                      height: 200.h,
                                      child: SfCartesianChart(
                                        enableAxisAnimation: true,
                                        primaryXAxis: CategoryAxis(
                                          axisLine: AxisLine(width: 0),
                                          majorGridLines:
                                              MajorGridLines(width: 0),
                                          majorTickLines:
                                              MajorTickLines(width: 0),
                                        ),
                                        primaryYAxis: NumericAxis(
                                          minimum: 0,
                                          maximum: 50,
                                          interval: 7,
                                          axisLine: AxisLine(width: 0),
                                          majorTickLines:
                                              MajorTickLines(width: 0),
                                        ),
                                        series: <CartesianSeries<_SalesData,
                                            String>>[
                                          ColumnSeries<_SalesData, String>(
                                            width: 0.2,
                                            dataSource: [
                                              _SalesData('Monday', 35),
                                              _SalesData('Tuesday', 28),
                                              _SalesData('Wednesday', 34),
                                              _SalesData('Thursday', 32),
                                              _SalesData('Friday', 40),
                                              _SalesData('Saturday', 40),
                                              _SalesData('Sunday', 40),
                                            ],
                                            xValueMapper:
                                                (_SalesData sales, _) =>
                                                    sales.year,
                                            yValueMapper:
                                                (_SalesData sales, _) =>
                                                    sales.sales,
                                            color:
                                                Theme.of(context).primaryColor,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5),
                                              topRight: Radius.circular(5),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                        },
                      ),
                      SizedBox(height: 20.h),
                      BlocBuilder<DriverCreateTripOrNotCubit,
                          DriverCreateTripOrNotState>(
                        builder: (context, state) {
                          if (state is DriverCreateTripOrNotSuccess) {
                            return InkWell(
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () => Navigator.pushNamed(
                                context,
                                AppRoutesName.createdTripDetailsScreenRoute,
                                arguments: state.trip,
                              ),
                              child: SizedBox(
                                height: 40.h,
                                width: MediaQuery.of(context).size.width,
                                child: CarouselSlider(
                                  items: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          children: [
                                            _CreatedTripDetailRow(
                                              iconRotation: math.pi / 4,
                                              label:
                                                  "${S.of(context).home_driver_trip_from}${state.trip.fromLocation!.displayName}",
                                            ),
                                            _CreatedTripDetailRow(
                                              iconRotation: -3 * math.pi / 4,
                                              label:
                                                  "${S.of(context).home_driver_trip_to}${state.trip.toLocation!.displayName}",
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        _CreatedTripDetailRow(
                                          icon: Iconsax.money,
                                          label:
                                              "${S.of(context).home_driver_trip_price}${state.trip.pricePerSeat.toString()}",
                                        ),
                                        _CreatedTripDetailRow(
                                          icon: Iconsax.user,
                                          label:
                                              "${S.of(context).home_driver_trip_seats}${state.trip.basicInfo?.availableSeats.toString()}",
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        _CreatedTripDetailRow(
                                          icon: Iconsax.timer,
                                          label:
                                              "${S.of(context).home_driver_trip_departure}${state.trip.basicInfo?.formattedDepartureTime}",
                                        ),
                                      ],
                                    ),
                                  ],
                                  options: CarouselOptions(
                                    height: 120,
                                    autoPlay: true,
                                    autoPlayInterval: Duration(seconds: 3),
                                    autoPlayAnimationDuration:
                                        Duration(milliseconds: 600),
                                    autoPlayCurve: Curves.linear,
                                    enableInfiniteScroll: true,
                                    pauseAutoPlayOnTouch: false,
                                    pauseAutoPlayOnManualNavigate: false,
                                    viewportFraction: 1.0,
                                  ),
                                ),
                              ),
                            );
                          } else if (state is DriverCreateTripOrNotLoading) {
                            return Shimmer.fromColors(
                              baseColor: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              highlightColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              enabled: true,
                              child: SizedBox(
                                height: 40.h,
                                width: MediaQuery.of(context).size.width,
                                child: CarouselSlider(
                                  items: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              width: 100.w,
                                              height: 14.h,
                                              decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primaryContainer,
                                                borderRadius:
                                                    BorderRadius.circular(4.r),
                                              ),
                                            ),
                                            SizedBox(height: 5.h),
                                            Container(
                                              width: 150.w,
                                              height: 14.h,
                                              decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primaryContainer,
                                                borderRadius:
                                                    BorderRadius.circular(4.r),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          width: 100.w,
                                          height: 14.h,
                                          decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primaryContainer,
                                            borderRadius:
                                                BorderRadius.circular(4.r),
                                          ),
                                        ),
                                        Container(
                                          width: 100.w,
                                          height: 14.h,
                                          decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primaryContainer,
                                            borderRadius:
                                                BorderRadius.circular(4.r),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          width: 100.w,
                                          height: 14.h,
                                          decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primaryContainer,
                                            borderRadius:
                                                BorderRadius.circular(4.r),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                  options: CarouselOptions(
                                    height: 120,
                                    autoPlay: true,
                                    autoPlayInterval: Duration(seconds: 3),
                                    autoPlayAnimationDuration:
                                        Duration(milliseconds: 600),
                                    autoPlayCurve: Curves.linear,
                                    enableInfiniteScroll: true,
                                    pauseAutoPlayOnTouch: false,
                                    pauseAutoPlayOnManualNavigate: false,
                                    viewportFraction: 1.0,
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  AppRoutesName.driverCreateTripScreenRoute,
                                );
                              },
                              child:
                                  Text(S.of(context).home_driver_create_trip),
                            );
                          }
                        },
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            S.of(context).home_driver_recent_orders,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                      BlocBuilder<ActiveTripRequestsCubit,
                          ActiveTripRequestsState>(
                        builder: (context, state) {
                          if (state is ActiveTripRequestsSuccess) {
                            return state.tripList.isEmpty
                                ? EmptyDataWidget(
                                    image: Assets
                                        .imageEmptyImageEmptyActivePassenger,
                                    text: S
                                        .of(context)
                                        .home_driver_no_active_passengers,
                                  )
                                : ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: state.tripList.length,
                                    itemBuilder: (context, index) {
                                      return _recentOrderWidget(
                                        context,
                                        state.tripList[index],
                                        [
                                          state.tripList[index].fromLocation,
                                          state.tripList[index].toLocation,
                                        ],
                                      );
                                    },
                                  );
                          } else {
                            return ListView.builder(
                              shrinkWrap: true,
                              itemBuilder: (context, index) =>
                                  TripShimmerWidget(),
                              itemCount: 5,
                            );
                          }
                        },
                      )
                    ],
                  ),
                ),
              );
            } else {
              return NoInternetScreen();
            }
          },
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

  Widget _recentOrderWidget(
      BuildContext context, ActiveTripRequests model, Object arguments) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: InkWell(
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () => Navigator.pushNamed(
          context,
          AppRoutesName.driverCreateTripScreenRoute,
          arguments: arguments,
        ),
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
            label:
                "${S.of(context).home_driver_from_label}${model.fromLocation!.fullAddress}"),
        _TripDetailRow(
            iconRotation: -3 * math.pi / 4,
            label:
                "${S.of(context).home_driver_to_label}${model.toLocation!.fullAddress}"),
        _TripDetailRow(
            icon: Iconsax.map_1,
            label:
                "${S.of(context).home_driver_active_passengers_label}${model.activePassengers}"),
      ],
    );
  }
}

class _CreatedTripDetailRow extends StatelessWidget {
  final double? iconRotation;
  final IconData icon;
  final String label;

  const _CreatedTripDetailRow({
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
        Text(
          label,
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                fontFamily: isArabicText(label) ? fontArabic : fontEnglish,
              ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
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
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  fontFamily: isArabicText(label) ? fontArabic : fontEnglish,
                ),
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
