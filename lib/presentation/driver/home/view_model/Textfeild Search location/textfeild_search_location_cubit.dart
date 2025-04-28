import 'package:aoun_app/core/utils/map/google_map.dart';
import 'package:aoun_app/data/model/map%20models/palce_autocomplete_model/palce_autocomplete_model.dart';
import 'package:aoun_app/data/model/map%20models/palce_autocomplete_model/prediction.dart';
import 'package:bloc/bloc.dart';
part 'textfeild_search_location_state.dart';

class TextfeildSearchLocationCubit extends Cubit<TextfeildSearchLocationState> {
  TextfeildSearchLocationCubit() : super(TextfeildSearchLocationInitial());
  getSuggestionPlaces(String text, String sessiontoken) async {
    emit(TextfeildSearchLocationInitial());

    try {
      if (text.isNotEmpty) {
        PalceAutocompleteModel model =
            await GoogleMapUtils().getSuggestionPlaces(text, sessiontoken);
        emit(TextfeildSearchLocationSuccsess(model.predictions!));
      } else {
        emit(TextfeildSearchLocationIsEmpity());
      }
    } catch (e) {
      emit(TextfeildSearchLocationFailure(e.toString()));
    }
  }
}
