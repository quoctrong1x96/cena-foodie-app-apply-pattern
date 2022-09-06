// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receiver.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Receiver _$_$_ReceiverFromJson(Map<String, dynamic> json) {
  return _$_Receiver(
    name: json['name'] as String?,
    phoneNumber: json['phone'] as String?,
    isFemale: json['isFemale'] ?? true,
  );
}

Map<String, dynamic> _$_$_ReceiverToJson(_$_Receiver instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phoneNumber,
      'isFemale': instance.isFemale,
    };
