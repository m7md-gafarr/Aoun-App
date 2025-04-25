import 'package:aoun_app/presentation/widgets/common/appBar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class DriverEditProfile extends StatelessWidget {
  const DriverEditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: "Edit Profile",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            children: [
              SizedBox(height: 30.h),
              Container(
                height: 120.h,
                width: 120.h,
                decoration: BoxDecoration(
                  color: Theme.of(context).secondaryHeaderColor,
                  shape: BoxShape.circle,
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: 10,
                      bottom: 10,
                      child: Container(
                        height: 20.h,
                        width: 20.h,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Iconsax.add,
                            size: 17.w,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              TextField(),
              SizedBox(height: 15.h),
              TextField(),
              SizedBox(height: 15.h),
              TextField(),
              SizedBox(height: 20.h),
              ElevatedButton(
                onPressed: () {},
                child: Text("Update"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
