import 'dart:developer';

import 'package:aoun_app/core/app_color/app_color_light.dart';
import 'package:aoun_app/data/model/driver_models/driver_craeted_trip/driver_trip_created/driver_trip_created_model.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:aoun_app/presentation/driver/history%20trips/view_model/driver_trips_history/driver_trips_history_cubit.dart';
import 'package:aoun_app/presentation/driver/home/view_model/cancel_trip/cancel_trip_cubit.dart';
import 'package:aoun_app/presentation/driver/home/view_model/driver%20create%20trip%20or%20not/driver_create_trip_or_not_cubit.dart';
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
        return [const Color(0xFFC0C0C0), "Planned"];
      case 1: // Active
        return [const Color(0xFFF9A825), "Active"];
      case 2: // Completed
        return [const Color(0xFF4CAF50), "Completed"];
      case 3: // Canceled
        return [const Color(0xFFE53935), "Canceled"];
      default:
        return [Colors.grey, "Unknown"];
    }
  }

  @override
  Widget build(BuildContext context) {
    log(MediaQuery.of(context).platformBrightness.toString());
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
                        Text(
                          tripModel!.fromLocation!.fullAddress!,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 17.sp,
                                  ),
                        ),
                        SizedBox(height: 30.h),
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
                                ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              DividerWidget(),
              tripInfo(
                title: "Status",
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
              tripModel!.status! == 3
                  ? Column(
                      children: [
                        Text(
                          "You can cancel the trip anytime up to 1 hour before the departure time.\n"
                          "Canceling after that may affect your integrity score.",
                          style: Theme.of(context).textTheme.labelSmall,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 7.h,
                        ),
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
                                  backgroundColor: WidgetStatePropertyAll(
                                      AppColorLight.errorColor)),
                          child: BlocConsumer<CancelTripCubit, CancelTripState>(
                            listener: (context, state) {
                              if (state is CancelTripSuccess) {
                                context
                                    .read<DriverCreateTripOrNotCubit>()
                                    .driverCreateTripOrNot();
                                context
                                    .read<DriverTripsHistoryCubit>()
                                    .getDriverTrips(forceRefresh: true);
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
                                return Text("Canceled trip");
                              }
                            },
                          ),
                        ),
                      ],
                    )
                  : ElevatedButton(
                      onPressed: () async {
                        // context
                        //     .read<CancelTripCubit>()
                        //     .cancelTrip(tripModel!.id.toString());
                      },
                      child: BlocConsumer<CancelTripCubit, CancelTripState>(
                        listener: (context, state) {
                          if (state is CancelTripSuccess) {
                            context
                                .read<DriverCreateTripOrNotCubit>()
                                .driverCreateTripOrNot();
                            context
                                .read<DriverTripsHistoryCubit>()
                                .getDriverTrips(forceRefresh: true);
                            Navigator.pop(context);
                          }
                        },
                        builder: (context, state) {
                          if (state is CancelTripLoading) {
                            return SizedBox(
                              height: 30,
                              width: 30,
                              child: CircularProgressIndicator(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                            );
                          } else {
                            return Text("Finish trip");
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
