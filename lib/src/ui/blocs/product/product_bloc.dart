import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../../data/app_locator.dart';
import '../../../data/models/entities/category/category.dart';
import '../../../data/models/entities/store/store.dart';
import '../../../data/services/entities/category_service.dart';
import '../../../data/services/entities/product_service.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final _categoryService = locator<ICategoryService>();
  final _productService = locator<IProductService>();

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

      final uiResponse = await _categoryService.update(
          category: Category(
              id: event.categoryId,
              category: event.nameCategory,
              description: event.descriptionCategory,
              storeId: event.storeId));

      if (!uiResponse.hasError) {
        emit(SuccessProductsState());
      } else {
        emit(FailureProductsState(uiResponse.errorMessage!));
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

      final uiResponse = await _categoryService.add(
          category: Category(
              id: 0,
              category: event.nameCategory,
              description: event.descriptionCategory,
              storeId: event.storeId));

      if (!uiResponse.hasError) {
        emit(SuccessProductsState());
      } else {
        emit(FailureProductsState(uiResponse.errorMessage!));
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

      final uiResponse = await _productService.add(
          storeId: event.store.id,
          name: event.name,
          description: event.description,
          price: event.price,
          images: event.images.map((e) => e.path).toList(),
          category: event.category);

      Future.delayed(const Duration(seconds: 2));

      if (!uiResponse.hasError) {
        emit(SuccessProductsState());
      } else {
        emit(FailureProductsState(uiResponse.errorMessage!));
      }
    } catch (e) {
      emit(FailureProductsState(e.toString()));
    }
  }

  Future<void> _onUpdateProduct(
      OnUpdateProductEvent event, Emitter<ProductsState> emit) async {
    try {
      emit(LoadingProductsState());

      List<String> images = [];

      final uiResponse = await _productService.update(
          storeId: event.store.id,
          productId: event.productId,
          name: event.name,
          description: event.description,
          price: event.price,
          images: event.images!.map((e) => e.path).toList(),
          category: event.category);

      Future.delayed(const Duration(seconds: 1));

      if (!uiResponse.hasError) {
        emit(SuccessProductsState());
      } else {
        emit(FailureProductsState(uiResponse.errorMessage!));
      }
    } catch (e) {
      emit(FailureProductsState(e.toString()));
    }
  }

  Future<void> _onUpdateStatusProduct(
      OnUpdateStatusProductEvent event, Emitter<ProductsState> emit) async {
    try {
      emit(LoadingProductsState());

      final uiResponse = await _productService.updateStatus(
          storeId: event.storeId,
          productId: event.idProduct,
          status: event.status);

      await Future.delayed(const Duration(milliseconds: 1000));

      if (!uiResponse.hasError) {
        emit(SuccessProductsState());
      } else {
        emit(FailureProductsState(uiResponse.errorMessage!));
      }
    } catch (e) {
      emit(FailureProductsState(e.toString()));
    }
  }

  Future<void> _onDeleteProduct(
      OnDeleteProductEvent event, Emitter<ProductsState> emit) async {
    try {
      emit(LoadingProductsState());

      final uiResponse = await _productService.delete(
          storeId: event.storeId, productId: event.idProduct);

      await Future.delayed(const Duration(seconds: 1));

      if (!uiResponse.hasError) {
        emit(SuccessProductsState());
      } else {
        emit(FailureProductsState(uiResponse.errorMessage!));
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
