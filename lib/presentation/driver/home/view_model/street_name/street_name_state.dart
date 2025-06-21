part of 'street_name_cubit.dart';

@immutable
sealed class StreetNameState {}

final class StreetNameInitial extends StreetNameState {}

final class StreetNameLoading extends StreetNameState {}

final class StreetNameSuccess extends StreetNameState {
  String nameLocation;
  StreetNameSuccess(this.nameLocation);
}

final class StreetNameFailure extends StreetNameState {
  String errorMessage;
  StreetNameFailure(this.errorMessage);
}
