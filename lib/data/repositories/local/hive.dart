import 'package:aoun_app/data/model/payment%20models/debit_card_model/debit_card_model.dart';
import 'package:hive/hive.dart';

class HiveService {
  static const String DEBITCARDBOX = "debit_card_box";

  late Box<DebitCardModel> boxDebitcard;

  HiveService() {
    openBox();
  }

  Future<void> openBox() async {
    if (!Hive.isBoxOpen(DEBITCARDBOX)) {
      boxDebitcard = await Hive.openBox<DebitCardModel>(DEBITCARDBOX);
    } else {
      boxDebitcard = Hive.box<DebitCardModel>(DEBITCARDBOX);
    }
  }

  Future<void> addDebitCard(DebitCardModel model) async {
    await boxDebitcard.add(model);
  }

  Future<void> deleteDebitCard(int index) async {
    await boxDebitcard.deleteAt(index);
  }

  Future<void> deleteAllDebitCard() async {
    await boxDebitcard.clear();
  }

  Future<void> updateDebitCard(int index, DebitCardModel model) async {
    await boxDebitcard.putAt(index, model);
  }

  Future<DebitCardModel?> getDebitCard(int index) async {
    return boxDebitcard.getAt(index);
  }

  Future<List<DebitCardModel>> getAllDebitCard() async {
    return boxDebitcard.values.toList().cast<DebitCardModel>();
  }
}
