import 'package:aoun_app/core/router/route_name.dart';
import 'package:aoun_app/data/repositories/local/shared_pref.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            Navigator.pushNamed(
              context,
              AppRoutesName.introductionDriverScreenRoute,
            );
          },
          child: Text("Driver mode"),
        ),
      ),
    );
  }
}
