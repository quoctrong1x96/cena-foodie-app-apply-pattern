part of 'store_bloc.dart';

@immutable
class StoreState {
  final String pictureProfilePath;

  final List<String>? listPicturePath;

  final Store? store;

  const StoreState(
      {this.pictureProfilePath = '', this.store, this.listPicturePath});

  StoreState copyWith({String? pictureProfilePath, Store? store}) => StoreState(
      pictureProfilePath: pictureProfilePath ?? this.pictureProfilePath,
      store: store ?? this.store);
}

class LoadingStoreState extends StoreState {}

class SuccessStoreState extends StoreState {}

class FailureStoreState extends StoreState {
  final String error;

  const FailureStoreState(this.error);
}
