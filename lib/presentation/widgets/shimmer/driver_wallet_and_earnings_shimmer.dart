import 'package:aoun_app/presentation/widgets/shimmer/transaction_shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class DriverWalletAndEarningsShimmer extends StatelessWidget {
  const DriverWalletAndEarningsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20.h),
          Shimmer.fromColors(
            baseColor: Theme.of(context).colorScheme.primaryContainer,
            highlightColor: Theme.of(context).scaffoldBackgroundColor,
            enabled: true,
            child: Column(
              children: [
                Container(
                  width: 100.w,
                  height: 15.w,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(7.r),
                    border: Border.all(width: 1, color: Colors.black),
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  "\$0,0",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: 15.h),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(""),
                ),
              ],
            ),
          ),
          SizedBox(height: 15.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Last Transaction",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Column(
            children: List.generate(
              5,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TransactionShimmerWidget(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
