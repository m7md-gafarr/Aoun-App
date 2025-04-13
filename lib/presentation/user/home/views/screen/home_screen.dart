import 'package:aoun_app/presentation/user/home/views/widget/appbar_widget.dart';
import 'package:aoun_app/presentation/user/transport/views/transport_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeUserScreen extends StatefulWidget {
  const HomeUserScreen({super.key});

  @override
  State<HomeUserScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeUserScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              AppbarWidgetWelcomeAndNotification(
                userName: "Mohamed",
              ),
            ];
          },
          body: TransportScreen(),
        ),
      ),
    );
  }
}
