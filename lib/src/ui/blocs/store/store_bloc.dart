import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/app_locator.dart';
import '../../../data/models/entities/category/category.dart';
import '../../../data/models/entities/store/store.dart';
import '../../../data/services/entities/category_service.dart';
import '../../../data/services/entities/store_service.dart';

part 'store_event.dart';
part 'store_state.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  final _categoryService = locator<ICategoryService>();
  final _storeService = locator<IStoreService>();

  StoreBloc() : super(const StoreState()) {
    on<OnGetStoreEvent>(_onGetStore);
    on<OnSelectPictureStoreEvent>(_onSelectPicture);
    on<OnClearPicturePathStoreEvent>(_onClearPicturePath);
    on<OnChangeCategoriesStoreEvent>(_onChangeCategoriesStore);
    on<OnChangeImageStoreEvent>(_onChangeImageStore);
    on<OnChangeTimeStoreEvent>(_onChangeTimeStore);
    on<OnChangeNameOfStoreEvent>(_onChangeNameOfStore);
  }

  Future<void> _onGetStore(
      OnGetStoreEvent event, Emitter<StoreState> emit) async {
    emit(state.copyWith(store: event.store));
  }

  Future<void> _onSelectPicture(
      OnSelectPictureStoreEvent event, Emitter<StoreState> emit) async {
    emit(state.copyWith(pictureProfilePath: event.pictureStorePath));
  }

  Future<void> _onClearPicturePath(
      OnClearPicturePathStoreEvent event, Emitter<StoreState> emit) async {
    emit(state.copyWith(pictureProfilePath: ''));
  }

  Future<void> _onChangeCategoriesStore(
      OnChangeCategoriesStoreEvent event, Emitter<StoreState> emit) async {
    try {
      emit(LoadingStoreState());

      final uiResponse = await _categoryService.update(
          category: Category(
              id: event.categoryId,
              category: event.categories,
              description: event.description,
              storeId: event.storeId));

      if (!uiResponse.hasError) {
        final store = await _storeService.byId(storeId: event.storeId);

        emit(SuccessStoreState());

        emit(state.copyWith(store: store!.data));
      } else {
        emit(FailureStoreState(uiResponse.errorMessage!));
      }
    } catch (e) {
      emit(FailureStoreState(e.toString()));
    }
  }

  Future<void> _onChangeImageStore(
      OnChangeImageStoreEvent event, Emitter<StoreState> emit) async {
    try {
      emit(LoadingStoreState());

      final uiResponse = await _storeService.changeImages(
          storeId: event.storeId, imageUrls: event.image);

      if (!uiResponse.hasError) {
        final store = await _storeService.byId(storeId: event.storeId);

        emit(SuccessStoreState());

        emit(state.copyWith(store: store.data));
      } else {
        emit(FailureStoreState(uiResponse.errorMessage!));
      }
    } catch (e) {
      emit(FailureStoreState(e.toString()));
    }
  }

  Future<void> _onChangeTimeStore(
      OnChangeTimeStoreEvent event, Emitter<StoreState> emit) async {
    try {
      emit(LoadingStoreState());

      final uiResponse = await _storeService.changeTime(
          storeId: event.storeId,
          openTime: event.openTime,
          closeTime: event.closeTime);

      if (!uiResponse.hasError) {
        final store = await _storeService.byId(storeId: event.storeId);

        emit(SuccessStoreState());

        emit(state.copyWith(store: store.data));
      } else {
        emit(FailureStoreState(uiResponse.errorMessage!));
      }
    } catch (e) {
      emit(FailureStoreState(e.toString()));
    }
  }

  Future<void> _onChangeNameOfStore(
      OnChangeNameOfStoreEvent event, Emitter<StoreState> emit) async {
    try {
      emit(LoadingStoreState());

      final uiResponse = await _storeService.changeName(
          storeId: event.storeId, name: event.storeName);

      if (!uiResponse.hasError) {
        final store = await _storeService.byId(storeId: event.storeId);

        emit(SuccessStoreState());

        emit(state.copyWith(store: store.data));
      } else {
        emit(FailureStoreState(uiResponse.errorMessage!));
      }
    } catch (e) {
      emit(FailureStoreState(e.toString()));
    }
  }
}
