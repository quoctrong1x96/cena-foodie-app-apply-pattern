import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/app_locator.dart';
import '../../../data/models/entities/store/store.dart';
import '../../../data/models/entities/user/user.dart';
import '../../../data/models/entities/user/user_request.dart';
import '../../../data/services/entities/auth_service.dart';
import '../../../data/services/entities/user_service.dart';
import '../../../data/services/local/storage_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _authService = locator<IAuthService>();
  final _userService = locator<IUserService>();
  final _storageService = locator<IStorageService>();

  AuthBloc() : super(const AuthState()) {
    on<LoginEvent>(_onLogin);
    on<CheckLoginEvent>(_onCheckLogin);
    on<LogOutEvent>(_onLogOut);
    on<LoginPhoneEvent>(_onLoginPhone);
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    try {
      emit(LoadingAuthState());

      final response = await _authService
          .onEmail(UserRequest(email: event.email, password: event.password));

      await Future.delayed(const Duration(milliseconds: 550));

      if (!response.hasError) {
        await _storageService.clearStorageData();

        await _storageService.saveAccessToken(response.data!.token);

        await _userService.updateNotifyToken(
            userId: response.data!.user!.id,
            notifyToken: response.data!.user!.notificationToken);

        emit(state.copyWith(
            user: response.data!.user,
            rolId: response.data!.user!.rolId.toString(),
            store: response.data!.store));
      } else {
        emit(FailureAuthState(response.errorMessage!));
      }
    } catch (e) {
      emit(FailureAuthState(e.toString()));
    }
  }

  Future<void> _onLoginPhone(
      LoginPhoneEvent event, Emitter<AuthState> emit) async {
    try {
      emit(LoadingAuthState());

      final response =
          await _authService.onPhone(UserRequest(numberPhone: event.phone));

      await Future.delayed(const Duration(milliseconds: 550));

      if (!response.hasError) {
        await _storageService.clearStorageData();

        await _storageService.saveAccessToken(response.data!.token);

        await _userService.updateNotifyToken(
            userId: response.data!.user!.id,
            notifyToken: response.data!.user!.notificationToken);

        emit(state.copyWith(
            user: response.data!.user,
            rolId: response.data!.user!.rolId.toString(),
            store: response.data!.store));
      } else {
        emit(FailureAuthState(response.errorMessage!));
      }
    } catch (e) {
      emit(FailureAuthState(e.toString()));
    }
  }

  Future<void> _onCheckLogin(
      CheckLoginEvent event, Emitter<AuthState> emit) async {
    try {
      emit(LoadingAuthState());

      if (await _storageService.getAccessToken() != null) {
        final response = await _authService.renewToken();

        if (!response.hasError) {
          await _storageService.saveAccessToken(response.data!.token);

          emit(state.copyWith(
              user: response.data!.user,
              rolId: response.data!.user!.rolId.toString(),
              store: response.data!.store));
        } else {
          emit(LogOutAuthState());
        }
      } else {
        emit(LogOutAuthState());
      }
    } catch (e) {
      emit(FailureAuthState(e.toString()));
    }
  }

  Future<void> _onLogOut(LogOutEvent event, Emitter<AuthState> emit) async {
    await _storageService.clearStorageData();
    emit(state.copyWith(user: null, rolId: ''));
    emit(LogOutAuthState());
  }
}
