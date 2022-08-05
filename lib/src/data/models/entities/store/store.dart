import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'store.g.dart';
part 'store.freezed.dart';

@freezed
class Store with _$Store implements IModel {
  factory Store({
    required int id,
    required String storeName,
    String? address,
    required String latitude,
    required String longitude,
    required String openTime,
    required String closeTime,
    String? distance,
    String? categories,
    String? image,
    int? userId,
  }) = _Store;

  @override
  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);
}
