import 'package:aoun_app/presentation/user/transport/views/trip_details_screen.dart';
import 'package:aoun_app/presentation/widgets/common/appBar_widget.dart';
import 'package:aoun_app/presentation/widgets/common/divider_widget.dart';
import 'package:aoun_app/presentation/widgets/common/title_section_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class CreateTripScreen extends StatefulWidget {
  const CreateTripScreen({super.key});

  @override
  State<CreateTripScreen> createState() => _CreateTripScreenState();
}

class _CreateTripScreenState extends State<CreateTripScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: "Create trip",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 6,
                      spreadRadius: 2,
                      offset: Offset(2, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 23.h),
                      child: Column(
                        children: [
                          _buildCircle(Theme.of(context).primaryColor),
                          SizedBox(
                            width: 0,
                            height: 65.h,
                            child: CustomPaint(
                              painter: DottedGradientLinePainter(
                                gradient: LinearGradient(
                                  colors: [
                                    Theme.of(context).primaryColor,
                                    Theme.of(context).secondaryHeaderColor
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                            ),
                          ),
                          _buildCircle(Theme.of(context).secondaryHeaderColor),
                        ],
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "From",
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              Icon(
                                Iconsax.map_1,
                                size: 20.w,
                              ),
                              SizedBox(width: 5.w),
                              Text(
                                "Choose in map",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 17.sp,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30.h),
                        Text(
                          "To",
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              Icon(
                                Iconsax.map_1,
                                size: 20.w,
                              ),
                              SizedBox(width: 5.w),
                              Text(
                                "Choose in map",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 17.sp,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              DividerWidget(),
              TextField(
                decoration: InputDecoration(
                  hintText: "Price of Seats ",
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "Available Seats",
                ),
              ),
              DividerWidget(),
              Row(
                children: [
                  TitleSectionWidget(text: "Pickup Point "),
                  SizedBox(height: 7.h),
                  Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(
                          Iconsax.map_1,
                          size: 20.w,
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          "Choose in map",
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 17.sp,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              DividerWidget(),
              TitleSectionWidget(text: "Driver Notes "),
              SizedBox(height: 15.h),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                maxLines: 3,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  errorMaxLines: 2,
                  hintText: "Write your notes if you have any.",
                  hintStyle: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              DividerWidget(),
              TitleSectionWidget(text: "Amenities"),
              CheckboxListTile(
                title: Text("USB/AUX for Music"),
                value: true,
                onChanged: (newValue) {
                  setState(() {});
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
              CheckboxListTile(
                title: Text("Free Water"),
                value: true,
                onChanged: (newValue) {
                  setState(() {});
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
              CheckboxListTile(
                title: Text("Child Seat"),
                value: true,
                onChanged: (newValue) {
                  setState(() {});
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
              CheckboxListTile(
                title: Text("Air Conditioning"),
                value: true,
                onChanged: (newValue) {
                  setState(() {});
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
              CheckboxListTile(
                title: Text("Phone Charger"),
                value: true,
                onChanged: (newValue) {
                  setState(() {});
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
              CheckboxListTile(
                title: Text("Wi-Fi"),
                value: false,
                onChanged: (newValue) {
                  setState(() {});
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
              SizedBox(height: 15.h),
              ElevatedButton(
                  onPressed: () {}, child: Text("Confirm publish trip")),
              SizedBox(height: 15.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCircle(Color color) {
    return Container(
      width: 8.h,
      height: 8.h,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
