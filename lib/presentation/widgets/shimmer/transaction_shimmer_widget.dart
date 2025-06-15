import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shimmer/shimmer.dart';

class TransactionShimmerWidget extends StatelessWidget {
  const TransactionShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.primaryContainer,
      highlightColor: Theme.of(context).scaffoldBackgroundColor,
      enabled: true,
      child: ListTile(
        contentPadding: EdgeInsets.all(0),
        leading: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.all(
              Radius.circular(7.r),
            ),
          ),
          height: 50.h,
          width: 50.h,
          child: Icon(
            Iconsax.arrow_down,
            color: Theme.of(context).primaryColor,
          ),
        ),
        title: Container(
          height: 15.w,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(7.r),
            border: Border.all(width: 1, color: Colors.black),
          ),
        ),
        trailing: Text(
          "\$0.0",
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}
