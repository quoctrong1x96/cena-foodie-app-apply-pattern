// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'delivery.freezed.dart';
part 'delivery.g.dart';

@freezed
class Delivery with _$Delivery implements IModel {
  factory Delivery({
    @JsonKey(name: 'person_id') required int id,
    @JsonKey(name: 'nameDelivery') String? name,
    String? phone,
    String? image,
    @JsonKey(name: 'notification_token') String? notificationToken,
  }) = _Delivery;

  factory Delivery.fromJson(Map<String, dynamic> json) =>
      _$DeliveryFromJson(json);
}
