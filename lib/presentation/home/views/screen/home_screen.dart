import 'package:aoun_app/presentation/home/views/widget/home_widget.dart';
import 'package:aoun_app/presentation/transport/views/transport_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      Center(child: Text("Profile")),
    ];
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        // appBar: AppBar(
        //   actions: [
        //     SizedBox(width: 13),
        //     Text(
        //       "Welcome Sokar ,",
        //       style: Theme.of(context).textTheme.titleSmall,
        //     ),
        //     Spacer(
        //       flex: 1,
        //     ),
        //     Icon(
        //       Iconsax.notification,
        //       color: Theme.of(context).primaryColor,
        //     ),
        //     SizedBox(width: 13),
        //   ],
        // ),
        body: navBarList[_indexNavBar],
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
            BottomNavigationBarItem(icon: Icon(Iconsax.car), label: "Search"),
            BottomNavigationBarItem(icon: Icon(Iconsax.house), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Iconsax.bag_2), label: "User"),
            BottomNavigationBarItem(icon: Icon(Iconsax.user), label: "User"),
          ],
        ),
      ),
    );
  }
}
