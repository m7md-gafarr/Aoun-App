import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'amenities_state.dart';

class AmenitiesCubit extends Cubit<AmenitiesState> {
  AmenitiesCubit()
      : super(
          AmenitiesSuccess({
            "hasWiFi": false,
            "hasPhoneCharger": false,
            "hasAirConditioning": false,
            "hasChildSeat": false,
            "hasFreeWater": false,
            "hasMusic": false,
          }),
        );

  void toggleAmenity(String key) {
    final updatedMap = Map<String, bool>.from(state.selectedAmenities);
    updatedMap[key] = !updatedMap[key]!;
    emit(AmenitiesSuccess(updatedMap));
  }

  Map<String, bool> getAmenities() => state.selectedAmenities;
}
