import '../../base_model.dart';
import 'order.dart';

class OrderFetchResponse implements IModel {
  List<Order>? orders;

  OrderFetchResponse({this.orders});

  factory OrderFetchResponse.fromJson(Map<String, dynamic>? json) {
    final List<Order>? data = [];
    json?.forEach((key, value) {
      data?.add(Order.fromJson(value));
    });
    return OrderFetchResponse(orders: data);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'orders': orders?.map((x) => x.toJson()),
    };
  }
}
