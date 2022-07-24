part of 'product_bloc.dart';

@immutable
abstract class ProductsEvent {}

class OnAddNewCategoryEvent extends ProductsEvent {
  final String nameCategory;
  final String descriptionCategory;
  final int storeId;

  OnAddNewCategoryEvent(
      this.nameCategory, this.descriptionCategory, this.storeId);
}

class OnUpdateCategoryEvent extends ProductsEvent {
  final String nameCategory;
  final String descriptionCategory;
  final int categoryId;
  final int storeId;

  OnUpdateCategoryEvent(this.categoryId, this.nameCategory,
      this.descriptionCategory, this.storeId);
}

class OnSelectCategoryEvent extends ProductsEvent {
  final int idCategory;
  final String category;

  OnSelectCategoryEvent(this.idCategory, this.category);
}

class OnUnSelectCategoryEvent extends ProductsEvent {}

class OnSelectMultipleImagesEvent extends ProductsEvent {
  final List<XFile> images;

  OnSelectMultipleImagesEvent(this.images);
}

class OnUnSelectMultipleImagesEvent extends ProductsEvent {}

class OnAddNewProductEvent extends ProductsEvent {
  final Store store;
  final String name;
  final String description;
  final String price;
  final List<XFile> images;
  final String category;

  OnAddNewProductEvent(this.store, this.name, this.description, this.price,
      this.images, this.category);
}

class OnUpdateProductEvent extends ProductsEvent {
  final Store store;
  final String name;
  final String description;
  final String price;
  final List<XFile>? images;
  final String category;
  final int productId;

  OnUpdateProductEvent(this.store, this.productId, this.name, this.description,
      this.price, this.images, this.category);
}

class OnUpdateStatusProductEvent extends ProductsEvent {
  final String idProduct;
  final int storeId;
  final String status;

  OnUpdateStatusProductEvent(this.storeId, this.idProduct, this.status);
}

class OnDeleteProductEvent extends ProductsEvent {
  final int storeId;
  final String idProduct;

  OnDeleteProductEvent(this.storeId, this.idProduct);
}

class OnSearchProductEvent extends ProductsEvent {
  final String searchProduct;

  OnSearchProductEvent(this.searchProduct);
}
