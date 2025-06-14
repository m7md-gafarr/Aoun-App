import 'package:aoun_app/presentation/widgets/common/appBar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class DriverWalletAndEarningsScreen extends StatelessWidget {
  const DriverWalletAndEarningsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: "Wallet and earnings",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Text(
                "Balance Your",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(height: 5.h),
              Text(
                "\$25,25",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: 15.h),
              ElevatedButton(
                onPressed: () {},
                child: Text("Withdrawal"),
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
              TransactionWidget(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget TransactionWidget(BuildContext context) {
    return ListTile(
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
      title: Text(
        "Today 12:33",
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      trailing: Text(
        "\$25",
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
