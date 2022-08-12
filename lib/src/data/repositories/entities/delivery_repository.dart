import '../../models/entities/delivery/delivery.dart';
import '../../models/ui/ui_response.dart';
import '../../services/entities/delivery_service.dart';
import '../base_repository.dart';

class DeliveryRepository extends BaseRepository implements IDeliveryService {
  @override
  Future<UiResponse<Delivery>> convertToClient(
      {required int deliveryId}) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response =
        await cenaService.convertDeliveryToClient(deliveryId: deliveryId);
    return UiResponse.map(response);
  }

  @override
  Future<UiResponse<List<Delivery>>> fetchAllOfStore(
      {required int storeId}) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response =
        await cenaService.fetchAllDeliveryOfStore(storeId: storeId);
    return UiResponse.map(response);
  }
}
