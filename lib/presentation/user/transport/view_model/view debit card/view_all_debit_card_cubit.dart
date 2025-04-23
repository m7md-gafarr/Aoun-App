import 'package:aoun_app/data/model/payment%20models/debit_card_model/debit_card_model.dart';
import 'package:aoun_app/data/repositories/local/hive.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'view_all_debit_card_state.dart';

class ViewAllDebitCardCubit extends Cubit<ViewAllDebitCardState> {
  ViewAllDebitCardCubit() : super(ViewAllDebitCardInitial());

  fetchDebitcard() async {
    emit(ViewAllDebitCardLoading());
    try {
      List<DebitCardModel> list = await HiveService().getAllDebitCard();

      if (list.isEmpty) {
        emit(ViewAllDebitCardNull());
      } else {
        emit(ViewAllDebitCardSuccess(list));
      }
    } catch (e) {
      emit(ViewAllDebitCardFailure(e.toString()));
    }
  }
}
