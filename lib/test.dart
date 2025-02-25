import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.amber,
            height: 100.h,
            width: 300.w,
          ),
          const SizedBox(height: 50),
          Text("Moahmed", style: Theme.of(context).textTheme.headlineSmall)
        ],
      ),
    );
  }
}
