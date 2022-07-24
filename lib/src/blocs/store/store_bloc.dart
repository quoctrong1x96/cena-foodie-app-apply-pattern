import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../controllers/store_controller.dart';
import '../../models/store/store_model.dart';

part 'store_event.dart';
part 'store_state.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
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

      final data = await storeController.changeCategoriesStore(
          event.storeId, event.categoryId, event.categories, event.description);

      if (data.resp) {
        final store = await storeController.getStoreById(event.storeId);

        emit(SuccessStoreState());

        emit(state.copyWith(store: store!));
      } else {
        emit(FailureStoreState(data.msg));
      }
    } catch (e) {
      emit(FailureStoreState(e.toString()));
    }
  }

  Future<void> _onChangeImageStore(
      OnChangeImageStoreEvent event, Emitter<StoreState> emit) async {
    try {
      emit(LoadingStoreState());

      final data =
          await storeController.changeImageStore(event.storeId, event.image);

      if (data.resp) {
        final store = await storeController.getStoreById(event.storeId);

        emit(SuccessStoreState());

        emit(state.copyWith(store: store!));
      } else {
        emit(FailureStoreState(data.msg));
      }
    } catch (e) {
      emit(FailureStoreState(e.toString()));
    }
  }

  Future<void> _onChangeTimeStore(
      OnChangeTimeStoreEvent event, Emitter<StoreState> emit) async {
    try {
      emit(LoadingStoreState());

      final data = await storeController.changeOpenAndCloseTimeStore(
          event.storeId, event.openTime, event.closeTime);

      if (data.resp) {
        final store = await storeController.getStoreById(event.storeId);

        emit(SuccessStoreState());

        emit(state.copyWith(store: store!));
      } else {
        emit(FailureStoreState(data.msg));
      }
    } catch (e) {
      emit(FailureStoreState(e.toString()));
    }
  }

  Future<void> _onChangeNameOfStore(
      OnChangeNameOfStoreEvent event, Emitter<StoreState> emit) async {
    try {
      emit(LoadingStoreState());

      final data = await storeController.changeNameOfStore(
          event.storeId, event.storeName);

      if (data.resp) {
        final store = await storeController.getStoreById(event.storeId);

        emit(SuccessStoreState());

        emit(state.copyWith(store: store!));
      } else {
        emit(FailureStoreState(data.msg));
      }
    } catch (e) {
      emit(FailureStoreState(e.toString()));
    }
  }
}
