import 'package:animations/animations.dart';
import 'package:aoun_app/core/utils/dialog/dialog_helper.dart';
import 'package:aoun_app/core/utils/snakbar/snackebar_helper.dart';
import 'package:aoun_app/data/model/trip%20models/get_trip_route/get_trip_route.dart';
import 'package:aoun_app/data/model/trip%20models/greate_trip_model/greate_trip_model.dart';
import 'package:aoun_app/data/model/trip%20models/trip_location_model.dart';
import 'package:aoun_app/data/repositories/remote/trip_repository.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:aoun_app/presentation/driver/history%20trips/view/driver_history_trips.dart';
import 'package:aoun_app/presentation/driver/history%20trips/view_model/driver_trips_history/driver_trips_history_cubit.dart';
import 'package:aoun_app/presentation/driver/history%20trips/view_model/driver_trips_history/driver_trips_history_cubit.dart';
import 'package:aoun_app/presentation/driver/home/view/select_route_on_map_screen.dart';
import 'package:aoun_app/presentation/driver/home/view_model/amenities/amenities_cubit.dart';
import 'package:aoun_app/presentation/driver/home/view_model/driver%20create%20trip%20or%20not/driver_create_trip_or_not_cubit.dart';
import 'package:aoun_app/presentation/driver/home/view_model/grate%20trip/create_trip_cubit.dart';
import 'package:aoun_app/presentation/user/transport/views/trip_details_screen.dart';
import 'package:aoun_app/presentation/widgets/common/appBar_widget.dart';
import 'package:aoun_app/presentation/widgets/common/divider_widget.dart';
import 'package:aoun_app/presentation/widgets/common/title_section_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax/iconsax.dart';

class CreateTripScreen extends StatefulWidget {
  const CreateTripScreen({super.key});

  @override
  State<CreateTripScreen> createState() => _CreateTripScreenState();
}

class _CreateTripScreenState extends State<CreateTripScreen> {
  String? fromLocation, toLocation;
  TripLocationModel? formLocatiomModel, toLocatiomModel;
  GlobalKey<FormState> keyForm = GlobalKey();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController availableSeatsController =
      TextEditingController();
  final TextEditingController driverNotesController = TextEditingController();
  final TextEditingController departureTimeController = TextEditingController();
  GetTripRoute? tripRoute;
  DateTime? selectedDepartureTime;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    priceController.dispose();
    availableSeatsController.dispose();
    driverNotesController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments;
    if (arguments != null && arguments is List && arguments.length >= 2) {
      formLocatiomModel = arguments[0];
      fromLocation = formLocatiomModel!.fullAddress;
      toLocatiomModel = arguments[1];
      toLocation = toLocatiomModel!.fullAddress;
    }
    if (tripRoute == null &&
        formLocatiomModel != null &&
        toLocatiomModel != null) {
      getRoute();
    }
  }

  getRoute() async {
    tripRoute = await TripRepository().getTripRoute(
        LatLng(formLocatiomModel!.latitude!, formLocatiomModel!.longitude!),
        LatLng(toLocatiomModel!.latitude!, toLocatiomModel!.longitude!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: S.of(context).create_trip_title,
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
                            S.of(context).create_trip_from_label,
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
                                if (tripRoute == null &&
                                    formLocatiomModel != null &&
                                    toLocatiomModel != null) {
                                  getRoute();
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
                                          S.of(context).create_trip_choose_map,
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
                            S.of(context).create_trip_to_label,
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
                                if (tripRoute == null &&
                                    formLocatiomModel != null &&
                                    toLocatiomModel != null) {
                                  getRoute();
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
                                          S.of(context).create_trip_choose_map,
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
                      return S
                          .of(context)
                          .create_trip_available_seats_validation;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: S.of(context).create_trip_available_seats_hint,
                  ),
                ),
                SizedBox(height: 15.h),
                TextFormField(
                  controller: priceController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return S.of(context).create_trip_price_validation;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: S.of(context).create_trip_price_hint,
                  ),
                ),
                SizedBox(height: 15.h),
                TextFormField(
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 5)),
                    );

                    if (pickedDate != null) {
                      TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );

                      if (pickedTime != null) {
                        final DateTime fullDateTime = DateTime(
                          pickedDate.year,
                          pickedDate.month,
                          pickedDate.day,
                          pickedTime.hour,
                          pickedTime.minute,
                        );

                        departureTimeController.text =
                            "${fullDateTime.year}-${fullDateTime.month.toString().padLeft(2, '0')}-${fullDateTime.day.toString().padLeft(2, '0')} "
                            "${pickedTime.format(context)}";
                        selectedDepartureTime = fullDateTime;
                      }
                    }
                  },
                  readOnly: true,
                  controller: departureTimeController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return S
                          .of(context)
                          .create_trip_departure_time_validation;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: S.of(context).create_trip_departure_time_hint,
                  ),
                ),
                DividerWidget(),
                TitleSectionWidget(
                    text: S.of(context).create_trip_driver_notes_title),
                SizedBox(height: 15.h),
                TextFormField(
                  controller: driverNotesController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return S.of(context).create_trip_driver_notes_validation;
                    }
                    return null;
                  },
                  maxLines: 3,
                  cursorColor: Theme.of(context).primaryColor,
                  decoration: InputDecoration(
                    errorMaxLines: 2,
                    hintText: S.of(context).create_trip_driver_notes_hint,
                    hintStyle: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                DividerWidget(),
                TitleSectionWidget(
                    text: S.of(context).create_trip_amenities_title),
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

                        Map<String, bool> amenities =
                            context.read<AmenitiesCubit>().getAmenities();
                        final trip = CreateTripModel(
                          fromLocation: formLocatiomModel,
                          toLocation: toLocatiomModel,
                          departureTime:
                              selectedDepartureTime?.toUtc().toIso8601String(),
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
                          estimatedDistance:
                              tripRoute!.routes![0].distanceMeters,
                          estimatedDuration: convertSecondsToTimeSpan(
                              tripRoute!.routes![0].duration!),
                        );

                        context
                            .read<CreateTripCubit>()
                            .greateTrip(trip, context);
                      }
                    } else {
                      SnackbarHelper.showError(
                        context,
                        title: S.of(context).create_trip_distance_error,
                      );
                    }
                  },
                  child: BlocConsumer<CreateTripCubit, CreateTripState>(
                    listener: (context, state) async {
                      if (state is CreateTripFailure) {
                        DialogHelper(context)
                            .showErroeDialog(message: state.errorMessage);
                      } else if (state is CreateTripSuccess) {
                        Navigator.pop(context);
                        context
                            .read<DriverCreateTripOrNotCubit>()
                            .driverCreateTripOrNot();
                        context
                            .read<DriverTripsHistoryCubit>()
                            .getDriverTrips(forceRefresh: true);
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
                        return Text(S.of(context).create_trip_confirm_button);
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
        return S.of(context).create_trip_wifi;
      case "hasPhoneCharger":
        return S.of(context).create_trip_phone_charger;
      case "hasAirConditioning":
        return S.of(context).create_trip_air_conditioning;
      case "hasChildSeat":
        return S.of(context).create_trip_child_seat;
      case "hasFreeWater":
        return S.of(context).create_trip_free_water;
      case "hasMusic":
        return S.of(context).create_trip_music;
      default:
        return key;
    }
  }

  String convertSecondsToTimeSpan(String secondsWithSuffix) {
    int seconds = int.parse(secondsWithSuffix.replaceAll("s", ""));

    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int remainingSeconds = seconds % 60;

    return "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}";
  }
}
