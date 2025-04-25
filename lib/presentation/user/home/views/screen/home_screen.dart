import 'package:aoun_app/core/router/route_name.dart';

import 'package:aoun_app/presentation/user/transport/views/transport_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class HomeUserScreen extends StatefulWidget {
  const HomeUserScreen({super.key});

  @override
  State<HomeUserScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeUserScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        key: _scaffoldKey,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: false,
                snap: true,
                floating: true,
                stretch: true,
                actions: [
                  SizedBox(width: 13.w),
                  Text(
                    "Welcome Mohamed ,",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  InkWell(
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    // onTap: () => Navigator.pushNamed(
                    //     context, AppRoutesName.userNotificationScreenRoute),

                    onTap: () async {},
                    child: Icon(
                      Iconsax.notification,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  SizedBox(width: 13.w),
                  InkWell(
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    // onTap: () => Navigator.pushNamed(
                    //     context, AppRoutesName.userProfileScreenRoute),

                    onTap: () async {
                      Navigator.pushNamed(
                          context, AppRoutesName.homeDriverScreenRoute);
                    },
                    child: CircleAvatar(
                      maxRadius: 13.w,
                    ),
                  ),
                  SizedBox(width: 13.w),
                ],
              )
            ];
          },
          body: TransportScreen(),
        ),
      ),
    );
  }
}
