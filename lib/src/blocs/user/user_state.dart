part of 'user_bloc.dart';

@immutable
class UserState {
  final String pictureProfilePath;
  final String? message;

  final Address? address;

  final User? user;

  const UserState(
      {this.address,
      this.pictureProfilePath = '',
      this.user,
      this.message = ''});

  UserState copyWith(
          {Address? address,
          String? pictureProfilePath,
          User? user,
          String? message}) =>
      UserState(
          address: address ?? this.address,
          message: message ?? this.message,
          pictureProfilePath: pictureProfilePath ?? this.pictureProfilePath,
          user: user ?? this.user);
}

class LoadingUserState extends UserState {}

class SuccessUserState extends UserState {}

class FailureUserState extends UserState {
  final String error;

  const FailureUserState(this.error);
}
