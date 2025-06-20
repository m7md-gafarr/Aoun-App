import 'package:aoun_app/core/app_images/app_images.dart';
import 'package:aoun_app/data/model/user%20models/user_booking/user_response_bookings_model/user_response_bookings_model.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:aoun_app/presentation/user/history%20booking/view_model/user_booking_history/user_booking_history_cubit.dart';
import 'package:aoun_app/presentation/widgets/common/appBar_widget.dart';
import 'package:aoun_app/presentation/widgets/common/empty_data.dart';
import 'package:aoun_app/presentation/widgets/shimmer/trip_shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'dart:math' as math;

class UserHistoryBokkingScreen extends StatefulWidget {
  const UserHistoryBokkingScreen({super.key});

  @override
  State<UserHistoryBokkingScreen> createState() =>
      _DriverHistoryTripsScreenState();
}

class _DriverHistoryTripsScreenState extends State<UserHistoryBokkingScreen> {
  @override
  void didChangeDependencies() {
    context.read<UserBookingHistoryCubit>().getBookingTrips();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: S.of(context).user_history_booking_title,
      ),
      body: BlocBuilder<UserBookingHistoryCubit, UserBookingHistoryState>(
        builder: (context, state) {
          if (state is UserBookingHistorySuccess) {
            return state.bookingList.isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 150.h,
                          ),
                          EmptyDataWidget(
                            image: Assets.imageEmptyImageEmptyHistorydata,
                            text: S.of(context).user_history_booking_no_history,
                          ),
                        ],
                      ),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.bookingList.length,
                    itemBuilder: (context, index) {
                      return _TripHistoryWidget(
                        BookModel: state.bookingList[index],
                      );
                    },
                  );
          } else {
            return ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) => TripShimmerWidget(),
              itemCount: 6,
            );
          }
        },
      ),
    );
  }
}

class _TripHistoryWidget extends StatelessWidget {
  _TripHistoryWidget({super.key, required this.BookModel});

  UserResponseBookingsModel BookModel;

  Color getTripStatus(String status) {
    switch (status) {
      case "Planned": // Planned
        return const Color(0xFFC0C0C0);
      case "Active": // Active
        return const Color(0xFFF9A825);
      case "Completed": // Completed
        return const Color(0xFF4CAF50);
      case "Canceled": // Canceled
        return const Color(0xFFE53935);
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
      child: Container(
        height: 80.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.r),
          color: Theme.of(context).colorScheme.primaryContainer,
          // getTripStatus(tripModel.status!)[0]
        ),
        child: Row(
          children: [
            SizedBox(width: 7.w),
            SizedBox(width: 7.w),
            _TripDetails(
              tripModel: BookModel,
              status: BookModel.formattedTripStatus!,
              colorStatus: getTripStatus(BookModel.formattedTripStatus!),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconContainer(BuildContext context, IconData icon) {
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.r),
        border: Border.all(width: 1, color: Theme.of(context).primaryColor),
      ),
      child: Icon(icon),
    );
  }
}

class _TripDetails extends StatelessWidget {
  _TripDetails(
      {required this.tripModel,
      required this.status,
      required this.colorStatus});
  static String getStatusText(BuildContext context, String status) {
    switch (status) {
      case "Planned":
        return S.of(context).trip_status_planned;
      case "Active":
        return S.of(context).trip_status_active;
      case "Completed":
        return S.of(context).trip_status_completed;
      case "Canceled":
        return S.of(context).trip_status_canceled;
      default:
        return S.of(context).trip_status_unknown;
    }
  }

  UserResponseBookingsModel tripModel;
  String status;
  Color colorStatus;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _TripDetailRow(
            iconRotation: math.pi / 4,
            label:
                "${S.of(context).user_history_booking_from_label}${tripModel.fromLocation!.fullAddress}"),
        _TripDetailRow(
            iconRotation: -3 * math.pi / 4,
            label:
                "${S.of(context).user_history_booking_to_label}${tripModel.toLocation!.fullAddress}"),
        Row(
          children: [
            SizedBox(
              width: 190.w,
              child: Row(
                children: [
                  Icon(Iconsax.status, size: 17.w),
                  SizedBox(width: 2.w),
                  Text(
                    S.of(context).user_history_booking_status_label,
                    style: Theme.of(context).textTheme.labelSmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    getStatusText(context, status),
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(color: colorStatus),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Icon(Iconsax.people, size: 17.w),
                SizedBox(width: 2.w),
                Text(
                  S.of(context).user_history_booking_total_seats_label,
                  style: Theme.of(context).textTheme.labelSmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  tripModel.totalSeats.toString(),
                  style: Theme.of(context).textTheme.labelSmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
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
          width: 245.w,
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
