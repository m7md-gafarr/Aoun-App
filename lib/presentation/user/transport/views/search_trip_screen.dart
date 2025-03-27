import 'package:aoun_app/core/router/route_name.dart';
import 'package:aoun_app/presentation/widgets/common/appBar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class SearchTripScreen extends StatelessWidget {
  const SearchTripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: "Enter your route",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "From",
                suffixIcon: InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutesName.mapSelectRouteScreenRoute,
                    );
                  },
                  child: Icon(
                    Iconsax.map_1,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.h),
            TextField(
              decoration: InputDecoration(
                hintText: "To",
                suffixIcon: Icon(
                  Iconsax.map_1,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            SizedBox(height: 40.h),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    10,
                    (index) => ListTile(
                      title: Text(
                        "data",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      subtitle: Text(
                        "data",
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      leading: Icon(
                        Iconsax.location,
                        color: Theme.of(context).primaryColor.withOpacity(.5),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
