// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User implements IModel {
  factory User({
    required String firstName,
    required String lastName,
    required String image,
    required String email,
    @Default(2) int rolId,
    String? address,
    String? reference,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
