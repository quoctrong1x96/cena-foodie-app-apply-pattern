part of 'client_store_bloc.dart';

@immutable
class ClientStoreState {
  final Store? store;

  const ClientStoreState({this.store});

  ClientStoreState copyWith({Store? store}) => ClientStoreState(store: store!);
}

class LoadingClientStoreState extends ClientStoreState {}

class SuccessClientStoreState extends ClientStoreState {}

class FailureClientStoreState extends ClientStoreState {
  final String error;

  const FailureClientStoreState(this.error);
}
