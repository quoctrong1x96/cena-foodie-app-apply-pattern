import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'add_response.freezed.dart';
part 'add_response.g.dart';

@freezed
class AddResponse with _$AddResponse implements IModel {
  factory AddResponse({
    required String? id,
  }) = _AddResponse;

  factory AddResponse.fromJson(Map<String, dynamic> json) =>
      _$AddResponseFromJson(json);
}
