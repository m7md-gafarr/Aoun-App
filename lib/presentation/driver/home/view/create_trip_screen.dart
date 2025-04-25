import 'dart:developer';

import 'package:animations/animations.dart';
import 'package:aoun_app/core/router/route_name.dart';
import 'package:aoun_app/core/utils/snakbar/snackebar_helper.dart';
import 'package:aoun_app/data/model/driver%20models/greate_trip_model/trip_location.dart';
import 'package:aoun_app/data/model/driver%20models/greate_trip_model/greate_trip_model.dart';
import 'package:aoun_app/data/repositories/local/shared_pref.dart';
import 'package:aoun_app/presentation/driver/home/view/select_route_on_map_screen.dart';
import 'package:aoun_app/presentation/driver/home/view_model/amenities/amenities_cubit.dart';
import 'package:aoun_app/presentation/driver/home/view_model/grate%20trip/create_trip_cubit.dart';
import 'package:aoun_app/presentation/user/transport/views/trip_details_screen.dart';
import 'package:aoun_app/presentation/widgets/common/appBar_widget.dart';
import 'package:aoun_app/presentation/widgets/common/divider_widget.dart';
import 'package:aoun_app/presentation/widgets/common/error_dialog_widget.dart';
import 'package:aoun_app/presentation/widgets/common/title_section_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class CreateTripScreen extends StatefulWidget {
  const CreateTripScreen({super.key});

  @override
  State<CreateTripScreen> createState() => _CreateTripScreenState();
}

class _CreateTripScreenState extends State<CreateTripScreen> {
  String? fromLocation, toLocation;
  LocationTrip? formLocatiomModel, toLocatiomModel;
  GlobalKey<FormState> keyForm = GlobalKey();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController availableSeatsController =
      TextEditingController();
  final TextEditingController driverNotesController = TextEditingController();
  @override
  void dispose() {
    priceController.dispose();
    availableSeatsController.dispose();
    driverNotesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: "Create trip",
      ),
      body: Form(
        key: keyForm,
        child: SingleChildScrollView(
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
                            _buildCircle(
                                Theme.of(context).secondaryHeaderColor),
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
                          OpenContainer(
                            closedElevation: 0,
                            openElevation: 0,
                            closedColor: Colors.transparent,
                            openColor: Theme.of(context).primaryColor,
                            transitionType: ContainerTransitionType.fadeThrough,
                            openBuilder: (context, action) =>
                                SelectRouteOnMapScreen(),
                            closedBuilder: (context, action) => InkWell(
                              onTap: () async {
                                var result = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SelectRouteOnMapScreen()),
                                );
                                if (!mounted) return;
                                if (result != null) {
                                  fromLocation = result[0];
                                  formLocatiomModel = result[1];
                                  setState(() {});
                                }
                              },
                              child: fromLocation == null
                                  ? Row(
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
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontSize: 17.sp,
                                              ),
                                        ),
                                      ],
                                    )
                                  : SizedBox(
                                      width: 288.w,
                                      child: Text(
                                        fromLocation!,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontSize: 16.sp,
                                            ),
                                      ),
                                    ),
                            ),
                          ),
                          SizedBox(height: 30.h),
                          Text(
                            "To",
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          OpenContainer(
                            closedElevation: 0,
                            openElevation: 0,
                            closedColor: Colors.transparent,
                            openColor: Theme.of(context).primaryColor,
                            transitionType: ContainerTransitionType.fadeThrough,
                            openBuilder: (context, action) =>
                                SelectRouteOnMapScreen(),
                            closedBuilder: (context, action) => InkWell(
                              onTap: () async {
                                var result = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SelectRouteOnMapScreen()),
                                );
                                if (!mounted) return;
                                if (result != null) {
                                  toLocation = result[0];
                                  toLocatiomModel = result[1];
                                  setState(() {});
                                }
                              },
                              child: toLocation == null
                                  ? Row(
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
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontSize: 17.sp,
                                              ),
                                        ),
                                      ],
                                    )
                                  : SizedBox(
                                      width: 288.w,
                                      child: Text(
                                        toLocation!,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontSize: 16.sp,
                                            ),
                                      ),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                DividerWidget(),
                TextFormField(
                  controller: availableSeatsController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter available seats';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Available Seats",
                  ),
                ),
                SizedBox(height: 15.h),
                TextFormField(
                  controller: priceController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the price';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Price of Seat",
                  ),
                ),
                DividerWidget(),
                TitleSectionWidget(text: "Driver Notes"),
                SizedBox(height: 15.h),
                TextFormField(
                  controller: driverNotesController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your note';
                    }
                    return null;
                  },
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
                BlocBuilder<AmenitiesCubit, AmenitiesState>(
                  builder: (context, state) {
                    return Column(
                      children: state.selectedAmenities.entries.map((entry) {
                        return CheckboxListTile(
                          title: Text(_getAmenityLabel(entry.key)),
                          value: entry.value,
                          onChanged: (value) {
                            context
                                .read<AmenitiesCubit>()
                                .toggleAmenity(entry.key);
                          },
                        );
                      }).toList(),
                    );
                  },
                ),
                SizedBox(height: 15.h),
                ElevatedButton(
                  onPressed: () async {
                    if (fromLocation != null || toLocation != null) {
                      if (keyForm.currentState!.validate()) {
                        keyForm.currentState!.save();
                        log(availableSeatsController.text);
                        Map<String, bool> amenities =
                            context.read<AmenitiesCubit>().getAmenities();
                        final trip = CreateTripModel(
                          fromLocation: formLocatiomModel,
                          toLocation: toLocatiomModel,
                          departureTime: DateTime.now(),
                          availableSeats:
                              int.parse(availableSeatsController.text.trim()),
                          pricePerSeat: int.parse(priceController.text.trim()),
                          driverNotes: driverNotesController.text,
                          hasWiFi: amenities['hasWiFi'],
                          hasPhoneCharger: amenities['hasPhoneCharger'],
                          hasAirConditioning: amenities['hasAirConditioning'],
                          hasChildSeat: amenities['hasChildSeat'],
                          hasFreeWater: amenities['hasFreeWater'],
                          hasMusic: amenities['hasMusic'],
                        );

                        context
                            .read<CreateTripCubit>()
                            .greateTrip(trip, context);
                      }
                    } else {
                      SnackbarHelper.showError(
                        context,
                        title: "Must select distance",
                      );
                    }
                  },
                  child: BlocConsumer<CreateTripCubit, CreateTripState>(
                    listener: (context, state) async {
                      if (state is CreateTripFailure) {
                        if (state.errorMessage ==
                            "Session expired. Please log in again.") {
                          ErrorDialogWidget(message: state.errorMessage)
                              .show(context);
                          // await SharedPreferencesService().logout();

                          // Navigator.pushNamedAndRemoveUntil(
                          //   context,
                          //   AppRoutesName.selectTypeScreenRoute,
                          //   (route) => false,
                          // );
                        }
                      } else if (state is CreateTripSuccess) {
                        Navigator.pop(context);
                      }
                    },
                    builder: (context, state) {
                      if (state is CreateTripLoading) {
                        return SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                        );
                      } else {
                        return Text("Confirm publish trip");
                      }
                    },
                  ),
                ),
                SizedBox(height: 15.h),
              ],
            ),
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

  String _getAmenityLabel(String key) {
    switch (key) {
      case "hasWiFi":
        return "Wi-Fi";
      case "hasPhoneCharger":
        return "Phone Charger";
      case "hasAirConditioning":
        return "Air Conditioning";
      case "hasChildSeat":
        return "Child Seat";
      case "hasFreeWater":
        return "Free Water";
      case "hasMusic":
        return "USB/AUX for Music";
      default:
        return key;
    }
  }
}
