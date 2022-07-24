// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

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

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson<T>(json);
}

extension ApiResponseHasError<T> on ApiResponse<T> {
  bool get hasError => success == null || success == false;

  bool get hasData => data != null;
}

T? _dataFromJson<T, U>(Map<String, dynamic>? input, [U? other]) =>
    input!['value'] as T;

Map<String, dynamic>? _dataToJson<T, U>(T? input, [U? other]) =>
    {'value': input ?? ""};
