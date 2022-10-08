import '../../base_model.dart';
import 'order.dart';

class OrderFetchResponse implements IModel {
  List<Order>? orders;

  OrderFetchResponse({this.orders});

  factory OrderFetchResponse.fromJson(Map<String, dynamic> json) =>
      OrderFetchResponse(
        orders: List<Order>.from(json['orders'].map((x) => Order.fromJson(x))),
      );

  @override
  Map<String, dynamic> toJson() {
    return {
      'orders': orders?.map((x) => x.toJson()),
    };
  }
}
