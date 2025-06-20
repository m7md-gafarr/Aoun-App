import 'package:aoun_app/data/model/payment%20models/debit_card_model/debit_card_model.dart';
import 'package:aoun_app/data/repositories/local/hive.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'view_all_debit_card_state.dart';

class ViewAllDebitCardCubit extends Cubit<ViewAllDebitCardState> {
  ViewAllDebitCardCubit() : super(ViewAllDebitCardInitial());
  List<DebitCardModel>? _list;

  List<DebitCardModel> get listCards => _list!;
  fetchDebitcard() async {
    emit(ViewAllDebitCardLoading());
    try {
      _list = await HiveService().getAllDebitCard();

      if (_list!.isEmpty) {
        emit(ViewAllDebitCardNull());
      } else {
        emit(ViewAllDebitCardSuccess(_list!));
      }
    } catch (e) {
      emit(ViewAllDebitCardFailure(e.toString()));
    }
  }
}
