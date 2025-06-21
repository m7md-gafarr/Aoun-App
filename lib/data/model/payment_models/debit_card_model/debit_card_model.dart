import 'package:hive/hive.dart';
part 'debit_card_model.g.dart';

@HiveType(typeId: 0)
class DebitCardModel extends HiveObject {
  @HiveField(0)
  final String cardNumber;
  @HiveField(1)
  final String fullName;
  @HiveField(2)
  final String cvv;
  @HiveField(3)
  final String validThru;

  DebitCardModel({
    required this.cardNumber,
    required this.fullName,
    required this.cvv,
    required this.validThru,
  });
}
