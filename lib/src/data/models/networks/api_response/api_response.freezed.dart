// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApiResponse<T> _$ApiResponseFromJson<T>(Map<String, dynamic> json) {
  return _ApiResponse<T>.fromJson(json);
}

/// @nodoc
class _$ApiResponseTearOff {
  const _$ApiResponseTearOff();

  _ApiResponse<T> call<T>(
      {@JsonKey(fromJson: _dataFromJson, toJson: _dataToJson) bool? success,
      @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson) int? code,
      @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson) String? message,
      @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson) T? data}) {
    return _ApiResponse<T>(
      success: success,
      code: code,
      message: message,
      data: data,
    );
  }

  ApiResponse<T> fromJson<T>(Map<String, Object> json) {
    return ApiResponse<T>.fromJson(json);
  }
}

/// @nodoc
const $ApiResponse = _$ApiResponseTearOff();

/// @nodoc
mixin _$ApiResponse<T> {
  @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson)
  bool? get success => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson)
  int? get code => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson)
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson)
  T? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiResponseCopyWith<T, ApiResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResponseCopyWith<T, $Res> {
  factory $ApiResponseCopyWith(
          ApiResponse<T> value, $Res Function(ApiResponse<T>) then) =
      _$ApiResponseCopyWithImpl<T, $Res>;
  $Res call(
      {@JsonKey(fromJson: _dataFromJson, toJson: _dataToJson) bool? success,
      @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson) int? code,
      @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson) String? message,
      @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson) T? data});
}

/// @nodoc
class _$ApiResponseCopyWithImpl<T, $Res>
    implements $ApiResponseCopyWith<T, $Res> {
  _$ApiResponseCopyWithImpl(this._value, this._then);

  final ApiResponse<T> _value;
  // ignore: unused_field
  final $Res Function(ApiResponse<T>) _then;

  @override
  $Res call({
    Object? success = freezed,
    Object? code = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc
abstract class _$ApiResponseCopyWith<T, $Res>
    implements $ApiResponseCopyWith<T, $Res> {
  factory _$ApiResponseCopyWith(
          _ApiResponse<T> value, $Res Function(_ApiResponse<T>) then) =
      __$ApiResponseCopyWithImpl<T, $Res>;
  @override
  $Res call(
      {@JsonKey(fromJson: _dataFromJson, toJson: _dataToJson) bool? success,
      @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson) int? code,
      @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson) String? message,
      @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson) T? data});
}

/// @nodoc
class __$ApiResponseCopyWithImpl<T, $Res>
    extends _$ApiResponseCopyWithImpl<T, $Res>
    implements _$ApiResponseCopyWith<T, $Res> {
  __$ApiResponseCopyWithImpl(
      _ApiResponse<T> _value, $Res Function(_ApiResponse<T>) _then)
      : super(_value, (v) => _then(v as _ApiResponse<T>));

  @override
  _ApiResponse<T> get _value => super._value as _ApiResponse<T>;

  @override
  $Res call({
    Object? success = freezed,
    Object? code = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_ApiResponse<T>(
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ApiResponse<T> implements _ApiResponse<T> {
  _$_ApiResponse(
      {@JsonKey(fromJson: _dataFromJson, toJson: _dataToJson) this.success,
      @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson) this.code,
      @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson) this.message,
      @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson) this.data});

  factory _$_ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_ApiResponseFromJson(json);

  @override
  @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson)
  final bool? success;
  @override
  @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson)
  final int? code;
  @override
  @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson)
  final String? message;
  @override
  @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson)
  final T? data;

  @override
  String toString() {
    return 'ApiResponse<$T>(success: $success, code: $code, message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ApiResponse<T> &&
            (identical(other.success, success) ||
                const DeepCollectionEquality()
                    .equals(other.success, success)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(success) ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  _$ApiResponseCopyWith<T, _ApiResponse<T>> get copyWith =>
      __$ApiResponseCopyWithImpl<T, _ApiResponse<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ApiResponseToJson(this);
  }
}

abstract class _ApiResponse<T> implements ApiResponse<T> {
  factory _ApiResponse(
      {@JsonKey(fromJson: _dataFromJson, toJson: _dataToJson)
          bool? success,
      @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson)
          int? code,
      @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson)
          String? message,
      @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson)
          T? data}) = _$_ApiResponse<T>;

  factory _ApiResponse.fromJson(Map<String, dynamic> json) =
      _$_ApiResponse<T>.fromJson;

  @override
  @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson)
  bool? get success => throw _privateConstructorUsedError;
  @override
  @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson)
  int? get code => throw _privateConstructorUsedError;
  @override
  @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson)
  String? get message => throw _privateConstructorUsedError;
  @override
  @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson)
  T? get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ApiResponseCopyWith<T, _ApiResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
