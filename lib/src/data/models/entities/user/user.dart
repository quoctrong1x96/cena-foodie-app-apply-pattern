// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User implements IModel {
  factory User({
    required int id,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    required String image,
    required String email,
    required String phone,
    @JsonKey(name: 'notification_token') required String notificationToken,
    @JsonKey(name: 'rol_id') @Default(2) int rolId,
    String? address,
    @JsonKey(name: 'reference_code') String? reference,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
