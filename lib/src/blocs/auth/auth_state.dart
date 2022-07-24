part of 'auth_bloc.dart';

@immutable
class AuthState {
  final User? user;
  final Store? store;
  final String rolId;

  const AuthState({this.user, this.rolId = '', this.store});

  AuthState copyWith({User? user, Store? store, String? rolId}) => AuthState(
      user: user ?? this.user,
      store: store ?? this.store,
      rolId: rolId ?? this.rolId);
}

class LoadingAuthState extends AuthState {}

class SuccessAuthState extends AuthState {}

class LogOutAuthState extends AuthState {}

class FailureAuthState extends AuthState {
  final String error;
  const FailureAuthState(this.error);
}
