part of 'amenities_cubit.dart';

@immutable
abstract class AmenitiesState {
  final Map<String, bool> selectedAmenities;

  const AmenitiesState(this.selectedAmenities);
}

class AmenitiesSuccess extends AmenitiesState {
  const AmenitiesSuccess(super.amenities);
}
