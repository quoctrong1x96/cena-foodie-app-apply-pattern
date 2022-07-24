// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class Category with _$Category implements IModel {
  factory Category({
    required int id,
    required String category,
    String? description,
    required int storeId,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
