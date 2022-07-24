import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../controllers/category_controller.dart';
import '../../controllers/products_controller.dart';
import '../../models/store/store_model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(const ProductsState()) {
    on<OnAddNewCategoryEvent>(_onAddNewCategory);
    on<OnUpdateCategoryEvent>(_onUpdateCategory);
    on<OnSelectCategoryEvent>(_onSelectCategory);
    on<OnUnSelectCategoryEvent>(_onUnSelectCategory);
    on<OnSelectMultipleImagesEvent>(_onSelectMultipleImages);
    on<OnUnSelectMultipleImagesEvent>(_onUnSelectMultipleImages);
    on<OnAddNewProductEvent>(_onAddNewProduct);
    on<OnUpdateProductEvent>(_onUpdateProduct);
    on<OnUpdateStatusProductEvent>(_onUpdateStatusProduct);
    on<OnDeleteProductEvent>(_onDeleteProduct);
    on<OnSearchProductEvent>(_onSearchProductEvent);
  }

  Future<void> _onUpdateCategory(
      OnUpdateCategoryEvent event, Emitter<ProductsState> emit) async {
    try {
      emit(LoadingProductsState());

      await Future.delayed(const Duration(seconds: 1));

      final data = await categoryController.updateCategory(event.categoryId,
          event.nameCategory, event.descriptionCategory, event.storeId);

      if (data.resp) {
        emit(SuccessProductsState());
      } else {
        emit(FailureProductsState(data.msg));
      }
    } catch (e) {
      emit(FailureProductsState(e.toString()));
    }
  }

  Future<void> _onAddNewCategory(
      OnAddNewCategoryEvent event, Emitter<ProductsState> emit) async {
    try {
      emit(LoadingProductsState());

      await Future.delayed(const Duration(seconds: 1));

      final data = await categoryController.addNewCategory(
          event.nameCategory, event.descriptionCategory, event.storeId);

      if (data.resp) {
        emit(SuccessProductsState());
      } else {
        emit(FailureProductsState(data.msg));
      }
    } catch (e) {
      emit(FailureProductsState(e.toString()));
    }
  }

  Future<void> _onSelectCategory(
      OnSelectCategoryEvent event, Emitter<ProductsState> emit) async {
    emit(
        state.copyWith(idCategory: event.idCategory, category: event.category));
  }

  Future<void> _onUnSelectCategory(
      OnUnSelectCategoryEvent event, Emitter<ProductsState> emit) async {
    emit(state.copyWith(idCategory: 0, category: ''));
  }

  Future<void> _onSelectMultipleImages(
      OnSelectMultipleImagesEvent event, Emitter<ProductsState> emit) async {
    emit(state.copyWith(images: event.images));
  }

  Future<void> _onUnSelectMultipleImages(
      OnUnSelectMultipleImagesEvent event, Emitter<ProductsState> emit) async {
    emit(state.copyWith(images: []));
  }

  Future<void> _onAddNewProduct(
      OnAddNewProductEvent event, Emitter<ProductsState> emit) async {
    try {
      emit(LoadingProductsState());

      final data = await productController.addNewProduct(
          event.store.id!,
          event.name,
          event.description,
          event.price,
          event.images,
          event.category);

      Future.delayed(const Duration(seconds: 2));

      if (data.resp) {
        emit(SuccessProductsState());
      } else {
        emit(FailureProductsState(data.msg));
      }
    } catch (e) {
      emit(FailureProductsState(e.toString()));
    }
  }

  Future<void> _onUpdateProduct(
      OnUpdateProductEvent event, Emitter<ProductsState> emit) async {
    try {
      emit(LoadingProductsState());

      final data = await productController.updateProduct(
          event.store.id!,
          event.productId,
          event.name,
          event.description,
          event.price,
          event.images,
          event.category);

      Future.delayed(const Duration(seconds: 1));

      if (data.resp) {
        emit(SuccessProductsState());
      } else {
        emit(FailureProductsState(data.msg));
      }
    } catch (e) {
      emit(FailureProductsState(e.toString()));
    }
  }

  Future<void> _onUpdateStatusProduct(
      OnUpdateStatusProductEvent event, Emitter<ProductsState> emit) async {
    try {
      emit(LoadingProductsState());

      final resp = await productController.updateStatusProduct(
          event.storeId, event.idProduct, event.status);

      await Future.delayed(const Duration(milliseconds: 1000));

      if (resp.resp) {
        emit(SuccessProductsState());
      } else {
        emit(FailureProductsState(resp.msg));
      }
    } catch (e) {
      emit(FailureProductsState(e.toString()));
    }
  }

  Future<void> _onDeleteProduct(
      OnDeleteProductEvent event, Emitter<ProductsState> emit) async {
    try {
      emit(LoadingProductsState());

      final resp =
          await productController.deleteProduct(event.storeId, event.idProduct);

      await Future.delayed(const Duration(seconds: 1));

      if (resp.resp) {
        emit(SuccessProductsState());
      } else {
        emit(FailureProductsState(resp.msg));
      }
    } catch (e) {
      emit(FailureProductsState(e.toString()));
    }
  }

  Future<void> _onSearchProductEvent(
      OnSearchProductEvent event, Emitter<ProductsState> emit) async {
    emit(state.copyWith(searchProduct: event.searchProduct));
  }
}
