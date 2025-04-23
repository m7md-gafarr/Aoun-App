import 'package:aoun_app/core/router/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectTypeScreen extends StatelessWidget {
  const SelectTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 70.h),
              Text(
                "Welcome to  Aoun",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 7.h),
              // Enter details text
              Text(
                "Choose how you want to continue",
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(height: 70.h),
              Text(
                "Passenger",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 7.h),
              // Enter details text
              Text(
                "Book and share your trips easily.",
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(height: 30.h),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutesName.loginScreenRoute,
                    arguments: "user",
                  );
                },
                child: Text("Continue as Passenger"),
              ),
              SizedBox(height: 70.h),
              Text(
                "Driver",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 7.h),
              // Enter details text
              Text(
                "Drive and earn from your trips.",
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(height: 30.h),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutesName.driverIntroductionScreenRoute,
                  );
                },
                child: Text("Continue as Driver"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
