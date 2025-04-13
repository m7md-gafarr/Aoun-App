import 'package:aoun_app/core/router/route_name.dart';
import 'package:aoun_app/data/repositories/local/shared_pref.dart';
import 'package:aoun_app/presentation/widgets/common/appBar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class DriverIntroductionScreen extends StatelessWidget {
  const DriverIntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(30),
              height: 170.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(27.r)),
                color: Theme.of(context).primaryColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Get income with us",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(height: 20.h),
                  _titleContainer(
                    context,
                    icon: Iconsax.clock,
                    text: "Flexible hours",
                  ),
                  _titleContainer(
                    context,
                    icon: Iconsax.dollar_circle,
                    text: "Your prices",
                  ),
                  _titleContainer(
                    context,
                    icon: Iconsax.wallet,
                    text: "Low services payments",
                  ),
                ],
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () async {
                await SharedPreferencesService().userMode(false);
                Navigator.pushNamed(
                  context,
                  AppRoutesName.driverRegisterScreenRoute,
                );
              },
              child: Text("Create account driver"),
            ),
            SizedBox(height: 13),
            OutlinedButton(
              onPressed: () async {
                await SharedPreferencesService().userMode(false);
                Navigator.pushNamed(
                  context,
                  AppRoutesName.driverloginScreenRoute,
                );
              },
              child: Text("I already have an account"),
            ),
            SizedBox(height: 13),
          ],
        ),
      ),
    );
  }

  Widget _titleContainer(
    BuildContext context, {
    required String text,
    required IconData? icon,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          color: Theme.of(context).secondaryHeaderColor,
          size: 20.h,
        ),
        SizedBox(width: 10.w),
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Theme.of(context).secondaryHeaderColor),
        ),
      ],
    );
  }
}
