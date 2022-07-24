import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/store/store_model.dart';

part 'client_store_event.dart';
part 'client_store_state.dart';

class ClientStoreBloc extends Bloc<ClientStoreEvent, ClientStoreState> {
  ClientStoreBloc() : super(const ClientStoreState()) {
    on<OnOpenStoreEvent>(_onOpenStore);
    on<OnCloseStoreEvent>(_onCloseStore);
  }

  Future<void> _onOpenStore(
      OnOpenStoreEvent event, Emitter<ClientStoreState> emit) async {
    emit(state.copyWith(store: event.store));
  }

  Future<void> _onCloseStore(
      OnCloseStoreEvent event, Emitter<ClientStoreState> emit) async {
    emit(state.copyWith(store: null));
  }
}
