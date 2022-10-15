import '../../base_model.dart';
import 'delivery.dart';

class DeliveryFetchResponse implements IModel {
  List<Delivery>? deliveries;

  DeliveryFetchResponse({this.deliveries});

  factory DeliveryFetchResponse.fromJson(
    Map<String, dynamic> deliveriesJson,
  ) {
    try {
      return DeliveryFetchResponse(
        deliveries: List<Delivery>.from(
            deliveriesJson["deliveries"].map((x) => Delivery.fromJson(x))),
      );
    } catch (e) {
      return DeliveryFetchResponse(deliveries: []);
    }
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'deliveries': deliveries?.map((x) => x.toJson()),
    };
  }
}
