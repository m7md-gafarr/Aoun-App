import 'dart:math' as math;

import 'package:aoun_app/data/model/trip%20models/trip_model/trip_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class TripHistoryWidget extends StatelessWidget {
  TripHistoryWidget({
    super.key,
    required this.tripModel,
  });

  TripModel tripModel;

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
            _buildIconContainer(context, Iconsax.bus),
            SizedBox(width: 7.w),
            _TripDetails(
              tripModel: tripModel,
              status: getTripStatus(tripModel.status!)[1],
              colorStatus: getTripStatus(tripModel.status!)[0],
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
  TripModel tripModel;
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
            label: "From: ${tripModel.fromLocation!.fullAddress}"),
        _TripDetailRow(
            iconRotation: -3 * math.pi / 4,
            label: "To: ${tripModel.toLocation!.fullAddress}"),
        Row(
          children: [
            Icon(Iconsax.status, size: 17.w),
            SizedBox(width: 2.w),
            Text(
              "Status: ",
              style: Theme.of(context).textTheme.labelSmall,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              status,
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(color: colorStatus),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
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
