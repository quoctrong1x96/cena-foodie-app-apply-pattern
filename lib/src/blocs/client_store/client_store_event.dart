part of 'client_store_bloc.dart';

@immutable
abstract class ClientStoreEvent {}

class OnOpenStoreEvent extends ClientStoreEvent {
  final Store store;
  OnOpenStoreEvent(this.store);
}

class OnCloseStoreEvent extends ClientStoreEvent {
  OnCloseStoreEvent();
}
