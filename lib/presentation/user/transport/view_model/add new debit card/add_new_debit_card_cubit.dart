import 'package:aoun_app/data/model/debit_card_model/debit_card_model.dart';
import 'package:aoun_app/data/repositories/local/hive.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_new_debit_card_state.dart';

class AddNewDebitCardCubit extends Cubit<AddNewDebitCardState> {
  AddNewDebitCardCubit() : super(AddNewDebitCardInitial());

  addDebitCard(DebitCardModel model) async {
    emit(AddNewDebitCardLoading());
    try {
      await HiveService().addDebitCard(model);
      emit(AddNewDebitCardSuccess());
    } catch (e) {
      emit(AddNewDebitCardFailure(e.toString()));
    }
  }
}
