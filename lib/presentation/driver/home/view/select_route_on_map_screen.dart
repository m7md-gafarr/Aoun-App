import 'package:aoun_app/core/app_images/app_images.dart';
import 'package:aoun_app/core/utils/location/location_utils.dart';
import 'package:aoun_app/core/utils/map/google_map.dart';
import 'package:aoun_app/data/model/driver%20models/greate_trip_model/trip_location.dart';
import 'package:aoun_app/data/model/map%20models/palce_autocomplete_model/prediction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax/iconsax.dart';

class SelectRouteOnMapScreen extends StatefulWidget {
  const SelectRouteOnMapScreen({super.key});

  @override
  State<SelectRouteOnMapScreen> createState() => _MapSelectRouteScreenState();
}

class _MapSelectRouteScreenState extends State<SelectRouteOnMapScreen> {
  late GoogleMapController mapController;
  late CameraPosition cameraPosition;
  late BitmapDescriptor myMarkerIcon;
  late TextEditingController searchController;
  LatLng? selectedLocation;
  late Position? _myPosition;
  bool isCameraMoving = false;
  String? currentAddress, returnLocationName;
  bool isFirstMove = true;
  LocationTrip? locationModel;
  List<Prediction> palceAutocompleteModel = [];
  bool showMarker = false;

  @override
  void initState() {
    searchController = TextEditingController();
    cameraPosition = CameraPosition(
      target: LatLng(26.74869101049492, 29.91485567756057),
      zoom: 5.65,
    );
    super.initState();

    _onChanged();
    loadMarkerIcon();
  }

  _onChanged() async {
    searchController.addListener(
      () async {
        if (searchController.text.isNotEmpty) {
          var result =
              await GoogleMapUtils.getSuggestionPlaces(searchController.text);

          palceAutocompleteModel.clear();
          palceAutocompleteModel.addAll(result.predictions!);
          setState(() {});
        }
      },
    );
  }

  @override
  void dispose() {
    mapController.dispose();
    searchController.dispose();
    super.dispose();
  }

  Future<void> loadMarkerIcon() async {
    myMarkerIcon = await GoogleMapUtils.bitmapDescriptorFromSvgAsset(
      Assets.imageMapMakerMyMakerLive,
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
    _myPosition = await LocationService.getCurrentLocation(context);
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(_myPosition!.latitude, _myPosition!.longitude),
          zoom: 18,
        ),
      ),
    );
    if (isFirstMove) {
      isFirstMove = false;
      return;
    }
    selectedLocation = LatLng(_myPosition!.latitude, _myPosition!.longitude);
    setState(() {});
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
                currentAddress = null;
              });
            },
            onCameraMove: (CameraPosition position) {
              selectedLocation = position.target;
            },
            onCameraIdle: () async {
              await Future.delayed(Duration(milliseconds: 300));
              setState(() {
                showMarker = true;
              });
              if (selectedLocation != null) {
                final name = await LocationService.getAddressFromCoordinates(
                  context,
                  selectedLocation!.latitude,
                  selectedLocation!.longitude,
                );

                locationModel = LocationTrip(
                  displayName: name!.thoroughfare,
                  fullAddress:
                      "${name.administrativeArea!.replaceAll("Governorate", "").trim()}, ${name.subAdministrativeArea}, ${name.thoroughfare}",
                  latitude: selectedLocation!.latitude,
                  longitude: selectedLocation!.longitude,
                  additionalNotes: "",
                );

                List<String> parts = [];

                if (name.administrativeArea != null) {
                  String adminArea = name.administrativeArea!
                      .replaceAll("Governorate", "")
                      .trim();
                  parts.add(adminArea);
                }
                if (name.subAdministrativeArea != null) {
                  parts.add(name.subAdministrativeArea!);
                }
                if (name.thoroughfare != null) parts.add(name.thoroughfare!);

                setState(() {
                  returnLocationName = parts.join(', ');
                  isCameraMoving = false;
                  currentAddress = name.thoroughfare ?? 'unknown';
                });
              }
            },
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 200),
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
                  child: Text(
                    (currentAddress?.isEmpty ?? true)
                        ? "unknown"
                        : currentAddress!,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 15.sp,
                        ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
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
          Positioned(
            top: 20.h,
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
                    suffixIcon: searchController.value.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.cancel),
                            onPressed: () {
                              searchController.clear();
                              setState(() {
                                palceAutocompleteModel.clear();
                              });
                            },
                          )
                        : null,
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
                Container(
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
                    itemCount: palceAutocompleteModel.length,
                    itemBuilder: (context, index) => ListTile(
                      onTap: () async {
                        var latlng = await GoogleMapUtils.getPlaceLatLng(
                            palceAutocompleteModel[index].placeId!);
                        palceAutocompleteModel.clear();
                        mapController.animateCamera(
                          CameraUpdate.newCameraPosition(
                            CameraPosition(
                              target: LatLng(
                                  latlng.location!.lat!, latlng.location!.lng!),
                              zoom: 16,
                            ),
                          ),
                        );
                      },
                      leading: Icon(
                        Iconsax.location,
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                      title: Text(
                        palceAutocompleteModel[index].description!,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
