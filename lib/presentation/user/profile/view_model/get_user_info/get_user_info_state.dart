part of 'get_user_info_cubit.dart';

@immutable
sealed class GetUserInfoState {}

final class GetUserInfoInitial extends GetUserInfoState {}

final class GetUserInfoInitialLoading extends GetUserInfoState {}

final class GetUserInfoInitialSuccess extends GetUserInfoState {
  final UserModel userModel;
  GetUserInfoInitialSuccess(this.userModel);
}

final class GetUserInfoInitialFailure extends GetUserInfoState {
  final String errorMessage;
  GetUserInfoInitialFailure(this.errorMessage);
}
