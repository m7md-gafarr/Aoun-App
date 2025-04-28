part of 'textfeild_search_location_cubit.dart';

sealed class TextfeildSearchLocationState {}

final class TextfeildSearchLocationInitial
    extends TextfeildSearchLocationState {}

final class TextfeildSearchLocationLoading
    extends TextfeildSearchLocationState {}

final class TextfeildSearchLocationIsEmpity
    extends TextfeildSearchLocationState {}

final class TextfeildSearchLocationSuccsess
    extends TextfeildSearchLocationState {
  List<Prediction> palceAutocompleteModel;
  TextfeildSearchLocationSuccsess(this.palceAutocompleteModel);
}

final class TextfeildSearchLocationFailure
    extends TextfeildSearchLocationState {
  String errorMessage;
  TextfeildSearchLocationFailure(this.errorMessage);
}
