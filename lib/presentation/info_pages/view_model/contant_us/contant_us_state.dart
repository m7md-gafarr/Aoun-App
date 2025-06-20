part of 'contant_us_cubit.dart';

@immutable
sealed class ContantUsState {}

final class ContantUsInitial extends ContantUsState {}

final class ContantUsLoading extends ContantUsState {}

final class ContantUsSuccess extends ContantUsState {}

final class ContantUsFailure extends ContantUsState {}
