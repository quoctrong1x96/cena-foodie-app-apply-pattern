import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../controllers/auth_controller.dart';
import '../../controllers/user_controller.dart';
import '../../helpers/secure_storage.dart';
import '../../models/response/response_login.dart';
import '../../models/store/store_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<LoginEvent>(_onLogin);
    on<CheckLoginEvent>(_onCheckLogin);
    on<LogOutEvent>(_onLogOut);
    on<LoginPhoneEvent>(_onLoginPhone);
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    try {
      emit(LoadingAuthState());

      final data =
          await authController.loginController(event.email, event.password);

      await Future.delayed(const Duration(milliseconds: 550));

      if (data.resp) {
        await secureStorage.deleteSecureStorage();

        await secureStorage.persistentToken(data.token!);

        await userController
            .updateNotificationToken(int.parse(data.user!.uid.toString()));

        emit(state.copyWith(
            user: data.user,
            rolId: data.user!.rolId.toString(),
            store: data.store));
      } else {
        emit(FailureAuthState(data.msg));
      }
    } catch (e) {
      emit(FailureAuthState(e.toString()));
    }
  }

  Future<void> _onLoginPhone(
      LoginPhoneEvent event, Emitter<AuthState> emit) async {
    try {
      emit(LoadingAuthState());

      final data = await authController.loginWithPhoneController(event.phone);

      await Future.delayed(const Duration(milliseconds: 550));

      if (data.resp) {
        await secureStorage.deleteSecureStorage();

        await secureStorage.persistentToken(data.token!);

        await userController
            .updateNotificationToken(int.parse(data.user!.uid.toString()));

        emit(state.copyWith(
            user: data.user,
            rolId: data.user!.rolId.toString(),
            store: data.store));
      } else {
        emit(FailureAuthState(data.msg));
      }
    } catch (e) {
      emit(FailureAuthState(e.toString()));
    }
  }

  Future<void> _onCheckLogin(
      CheckLoginEvent event, Emitter<AuthState> emit) async {
    try {
      emit(LoadingAuthState());

      if (await secureStorage.readToken() != null) {
        final data = await authController.renewLoginController();

        if (data.resp) {
          await secureStorage.persistentToken(data.token!);

          emit(state.copyWith(
              user: data.user,
              rolId: data.user!.rolId.toString(),
              store: data.store));
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
    await secureStorage.deleteSecureStorage();
    emit(state.copyWith(user: null, rolId: ''));
    emit(LogOutAuthState());
  }
}
