part of 'debit_card_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DebitCardModelAdapter extends TypeAdapter<DebitCardModel> {
  @override
  final int typeId = 0;

  @override
  DebitCardModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DebitCardModel(
      cardNumber: fields[0] as String,
      fullName: fields[1] as String,
      cvv: fields[2] as String,
      validThru: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DebitCardModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.cardNumber)
      ..writeByte(1)
      ..write(obj.fullName)
      ..writeByte(2)
      ..write(obj.cvv)
      ..writeByte(3)
      ..write(obj.validThru);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DebitCardModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
