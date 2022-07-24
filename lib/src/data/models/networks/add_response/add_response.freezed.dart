// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'add_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddResponse _$AddResponseFromJson(Map<String, dynamic> json) {
  return _AddResponse.fromJson(json);
}

/// @nodoc
class _$AddResponseTearOff {
  const _$AddResponseTearOff();

  _AddResponse call({required String? id}) {
    return _AddResponse(
      id: id,
    );
  }

  AddResponse fromJson(Map<String, Object> json) {
    return AddResponse.fromJson(json);
  }
}

/// @nodoc
const $AddResponse = _$AddResponseTearOff();

/// @nodoc
mixin _$AddResponse {
  String? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddResponseCopyWith<AddResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddResponseCopyWith<$Res> {
  factory $AddResponseCopyWith(
          AddResponse value, $Res Function(AddResponse) then) =
      _$AddResponseCopyWithImpl<$Res>;
  $Res call({String? id});
}

/// @nodoc
class _$AddResponseCopyWithImpl<$Res> implements $AddResponseCopyWith<$Res> {
  _$AddResponseCopyWithImpl(this._value, this._then);

  final AddResponse _value;
  // ignore: unused_field
  final $Res Function(AddResponse) _then;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$AddResponseCopyWith<$Res>
    implements $AddResponseCopyWith<$Res> {
  factory _$AddResponseCopyWith(
          _AddResponse value, $Res Function(_AddResponse) then) =
      __$AddResponseCopyWithImpl<$Res>;
  @override
  $Res call({String? id});
}

/// @nodoc
class __$AddResponseCopyWithImpl<$Res> extends _$AddResponseCopyWithImpl<$Res>
    implements _$AddResponseCopyWith<$Res> {
  __$AddResponseCopyWithImpl(
      _AddResponse _value, $Res Function(_AddResponse) _then)
      : super(_value, (v) => _then(v as _AddResponse));

  @override
  _AddResponse get _value => super._value as _AddResponse;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_AddResponse(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AddResponse implements _AddResponse {
  _$_AddResponse({required this.id});

  factory _$_AddResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_AddResponseFromJson(json);

  @override
  final String? id;

  @override
  String toString() {
    return 'AddResponse(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AddResponse &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(id);

  @JsonKey(ignore: true)
  @override
  _$AddResponseCopyWith<_AddResponse> get copyWith =>
      __$AddResponseCopyWithImpl<_AddResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AddResponseToJson(this);
  }
}

abstract class _AddResponse implements AddResponse {
  factory _AddResponse({required String? id}) = _$_AddResponse;

  factory _AddResponse.fromJson(Map<String, dynamic> json) =
      _$_AddResponse.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AddResponseCopyWith<_AddResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
