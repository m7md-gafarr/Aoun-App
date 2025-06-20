import 'package:aoun_app/core/app_color/app_color_light.dart';
import 'package:aoun_app/core/constant/constant.dart';
import 'package:aoun_app/data/model/driver_models/driver_craeted_trip/driver_trip_created/driver_trip_created_model.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:aoun_app/presentation/driver/history%20trips/view_model/driver_trips_history/driver_trips_history_cubit.dart';
import 'package:aoun_app/presentation/driver/home/view_model/cancel_trip/cancel_trip_cubit.dart';
import 'package:aoun_app/presentation/driver/home/view_model/complete_trip/complete_trip_cubit.dart';
import 'package:aoun_app/presentation/driver/home/view_model/driver%20create%20trip%20or%20not/driver_create_trip_or_not_cubit.dart';
import 'package:aoun_app/presentation/driver/home/view_model/driver%20dashboard/driver_dashboard_cubit.dart';
import 'package:aoun_app/presentation/user/transport/view/trip_details_screen.dart';
import 'package:aoun_app/presentation/widgets/common/appBar_widget.dart';
import 'package:aoun_app/presentation/widgets/common/divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CreatedTripDetailsScreen extends StatefulWidget {
  const CreatedTripDetailsScreen({super.key});

  @override
  State<CreatedTripDetailsScreen> createState() => _CreateTripScreenState();
}

class _CreateTripScreenState extends State<CreatedTripDetailsScreen> {
  DriverTripCreatedModel? tripModel;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments;
    if (arguments != null) {
      final arguments =
          ModalRoute.of(context)!.settings.arguments as DriverTripCreatedModel;
      tripModel = arguments;
    }
  }

  List<dynamic> getTripStatus(int status) {
    switch (status) {
      case 0: // Planned
        return [
          const Color(0xFFC0C0C0),
          S.of(context).created_trip_status_planned
        ];
      case 1: // Active
        return [
          const Color(0xFFF9A825),
          S.of(context).created_trip_status_active
        ];
      case 2: // Completed
        return [
          const Color(0xFF4CAF50),
          S.of(context).created_trip_status_completed
        ];
      case 3: // Canceled
        return [
          const Color(0xFFE53935),
          S.of(context).created_trip_status_canceled
        ];
      default:
        return [Colors.grey, S.of(context).created_trip_status_unknown];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: S.of(context).trip_details_title,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
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
                      padding: EdgeInsets.only(top: 2.h),
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
                          _buildCircle(Theme.of(context).secondaryHeaderColor),
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
                            tripModel!.fromLocation!.fullAddress!,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 17.sp,
                                  fontFamily: isArabicText(
                                          tripModel!.fromLocation!.fullAddress!)
                                      ? fontArabic
                                      : fontEnglish,
                                ),
                          ),
                        ),
                        SizedBox(height: 50.h),
                        Text(
                          S.of(context).trip_details_to,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        SizedBox(
                          width: 280.w,
                          child: Text(
                            tripModel!.toLocation!.fullAddress!,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 17.sp,
                                  fontFamily: isArabicText(
                                          tripModel!.fromLocation!.fullAddress!)
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
              DividerWidget(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 13.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).created_trip_bookings_passengers,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 15.sp),
                    ),
                    Row(
                      children: [
                        Text(
                          tripModel!.bookings!.length.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontSize: 15.sp,
                                  color:
                                      Theme.of(context).secondaryHeaderColor),
                        ),
                        Text(
                          " " + S.of(context).created_trip_from + " ",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontSize: 15.sp,
                                  color: Theme.of(context).primaryColor),
                        ),
                        Text(
                          "${tripModel!.basicInfo!.availableSeats}",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontSize: 15.sp,
                                  color:
                                      Theme.of(context).secondaryHeaderColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              DividerWidget(),
              tripInfo(
                title: S.of(context).created_trip_status,
                value: getTripStatus(tripModel!.status!)[1],
              ),
              tripInfo(
                  title: S.of(context).trip_details_departure_time,
                  value: tripModel!.basicInfo!.formattedDepartureTime!),
              tripInfo(
                  title: S.of(context).trip_details_available_seats,
                  value: tripModel!.basicInfo!.availableSeats!.toString()),
              tripInfo(
                  title: S.of(context).trip_details_price_per_seat,
                  value: "\$${tripModel!.pricePerSeat!.toString()}"),
              tripInfo(
                  title: S.of(context).trip_details_duration,
                  value: tripModel!.basicInfo!.formattedDuration!),
              tripInfo(
                  title: S.of(context).trip_details_seating_capacity,
                  value: tripModel!.driverInfo!.vehicleInfo!.seatingCapacity!
                      .toString()),
              tripInfo(
                title: S.of(context).trip_details_created_at,
                value: DateFormat('yyyy-MM-dd – hh:mm a')
                    .format(tripModel!.createdAt!),
              ),
              DividerWidget(),
              tripModel!.status! == 0
                  ? Column(
                      children: [
                        Text(
                          S.of(context).created_trip_cancel_info,
                          style: Theme.of(context).textTheme.labelSmall,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 7.h),
                        ElevatedButton(
                          onPressed: () async {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text(
                                  S
                                      .of(context)
                                      .created_trip_confirm_cancel_title,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                content: Text(S
                                    .of(context)
                                    .created_trip_confirm_cancel_content),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      context
                                          .read<CancelTripCubit>()
                                          .cancelTrip(tripModel!.id.toString());
                                    },
                                    style: Theme.of(context)
                                        .elevatedButtonTheme
                                        .style!
                                        .copyWith(
                                            backgroundColor:
                                                WidgetStatePropertyAll(
                                                    AppColorLight.errorColor)),
                                    child: BlocConsumer<CancelTripCubit,
                                        CancelTripState>(
                                      listener: (context, state) {
                                        if (state is CancelTripSuccess) {
                                          context
                                              .read<
                                                  DriverCreateTripOrNotCubit>()
                                              .driverCreateTripOrNot(context);
                                          context
                                              .read<DriverTripsHistoryCubit>()
                                              .getDriverTrips(
                                                  forceRefresh: true);
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        }
                                      },
                                      builder: (context, state) {
                                        if (state is CancelTripLoading) {
                                          return SizedBox(
                                            height: 30,
                                            width: 30,
                                            child: CircularProgressIndicator(
                                              color: Theme.of(context)
                                                  .scaffoldBackgroundColor,
                                            ),
                                          );
                                        } else {
                                          return Text(S
                                              .of(context)
                                              .created_trip_confirm_cancel_button);
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          style: Theme.of(context)
                              .elevatedButtonTheme
                              .style!
                              .copyWith(
                                  backgroundColor: WidgetStatePropertyAll(
                                      AppColorLight.errorColor)),
                          child: Text(S.of(context).created_trip_canceled_trip),
                        ),
                      ],
                    )
                  : ElevatedButton(
                      onPressed: () async {
                        context
                            .read<CompleteTripCubit>()
                            .completeTrip(tripModel!.id!);
                      },
                      child: BlocConsumer<CompleteTripCubit, CompleteTripState>(
                        listener: (context, state) {
                          if (state is CompleteTripSuccess) {
                            context
                                .read<DriverCreateTripOrNotCubit>()
                                .driverCreateTripOrNot(context);
                            context.read<DriverDashboardCubit>().getDashboard();
                            context
                                .read<DriverTripsHistoryCubit>()
                                .getDriverTrips(forceRefresh: true);
                            Navigator.pop(context);
                          }
                        },
                        builder: (context, state) {
                          if (state is CompleteTripLoading) {
                            return SizedBox(
                              height: 30,
                              width: 30,
                              child: CircularProgressIndicator(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                            );
                          } else {
                            return Text(S.of(context).created_trip_finish_trip);
                          }
                        },
                      ),
                    ),
              SizedBox(height: 15.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget tripInfo({
    required String title,
    required String value,
    TextStyle? style,
  }) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Container(
        padding: EdgeInsets.all(10),
        constraints: BoxConstraints(minHeight: 45.h),
        decoration: BoxDecoration(
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
              style: style ??
                  Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
            ),
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

  String convertSecondsToTimeSpan(String secondsWithSuffix) {
    int seconds = int.parse(secondsWithSuffix.replaceAll("s", ""));

    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int remainingSeconds = seconds % 60;

    return "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}";
  }
}
