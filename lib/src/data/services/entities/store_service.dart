import 'package:cenafoodie/src/data/models/ui/ui_response.dart';

abstract class IStoreService {
  ///Get user by id
  Future<UiResponse<String>> getAdminToken({required int storeId});
}
