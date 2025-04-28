import 'package:aoun_app/core/router/route_name.dart';
import 'package:aoun_app/data/repositories/local/shared_pref.dart';
import 'package:flutter/material.dart';

class DriverSettingScreen extends StatelessWidget {
  const DriverSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await SharedPreferencesService().logout();
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutesName.selectTypeScreenRoute,
              (route) => false,
            );
          },
          child: Text("Logout"),
        ),
      ),
    );
  }
}
