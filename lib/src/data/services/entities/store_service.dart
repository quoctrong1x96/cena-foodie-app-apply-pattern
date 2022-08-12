import 'package:cenafoodie/src/data/models/ui/ui_response.dart';

import '../../models/entities/store/store.dart';

abstract class IStoreService {
  ///Get store Admin token
  Future<UiResponse<String>> getAdminToken({required int storeId});

  ///Get store by id
  Future<UiResponse<Store>> byId({required int storeId});

  ///Get store's name by id
  Future<UiResponse<String>> getNameById({required int storeId});

  ///Get store's name by id
  Future<UiResponse<List<Store>>> getNearby(
      {required int offset,
      required int limit,
      required String lat,
      required String lng});

  ///Change images of store
  Future<UiResponse<String>> changeImages(
      {required int storeId, required String imageUrls});

  ///Change name of store
  Future<UiResponse<String>> changeName(
      {required int storeId, required String name});

  ///Change time of store
  Future<UiResponse<String>> changeTime(
      {required int storeId,
      required DateTime openTime,
      required DateTime closeTime});

  ///Get voucher of store
  Future<UiResponse<String>> getVoucher({required int storeId});
}
