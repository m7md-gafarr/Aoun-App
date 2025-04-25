part of 'amenities_cubit.dart';

@immutable
abstract class AmenitiesState {
  final Map<String, bool> selectedAmenities;

  AmenitiesState(this.selectedAmenities);
}

class AmenitiesSuccess extends AmenitiesState {
  AmenitiesSuccess(Map<String, bool> amenities) : super(amenities);
}
