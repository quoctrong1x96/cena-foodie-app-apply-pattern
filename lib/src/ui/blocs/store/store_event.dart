part of 'store_bloc.dart';

@immutable
abstract class StoreEvent {}

class OnGetStoreEvent extends StoreEvent {
  final Store store;
  OnGetStoreEvent(this.store);
}

class OnSelectPictureStoreEvent extends StoreEvent {
  final String pictureStorePath;
  final int storeId;

  OnSelectPictureStoreEvent(this.storeId, this.pictureStorePath);
}

class OnClearPicturePathStoreEvent extends StoreEvent {}

class OnChangeImageStoreEvent extends StoreEvent {
  final String image;
  final int storeId;

  OnChangeImageStoreEvent(this.storeId, this.image);
}

class OnChangeNameOfStoreEvent extends StoreEvent {
  final String storeName;
  final int storeId;

  OnChangeNameOfStoreEvent(this.storeId, this.storeName);
}

class OnChangeCategoriesStoreEvent extends StoreEvent {
  final String categories;
  final String description;
  final int categoryId;
  final int storeId;

  OnChangeCategoriesStoreEvent(
      this.storeId, this.categoryId, this.categories, this.description);
}

class OnChangeTimeStoreEvent extends StoreEvent {
  final DateTime openTime;
  final DateTime closeTime;
  final int storeId;

  OnChangeTimeStoreEvent(this.storeId, this.openTime, this.closeTime);
}
