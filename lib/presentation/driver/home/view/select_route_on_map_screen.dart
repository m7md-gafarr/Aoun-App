import 'dart:async';
import 'dart:developer';

import 'package:aoun_app/core/app_images/app_images.dart';
import 'package:aoun_app/core/utils/location/location_utils.dart';
import 'package:aoun_app/core/utils/map/google_map.dart';
import 'package:aoun_app/data/model/driver%20models/greate_trip_model/trip_location.dart';
import 'package:aoun_app/presentation/driver/home/view_model/Textfeild%20Search%20location/textfeild_search_location_cubit.dart';
import 'package:aoun_app/presentation/driver/home/view_model/street%20name/street_name_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uuid/uuid.dart';

class SelectRouteOnMapScreen extends StatefulWidget {
  const SelectRouteOnMapScreen({super.key});

  @override
  State<SelectRouteOnMapScreen> createState() => _MapSelectRouteScreenState();
}

class _MapSelectRouteScreenState extends State<SelectRouteOnMapScreen> {
  late GoogleMapController mapController;
  late CameraPosition cameraPosition;
  late TextEditingController searchController;
  LatLng? selectedLocation;
  bool isCameraMoving = false;
  String? returnLocationName;
  bool isFirstMove = true;
  LocationTrip? locationModel;
  bool showMarker = false;
  Timer? _debounce;
  String? sessiontoken;

  @override
  void initState() {
    searchController = TextEditingController();
    cameraPosition = GoogleMapUtils.intialCameraPosition;
    _onChanged();
    super.initState();
  }

  _onChanged() async {
    searchController.addListener(
      () async {
        if (_debounce?.isActive ?? false) _debounce!.cancel();
        _debounce = Timer(Duration(milliseconds: 500), () async {
          sessiontoken ??= Uuid().v4();
          context
              .read<TextfeildSearchLocationCubit>()
              .getSuggestionPlaces(searchController.text, sessiontoken!);
        });
      },
    );
  }

  onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    initialMapStyle();
    getLocation(context);
  }

  void initialMapStyle() async {
    var loadString = await DefaultAssetBundle.of(context)
        .loadString("assets/map_styles/light_map_style.json");
    mapController.setMapStyle(loadString);
  }

  void getLocation(BuildContext context) async {
    Position? _myPosition = await LocationService.getCurrentLocation(context);
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(_myPosition!.latitude, _myPosition.longitude),
          zoom: 18,
        ),
      ),
    );

    if (isFirstMove) {
      isFirstMove = false;
      return;
    }

    setState(() {
      selectedLocation = LatLng(_myPosition.latitude, _myPosition.longitude);
    });
  }

  @override
  void dispose() {
    mapController.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: onMapCreated,
            initialCameraPosition: cameraPosition,
            zoomControlsEnabled: false,
            onCameraMoveStarted: () {
              setState(() {
                isCameraMoving = true;
              });
            },
            onCameraMove: (CameraPosition position) {
              selectedLocation = position.target;
            },
            onCameraIdle: () async {
              !isFirstMove
                  ? await Future.delayed(
                      Duration(milliseconds: 300),
                      () {
                        setState(() {
                          showMarker = true;
                        });
                      },
                    )
                  : null;

              if (selectedLocation != null) {
                context
                    .read<StreetNameCubit>()
                    .getStreetName(selectedLocation!, context);
                final name = context.read<StreetNameCubit>().placemark;

                locationModel = LocationTrip(
                  displayName: name!.thoroughfare,
                  fullAddress:
                      "${name.administrativeArea!.replaceAll("Governorate", "").trim()}, ${name.subAdministrativeArea}, ${name.thoroughfare}",
                  latitude: selectedLocation!.latitude,
                  longitude: selectedLocation!.longitude,
                  additionalNotes: "",
                );

                setState(() {
                  returnLocationName =
                      "${name.administrativeArea!.replaceAll("Governorate", "").trim()}, ${name.subAdministrativeArea}, ${name.thoroughfare}";
                  isCameraMoving = false;
                });
              }
            },
          ),

          //Marker
          AnimatedPositioned(
            duration: Duration(milliseconds: 150),
            curve: Curves.easeOut,
            top: MediaQuery.of(context).size.height / 2 -
                (isCameraMoving ? 70 : 50),
            left: MediaQuery.of(context).size.width / 2 - 14,
            child: showMarker
                ? SvgPicture.asset(
                    Assets.imageMapMakerMyMakerLive,
                    height: 48,
                  )
                : SizedBox.shrink(),
          ),
          // Location name
          if (!isCameraMoving && !isFirstMove)
            Positioned(
              top: MediaQuery.of(context).size.height * 0.37,
              left: MediaQuery.of(context).size.width / 2 - 114,
              child: Container(
                width: 200.w,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: BlocBuilder<StreetNameCubit, StreetNameState>(
                    builder: (context, state) {
                      if (state is StreetNameSuccess) {
                        return Text(
                          state.nameLocation,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontSize: 15.sp,
                                  ),
                          overflow: TextOverflow.ellipsis,
                        );
                      } else {
                        return SizedBox(
                          height: 22.w,
                          width: 22.w,
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          // Button Confirm location
          Positioned(
            bottom: 15,
            left: 13,
            right: 13,
            child: ElevatedButton(
              onPressed: () {
                if (selectedLocation != null) {
                  Navigator.pop(
                    context,
                    [returnLocationName, locationModel],
                  );
                }
              },
              child: Text("Confirm this location"),
            ),
          ),
          // Textfeild Search location
          Positioned(
            top: 30.h,
            left: 13,
            right: 13,
            child: Column(
              children: [
                TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Theme.of(context)
                        .colorScheme
                        .primaryContainer
                        .withOpacity(0.9),
                    hintText: "Search",
                    prefixIcon: Icon(
                      Iconsax.search_normal,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                BlocBuilder<TextfeildSearchLocationCubit,
                    TextfeildSearchLocationState>(
                  builder: (context, state) {
                    if (state is TextfeildSearchLocationSuccsess) {
                      return Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .primaryContainer
                                .withOpacity(0.9),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(7),
                              bottomRight: Radius.circular(7),
                            )),
                        child: ListView.separated(
                          padding: EdgeInsets.only(top: 0),
                          shrinkWrap: true,
                          separatorBuilder: (context, index) => Divider(
                            thickness: .5,
                            height: 0,
                          ),
                          itemCount: state.palceAutocompleteModel.length,
                          itemBuilder: (context, index) => ListTile(
                            onTap: () async {
                              var latlng =
                                  await GoogleMapUtils().getPlaceLatLng(
                                state.palceAutocompleteModel[index].placeId!,
                                sessiontoken!,
                              );
                              state.palceAutocompleteModel.clear();
                              searchController.clear();
                              sessiontoken = null;
                              mapController.animateCamera(
                                CameraUpdate.newCameraPosition(
                                  CameraPosition(
                                    target: LatLng(latlng.location!.lat!,
                                        latlng.location!.lng!),
                                    zoom: 16,
                                  ),
                                ),
                              );
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
                        ),
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
