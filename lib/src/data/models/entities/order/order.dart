// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class Order with _$Order implements IModel {
  factory Order({
    @JsonKey(name: "order_id") required int id,
    @JsonKey(name: "delivery_id") int? deliveryId,
    @JsonKey(name: "delivery") String? deliveryName,
    @JsonKey(name: "deliveryImage") String? deliveryImage,
    @JsonKey(name: "client_id") int? clientId,
    @JsonKey(name: "client") String? client,
    @JsonKey(name: "clientImage") String? clientImage,
    @JsonKey(name: "clientPhone") String? clientPhone,
    @JsonKey(name: "address_id") int? addressId,
    String? address,
    @JsonKey(name: "receiver") String? receiver,
    @JsonKey(name: "Latitude") String? latitude,
    @JsonKey(name: "Longitude") String? longitude,
    String? status,
    @JsonKey(name: "pay_type") String? payType,
    double? amount,
    @JsonKey(name: "currentDate") DateTime? currentDate,
    @JsonKey(name: "store_id") int? storeId,
    @JsonKey(name: "store_latitude") String? storeLatitude,
    @JsonKey(name: "store_longitude") String? storeLongitude,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}
