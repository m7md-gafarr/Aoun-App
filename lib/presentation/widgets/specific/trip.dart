import 'dart:math' as math;
import 'package:animations/animations.dart';
import 'package:aoun_app/presentation/transport/views/trip_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class TripWidget extends StatelessWidget {
  const TripWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedElevation: 0,
      openElevation: 0,
      transitionType: ContainerTransitionType.fadeThrough,
      openBuilder: (context, action) => TripDetailsScreen(),
      closedBuilder: (context, action) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
        child: Container(
          height: 80.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
          child: Row(
            children: [
              SizedBox(width: 7.w),
              _buildIconContainer(context, Iconsax.bus),
              SizedBox(width: 7.w),
              _TripDetails(),
              const VerticalDivider(thickness: 0.7, endIndent: 10, indent: 15),
              _TripPrice(price: 9999),
              const Spacer(),
              const Icon(Iconsax.arrow_right_3)
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
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _TripDetailRow(
            iconRotation: math.pi / 4, label: "From: Kafr El-Shaikh "),
        _TripDetailRow(iconRotation: -3 * math.pi / 4, label: "To: AZ Zafaran"),
        _TripDetailRow(icon: Iconsax.clock, label: "Today / 16:00 AM"),
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
          width: 150.w,
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
  final int price;

  const _TripPrice({required this.price});

  @override
  Widget build(BuildContext context) {
    return Text(
      "\$$price",
      style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 17.sp),
    );
  }
}
