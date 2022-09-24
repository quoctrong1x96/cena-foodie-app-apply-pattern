// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'receiver.freezed.dart';
part 'receiver.g.dart';

@freezed
class Receiver with _$Receiver implements IModel {
  factory Receiver({
    String? name,
    @JsonKey(name: 'phone') String? phoneNumber,
    @Default(true) isFemale,
  }) = _Receiver;

  factory Receiver.fromJson(Map<String, dynamic> json) =>
      _$ReceiverFromJson(json);
}
