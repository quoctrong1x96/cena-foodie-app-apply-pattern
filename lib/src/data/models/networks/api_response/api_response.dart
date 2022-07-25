// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../utils/json_utils.dart';
import '../../base_model.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

@freezed
class ApiResponse<T> with _$ApiResponse<T> implements IModel {
  factory ApiResponse({
    @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson) bool? success,
    @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson) int? code,
    @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson) String? message,
    @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson) T? data,
  }) = _ApiResponse<T>;

  factory ApiResponse.fromRawJson(
    String rawJson,
    Function(dynamic data) create,
  ) {
    return ApiResponse.fromJson2(JsonUtils.fromJson(rawJson), create: create);
  }

  // Here function "create" is very important, this basically gives the control back from where this
  // ApiResponse.fromJson method is called so that data model against the "data" key can be easily created
  factory ApiResponse.fromJson2(
    Map<String, dynamic> json, {
    Function(dynamic data)? create,
  }) {
    return ApiResponse<T>(
      success: json['success'],
      code: json['code'],
      message: json['message'],
      data: create == null ? json['data'] : create(json['data']),
    );
  }
  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ApiResponseFromJson<T>(json);

//   factory ApiResponse.fromRawJson(
//     String rawJson,
//     Function(dynamic data) create,
//   ) =>
//       _$ApiResponseFromRawJson<T>(rawJson, create);
}

extension ApiResponseHasError<T> on ApiResponse<T> {
  bool get hasError => success == null || success == false;

  bool get hasData => data != null;
}

T? _dataFromJson<T, U>(Map<String, dynamic>? input, [U? other]) =>
    input!['value'] as T;

Map<String, dynamic>? _dataToJson<T, U>(T? input, [U? other]) =>
    {'value': input ?? ""};
