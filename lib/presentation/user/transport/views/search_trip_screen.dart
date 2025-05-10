import 'dart:async';
import 'dart:developer';
import 'dart:math' as math;
import 'package:aoun_app/core/utils/location/location_Provider.dart';
import 'package:aoun_app/core/utils/map/google_map.dart';
import 'package:aoun_app/data/model/trip%20models/active_trip_requests/active_trip_requests.dart';
import 'package:aoun_app/data/model/trip%20models/greate_trip_model/trip_location.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:aoun_app/presentation/driver/home/view_model/Textfeild%20Search%20location/textfeild_search_location_cubit.dart';
import 'package:aoun_app/presentation/driver/home/view_model/active%20trip%20request/active_trip_requests_cubit.dart';
import 'package:aoun_app/presentation/user/transport/view_model/create%20request%20trip/create_request_trip_cubit.dart';
import 'package:aoun_app/presentation/user/transport/view_model/search%20trip/search_trip_cubit.dart';
import 'package:aoun_app/presentation/widgets/common/appBar_widget.dart';
import 'package:aoun_app/presentation/widgets/common/error_dialog_widget.dart';
import 'package:aoun_app/presentation/widgets/common/placeautocomplete_shimmer_widget.dart';
import 'package:aoun_app/presentation/widgets/common/success_dialog_widget.dart';
import 'package:aoun_app/presentation/widgets/common/trip_shimmer_widget.dart';
import 'package:aoun_app/presentation/widgets/specific/trip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uuid/uuid.dart';

class SearchTripScreen extends StatefulWidget {
  const SearchTripScreen({super.key});

  @override
  State<SearchTripScreen> createState() => _SearchTripScreenState();
}

class _SearchTripScreenState extends State<SearchTripScreen> {
  late FocusNode _focusNode;
  late TextEditingController _toController;
  late TextEditingController _formController;
  bool isSelectingSuggestion = false;
  bool isSearching = false;
  Timer? _debounce;
  String? sessiontoken;
  String? activeField;
  LocationTrip? formLocatiomModel, toLocatiomModel;

  @override
  void initState() {
    _toController = TextEditingController();
    _formController = TextEditingController(
        text:
            "${context.read<LocationProvider>().placemark!.subAdministrativeArea!.trim()}, ${context.read<LocationProvider>().placemark!.locality}");

    _focusNode = FocusNode()..requestFocus();
    context.read<ActiveTripRequestsCubit>().getActiveTripRequests();
    context.read<SearchTripCubit>().emitInitial();
    context.read<TextfeildSearchLocationCubit>().emitInitial();
    _onChanged();
    super.initState();
  }

  _onChanged() async {
    formLocatiomModel = LocationTrip(
      longitude: context.read<LocationProvider>().position!.longitude,
      latitude: context.read<LocationProvider>().position!.latitude,
      fullAddress:
          "${context.read<LocationProvider>().placemark!.subAdministrativeArea!.trim()}, ${context.read<LocationProvider>().placemark!.locality}",
      displayName: "${context.read<LocationProvider>().placemark!.locality}",
      additionalNotes: "",
    );
    _formController.addListener(_fromListener);
    _toController.addListener(_toListener);
  }

  void _fromListener() async {
    activeField = "from";
    if (isSelectingSuggestion || _formController.text.trim().isEmpty) return;
    setState(() {
      isSearching = true;
    });
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(
      Duration(milliseconds: 200),
      () async {
        if (_formController.text.trim().isNotEmpty) {
          sessiontoken ??= Uuid().v4();
          context
              .read<TextfeildSearchLocationCubit>()
              .getSuggestionPlaces(_formController.text.trim(), sessiontoken!);
        }
      },
    );
  }

  void _toListener() async {
    activeField = "to";
    if (isSelectingSuggestion || _toController.text.trim().isEmpty) return;
    setState(() {
      isSearching = true;
    });
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(
      Duration(milliseconds: 200),
      () async {
        if (_formController.text.trim().isNotEmpty &&
            _toController.text.trim().isNotEmpty) {
          sessiontoken ??= Uuid().v4();
          context
              .read<TextfeildSearchLocationCubit>()
              .getSuggestionPlaces(_toController.text.trim(), sessiontoken!);
        }
      },
    );
  }

  void onFieldSubmitted(value) async {
    setState(() {
      isSelectingSuggestion = true;
      isSearching = false;
    });

    _focusNode.unfocus();
    context.read<SearchTripCubit>().searchTrip(
          _formController.text.trim(),
          _toController.text.trim(),
        );

    if (activeField == "to") {
      var latlng = await GoogleMapUtils().getLatLngFromAddress(
        _toController.text,
        sessiontoken!,
      );
      toLocatiomModel = LocationTrip(
        displayName: _toController.text.trim().split(" ").first,
        fullAddress: _toController.text,
        latitude: latlng!.latitude,
        longitude: latlng.longitude,
        additionalNotes: "",
      );
    } else if (activeField == "from") {
      var latlng = await GoogleMapUtils().getLatLngFromAddress(
        _formController.text,
        sessiontoken!,
      );
      formLocatiomModel = LocationTrip(
        displayName: _formController.text.trim().split(" ").first,
        fullAddress: _formController.text,
        latitude: latlng!.latitude,
        longitude: latlng.longitude,
        additionalNotes: "",
      );
    }

    sessiontoken = null;
    activeField = null;
    setState(() {
      isSelectingSuggestion = false;
    });
  }

  @override
  void dispose() {
    _formController.removeListener(_fromListener);
    _toController.removeListener(_toListener);
    _toController.dispose();
    _formController.dispose();
    _debounce?.cancel();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: "Enter your route",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13.0),
              child: TextFormField(
                onFieldSubmitted: onFieldSubmitted,
                textInputAction: TextInputAction.search,
                controller: _formController,
                decoration: InputDecoration(
                  hintText: "From",
                ),
              ),
            ),
            SizedBox(height: 15.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13.0),
              child: TextFormField(
                onFieldSubmitted: onFieldSubmitted,
                textInputAction: TextInputAction.search,
                controller: _toController,
                focusNode: _focusNode,
                decoration: InputDecoration(
                  hintText: "To",
                ),
              ),
            ),
            SizedBox(height: 20.h),
            BlocBuilder<TextfeildSearchLocationCubit,
                TextfeildSearchLocationState>(
              builder: (context, state) {
                if (isSearching && state is TextfeildSearchLocationSuccsess) {
                  return ListView.separated(
                    padding: EdgeInsets.only(top: 0),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => Divider(
                      thickness: .5,
                      height: 0,
                    ),
                    itemCount: state.palceAutocompleteModel.length,
                    itemBuilder: (context, index) => ListTile(
                      onTap: () async {
                        setState(() {
                          isSelectingSuggestion = true;
                          isSearching = false;
                        });
                        if (activeField == "to") {
                          _toController.text =
                              state.palceAutocompleteModel[index].description!;
                        } else if (activeField == "from") {
                          _formController.text =
                              state.palceAutocompleteModel[index].description!;
                        }

                        _focusNode.unfocus();
                        context.read<SearchTripCubit>().searchTrip(
                              _formController.text.trim(),
                              _toController.text.trim(),
                            );
                        var latlng =
                            await GoogleMapUtils().getPlaceLatLngFromID(
                          state.palceAutocompleteModel[index].placeId!,
                          sessiontoken!,
                        );
                        List<String> parts = state
                            .palceAutocompleteModel[index].description!
                            .split(',')
                            .map((e) => e.trim())
                            .toList();
                        if (activeField == "to") {
                          toLocatiomModel = LocationTrip(
                            displayName: parts.length >= 2
                                ? parts[parts.length - 2]
                                : parts.last,
                            fullAddress: state
                                .palceAutocompleteModel[index].description!,
                            latitude: latlng.location!.lat,
                            longitude: latlng.location!.lng,
                            additionalNotes: "",
                          );
                        } else if (activeField == "from") {
                          formLocatiomModel = LocationTrip(
                            displayName: parts.length >= 2
                                ? parts[parts.length - 2]
                                : parts.last,
                            fullAddress: state
                                .palceAutocompleteModel[index].description!,
                            latitude: latlng.location!.lat,
                            longitude: latlng.location!.lng,
                            additionalNotes: "",
                          );
                        }

                        sessiontoken = null;
                        activeField = null;
                        setState(() {
                          isSelectingSuggestion = false;
                        });
                      },
                      leading: Icon(
                        Iconsax.location,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: Text(
                        state.palceAutocompleteModel[index].description!,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  );
                } else if (state is TextfeildSearchLocationLoading) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>
                        PlaceAutocompleteShimmerWidget(),
                    itemCount: 5,
                  );
                } else if (state is TextfeildSearchLocationFailure) {
                  return Text("Error");
                } else {
                  return BlocBuilder<SearchTripCubit, SearchTripState>(
                    builder: (context, state) {
                      if (state is SearchTripInitial &&
                          !isSelectingSuggestion) {
                        return Text("All trips");
                      } else if (state is SearchTripLoading) {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (context, index) => TripShimmerWidget(),
                          itemCount: 5,
                        );
                      } else if (state is SearchTripEmpity &&
                          !isSelectingSuggestion) {
                        return BlocBuilder<ActiveTripRequestsCubit,
                            ActiveTripRequestsState>(
                          builder: (context, state) {
                            if (state is ActiveTripRequestsSuccess) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 13.0),
                                child: Column(
                                  children: [
                                    Text(
                                        "No trips found for this destination.\nYou can set it as your active destination to get notified when a driver creates a trip.",
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium),
                                    SizedBox(height: 10.h),
                                    ElevatedButton(
                                      onPressed: () {
                                        context
                                            .read<CreateRequestTripCubit>()
                                            .createRequestTrip(
                                                formLocatiomModel!,
                                                toLocatiomModel!);

                                        log(formLocatiomModel!.fullAddress
                                            .toString());
                                        log(toLocatiomModel!.fullAddress
                                            .toString());
                                      },
                                      child: BlocConsumer<
                                          CreateRequestTripCubit,
                                          CreateRequestTripState>(
                                        listener: (context, state) {
                                          if (state
                                              is CreateRequestTripFailure) {
                                            ErrorDialogWidget(
                                                    message: state.errorMessage)
                                                .show(context);
                                          } else if (state
                                              is CreateRequestTripSuccess) {
                                            SuccessDialogWidget(
                                              message: state.message,
                                              title: S
                                                  .of(context)
                                                  .confirmed_successfully,
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(S
                                                      .of(context)
                                                      .ok_AlertDialogt),
                                                ),
                                              ],
                                            ).show(context);
                                          }
                                        },
                                        builder: (context, state) {
                                          if (state
                                              is CreateRequestTripLoading) {
                                            return SizedBox(
                                              height: 30,
                                              width: 30,
                                              child: CircularProgressIndicator(
                                                color: Theme.of(context)
                                                    .scaffoldBackgroundColor,
                                              ),
                                            );
                                          } else {
                                            return Text(
                                                "Set Active Destination");
                                          }
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 20.h),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: state.tripList.length,
                                      itemBuilder: (context, index) {
                                        return _recentOrderWidget(
                                          context,
                                          state.tripList[index],
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          },
                        );
                      } else if (state is SearchTripSuccess &&
                          !isSelectingSuggestion) {
                        return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.list.length,
                          itemBuilder: (context, index) {
                            return TripWidget();
                          },
                        );
                      } else {
                        return SizedBox();
                      }
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _recentOrderWidget(BuildContext context, ActiveTripRequests model) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Container(
        height: 80.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Row(
          children: [
            SizedBox(width: 7.w),
            Container(
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.r),
                border: Border.all(
                  width: 1,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              child: Icon(Iconsax.profile_2user),
            ),
            SizedBox(width: 7.w),
            _TripDetails(model),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final String value;

  const _InfoCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 20,
      height: 65.h,
      padding: EdgeInsets.all(7.r),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  fontSize: 12.sp,
                ),
          ),
          SizedBox(height: 5.h),
          Text(
            value,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
          ),
        ],
      ),
    );
  }
}

class _TripDetails extends StatelessWidget {
  ActiveTripRequests model;
  _TripDetails(this.model);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _TripDetailRow(
            iconRotation: math.pi / 4,
            label: "From: ${model.fromLocation!.fullAddress}"),
        _TripDetailRow(
            iconRotation: -3 * math.pi / 4,
            label: "To: ${model.toLocation!.fullAddress}"),
        _TripDetailRow(
            icon: Iconsax.map_1,
            label: " Active passengers: ${model.activePassengers}"),
      ],
    );
  }
}

class _TripDetailRow extends StatelessWidget {
  final double? iconRotation;
  final IconData icon;
  final String label;

  const _TripDetailRow({
    this.iconRotation,
    this.icon = Iconsax.arrow_right_1,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        iconRotation != null
            ? Transform.rotate(
                angle: iconRotation!,
                child: Icon(icon, size: 20.w),
              )
            : Icon(icon, size: 17.w),
        SizedBox(width: 2.w),
        SizedBox(
          width: 220.w,
          child: Text(
            label,
            style: Theme.of(context).textTheme.labelSmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
