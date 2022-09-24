// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'store.g.dart';
part 'store.freezed.dart';

@freezed
class Store with _$Store implements IModel {
  factory Store({
    required int id,
    @JsonKey(name: 'name') required String storeName,
    String? address,
    required String latitude,
    required String longitude,
    @JsonKey(name: 'open_time') required String openTime,
    @JsonKey(name: 'close_time') required String closeTime,
    @JsonKey(name: 'distance_in_km') double? distance,
    String? categories,
    String? image,
    @JsonKey(name: 'user_id') int? userId,
  }) = _Store;

  @override
  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);
}
