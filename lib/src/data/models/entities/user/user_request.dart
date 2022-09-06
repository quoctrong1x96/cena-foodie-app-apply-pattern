// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'user_request.freezed.dart';
part 'user_request.g.dart';

@freezed
class UserRequest with _$UserRequest implements IModel {
  factory UserRequest({
    @JsonKey(includeIfNull: true) String? email,
    @JsonKey(includeIfNull: true) String? password,
    @JsonKey(includeIfNull: true, name: 'phone') String? numberPhone,
    @JsonKey(defaultValue: true, includeIfNull: true) bool? returnSecureToken,
  }) = _UserRequest;

  factory UserRequest.fromJson(Map<String, dynamic> json) =>
      _$UserRequestFromJson(json);
}
