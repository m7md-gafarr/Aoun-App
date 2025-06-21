part of 'deletetrip_cubit.dart';

@immutable
sealed class DeletetripState {}

final class DeletetripInitial extends DeletetripState {}

final class DeletetripLoading extends DeletetripState {}

final class DeletetripSuccess extends DeletetripState {}

final class DeletetripFailure extends DeletetripState {
  final String errorMessage;
  DeletetripFailure(this.errorMessage);
}
