import 'package:aoun_app/core/utils/map/google_map.dart';
import 'package:aoun_app/data/model/map%20models/palce_autocomplete_model/palce_autocomplete_model.dart';
import 'package:aoun_app/data/model/map%20models/palce_autocomplete_model/prediction.dart';
import 'package:bloc/bloc.dart';

part 'textfeild_search_location_state.dart';

class TextfeildSearchLocationCubit extends Cubit<TextfeildSearchLocationState> {
  TextfeildSearchLocationCubit() : super(TextfeildSearchLocationInitial());

  Future<void> getSuggestionPlaces(String text, String sessiontoken) async {
    if (text.trim().isEmpty) {
      emit(TextfeildSearchLocationIsEmpity());
      return;
    }

    try {
      emit(TextfeildSearchLocationInitial());

      PalceAutocompleteModel model =
          await GoogleMapUtils().getSuggestionPlaces(text, sessiontoken);

      if (model.status == "ZERO_RESULTS") {
        emit(TextfeildSearchLocationIsEmpity());
      } else if (model.status == "OK") {
        emit(TextfeildSearchLocationSuccsess(model.predictions!));
      } else {
        emit(TextfeildSearchLocationFailure(
            "Unexpected status: ${model.status}"));
      }
    } catch (e) {
      emit(TextfeildSearchLocationFailure(e.toString()));
    }
  }

  void emitInitial() {
    emit(TextfeildSearchLocationInitial());
  }
}
