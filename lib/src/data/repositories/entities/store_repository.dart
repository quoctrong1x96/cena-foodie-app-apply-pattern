import 'package:cenafoodie/src/data/models/ui/ui_response.dart';
import 'package:cenafoodie/src/data/models/entities/store/store.dart';
import 'package:cenafoodie/src/data/repositories/base_repository.dart';
import 'package:cenafoodie/src/data/services/entities/store_service.dart';

class StoreRepository extends BaseRepository implements IStoreService {
  @override
  Future<UiResponse<Store>> byId({required int storeId}) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response = await cenaService.getStoreById(storeId: storeId);
    return UiResponse.map(response);
  }

  @override
  Future<UiResponse<String>> changeImages(
      {required int storeId, required String imageUrls}) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response =
        await cenaService.changeStoreImage(storeId: storeId, images: imageUrls);
    return UiResponse.map(response);
  }

  @override
  Future<UiResponse<String>> changeName(
      {required int storeId, required String name}) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response =
        await cenaService.changeStoreName(storeId: storeId, name: name);
    return UiResponse.map(response);
  }

  @override
  Future<UiResponse<String>> changeTime(
      {required int storeId,
      required DateTime openTime,
      required DateTime closeTime}) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response = await cenaService.changeStoreTime(
        storeId: storeId, openTime: openTime, closeTime: closeTime);
    return UiResponse.map(response);
  }

  @override
  Future<UiResponse<String>> getAdminToken({required int storeId}) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response = await cenaService.getStoreAdminToken(storeId: storeId);
    return UiResponse.map(response);
  }

  @override
  Future<UiResponse<String>> getNameById({required int storeId}) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response = await cenaService.getStoreName(storeId: storeId);
    return UiResponse.map(response);
  }

  @override
  Future<UiResponse<List<Store>>> getNearby(
      {required int offset,
      required int limit,
      required String lat,
      required String lng}) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response = await cenaService.fetchAllStore(
        offset: offset, limit: limit, lat: lat, lng: lng);
    return UiResponse.map(response);
  }

  @override
  Future<UiResponse<String>> getVoucher({required int storeId}) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response = await cenaService.getStoreVoucher(storeId: storeId);
    return UiResponse.map(response);
  }
}
