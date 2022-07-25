// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';
import 'receiver.dart';

part 'address.freezed.dart';
part 'address.g.dart';

@freezed
class Address with _$Address implements IModel {
  factory Address({
    required int id,
    @JsonKey(name: 'address') String? detail,
    Receiver? receiver,
    int? type,
    String? latitude,
    String? longitude,
    String? note,
    String? door,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
