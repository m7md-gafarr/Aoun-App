import 'package:animations/animations.dart';
import 'package:aoun_app/presentation/user/home/views/widget/appbar_widget.dart';
import 'package:aoun_app/presentation/user/home/views/widget/home_widget.dart';
import 'package:aoun_app/presentation/user/home/views/widget/profile_widget.dart';
import 'package:aoun_app/presentation/user/transport/views/transport_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';

class HomeUserScreen extends StatefulWidget {
  const HomeUserScreen({super.key});

  @override
  State<HomeUserScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeUserScreen> {
  int _indexNavBar = 0;

  void changeIndex(int index) {
    setState(() {
      _indexNavBar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> navBarList = [
      HomeScreenWidget(onServiceTap: changeIndex),
      TransportScreen(),
      Center(child: Text("Housing")),
      Center(child: Text("Job")),
      ProfileWidget(),
    ];
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            AppbarWidgetWelcomeAndNotification(
              userName: "Mohamed",
            ),
            SliverFillRemaining(
              hasScrollBody: true,
              child: PageTransitionSwitcher(
                duration: Duration(milliseconds: 500),
                transitionBuilder:
                    (child, primaryAnimation, secondaryAnimation) {
                  return FadeThroughTransition(
                    animation: primaryAnimation,
                    secondaryAnimation: secondaryAnimation,
                    child: child,
                  );
                },
                child: navBarList[_indexNavBar],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              _indexNavBar = value;
            });
          },
          currentIndex: _indexNavBar,
          showSelectedLabels: false,
          items: [
            BottomNavigationBarItem(icon: Icon(Iconsax.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Iconsax.driving), label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(Iconsax.buildings), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Iconsax.bag_2), label: "User"),
            BottomNavigationBarItem(icon: Icon(Iconsax.user), label: "User"),
          ],
        ),
      ),
    );
  }
}
