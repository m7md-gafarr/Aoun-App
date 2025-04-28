import 'package:aoun_app/core/utils/location/location_utils.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'street_name_state.dart';

class StreetNameCubit extends Cubit<StreetNameState> {
  StreetNameCubit() : super(StreetNameInitial());
  Placemark? placemark;
  getStreetName(LatLng selectedLocation, BuildContext context) async {
    emit(StreetNameLoading());
    try {
      placemark = await LocationService.getAddressFromCoordinates(
        context,
        selectedLocation.latitude,
        selectedLocation.longitude,
      );

      var currentAddress = [
        placemark!.subThoroughfare,
        placemark!.thoroughfare,
        placemark!.subLocality,
        placemark!.locality,
      ].firstWhere((element) => element != null && element.isNotEmpty,
          orElse: () => "Unknown address");

      emit(StreetNameSuccess(currentAddress!));
    } catch (e) {
      emit(StreetNameFailure(e.toString()));
    }
  }
}
