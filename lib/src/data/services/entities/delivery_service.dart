import 'package:cenafoodie/src/data/models/ui/ui_response.dart';

import '../../models/entities/delivery/delivery.dart';

abstract class IDeliveryService {
  ///Get user by id
  Future<UiResponse<Delivery>> convertToClient({required int deliveryId});

  /// Get all delivery of store
  Future<UiResponse<List<Delivery>?>> fetchAllOfStore({required int storeId});
}
