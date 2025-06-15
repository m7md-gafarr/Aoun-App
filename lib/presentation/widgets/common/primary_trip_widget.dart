import 'dart:math' as math;
import 'package:animations/animations.dart';
import 'package:aoun_app/data/model/trip%20models/trip_model/trip_model.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:aoun_app/presentation/user/transport/view/trip_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class TripWidget extends StatelessWidget {
  TripWidget({super.key, required this.trip});
  TripModel trip;
  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedElevation: 0,
      openElevation: 0,
      closedColor: Theme.of(context).scaffoldBackgroundColor,
      transitionType: ContainerTransitionType.fadeThrough,
      openBuilder: (context, action) => TripDetailsScreen(
        tripModel: trip,
      ),
      closedBuilder: (context, action) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
        child: Container(
          height: 80.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.r),
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
          child: Row(
            children: [
              SizedBox(width: 7.w),
              _buildIconContainer(context, Iconsax.bus),
              SizedBox(width: 7.w),
              _TripDetails(
                trip: trip,
              ),
              const VerticalDivider(thickness: 0.7, endIndent: 10, indent: 15),
              Spacer(),
              _TripPrice(price: trip.pricePerSeat!),
              SizedBox(width: 7.w),
            ],
          ),
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
  TripModel trip;
  _TripDetails({required this.trip});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _TripDetailRow(
            iconRotation: math.pi / 4,
            label:
                "${S.of(context).trip_from_label}${trip.fromLocation!.fullAddress}"),
        _TripDetailRow(
            iconRotation: -3 * math.pi / 4,
            label:
                "${S.of(context).trip_to_label}${trip.fromLocation!.fullAddress}"),
        _TripDetailRow(
            icon: Iconsax.clock,
            label: " ${trip.basicInfo!.formattedDepartureTime}"),
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
          width: 180.w,
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

class _TripPrice extends StatelessWidget {
  final double price;

  const _TripPrice({required this.price});

  @override
  Widget build(BuildContext context) {
    return Text(
      "${S.of(context).trip_currency_symbol}${price.toInt()}",
      style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 17.sp),
    );
  }
}
