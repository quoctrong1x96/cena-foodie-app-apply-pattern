// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'user_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserRequest _$UserRequestFromJson(Map<String, dynamic> json) {
  return _UserRequest.fromJson(json);
}

/// @nodoc
class _$UserRequestTearOff {
  const _$UserRequestTearOff();

  _UserRequest call(
      {@JsonKey(includeIfNull: true)
          String? email,
      @JsonKey(includeIfNull: true)
          String? password,
      @JsonKey(includeIfNull: true)
          String? numberPhone,
      @JsonKey(defaultValue: true, includeIfNull: true)
          bool? returnSecureToken}) {
    return _UserRequest(
      email: email,
      password: password,
      numberPhone: numberPhone,
      returnSecureToken: returnSecureToken,
    );
  }

  UserRequest fromJson(Map<String, Object> json) {
    return UserRequest.fromJson(json);
  }
}

/// @nodoc
const $UserRequest = _$UserRequestTearOff();

/// @nodoc
mixin _$UserRequest {
  @JsonKey(includeIfNull: true)
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get password => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: true)
  String? get numberPhone => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: true, includeIfNull: true)
  bool? get returnSecureToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserRequestCopyWith<UserRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRequestCopyWith<$Res> {
  factory $UserRequestCopyWith(
          UserRequest value, $Res Function(UserRequest) then) =
      _$UserRequestCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(includeIfNull: true)
          String? email,
      @JsonKey(includeIfNull: true)
          String? password,
      @JsonKey(includeIfNull: true)
          String? numberPhone,
      @JsonKey(defaultValue: true, includeIfNull: true)
          bool? returnSecureToken});
}

/// @nodoc
class _$UserRequestCopyWithImpl<$Res> implements $UserRequestCopyWith<$Res> {
  _$UserRequestCopyWithImpl(this._value, this._then);

  final UserRequest _value;
  // ignore: unused_field
  final $Res Function(UserRequest) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? numberPhone = freezed,
    Object? returnSecureToken = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      numberPhone: numberPhone == freezed
          ? _value.numberPhone
          : numberPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      returnSecureToken: returnSecureToken == freezed
          ? _value.returnSecureToken
          : returnSecureToken // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$UserRequestCopyWith<$Res>
    implements $UserRequestCopyWith<$Res> {
  factory _$UserRequestCopyWith(
          _UserRequest value, $Res Function(_UserRequest) then) =
      __$UserRequestCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(includeIfNull: true)
          String? email,
      @JsonKey(includeIfNull: true)
          String? password,
      @JsonKey(includeIfNull: true)
          String? numberPhone,
      @JsonKey(defaultValue: true, includeIfNull: true)
          bool? returnSecureToken});
}

/// @nodoc
class __$UserRequestCopyWithImpl<$Res> extends _$UserRequestCopyWithImpl<$Res>
    implements _$UserRequestCopyWith<$Res> {
  __$UserRequestCopyWithImpl(
      _UserRequest _value, $Res Function(_UserRequest) _then)
      : super(_value, (v) => _then(v as _UserRequest));

  @override
  _UserRequest get _value => super._value as _UserRequest;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? numberPhone = freezed,
    Object? returnSecureToken = freezed,
  }) {
    return _then(_UserRequest(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      numberPhone: numberPhone == freezed
          ? _value.numberPhone
          : numberPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      returnSecureToken: returnSecureToken == freezed
          ? _value.returnSecureToken
          : returnSecureToken // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserRequest implements _UserRequest {
  _$_UserRequest(
      {@JsonKey(includeIfNull: true)
          this.email,
      @JsonKey(includeIfNull: true)
          this.password,
      @JsonKey(includeIfNull: true)
          this.numberPhone,
      @JsonKey(defaultValue: true, includeIfNull: true)
          this.returnSecureToken});

  factory _$_UserRequest.fromJson(Map<String, dynamic> json) =>
      _$_$_UserRequestFromJson(json);

  @override
  @JsonKey(includeIfNull: true)
  final String? email;
  @override
  @JsonKey(includeIfNull: true)
  final String? password;
  @override
  @JsonKey(includeIfNull: true)
  final String? numberPhone;
  @override
  @JsonKey(defaultValue: true, includeIfNull: true)
  final bool? returnSecureToken;

  @override
  String toString() {
    return 'UserRequest(email: $email, password: $password, numberPhone: $numberPhone, returnSecureToken: $returnSecureToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserRequest &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.numberPhone, numberPhone) ||
                const DeepCollectionEquality()
                    .equals(other.numberPhone, numberPhone)) &&
            (identical(other.returnSecureToken, returnSecureToken) ||
                const DeepCollectionEquality()
                    .equals(other.returnSecureToken, returnSecureToken)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(numberPhone) ^
      const DeepCollectionEquality().hash(returnSecureToken);

  @JsonKey(ignore: true)
  @override
  _$UserRequestCopyWith<_UserRequest> get copyWith =>
      __$UserRequestCopyWithImpl<_UserRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserRequestToJson(this);
  }
}

abstract class _UserRequest implements UserRequest {
  factory _UserRequest(
      {@JsonKey(includeIfNull: true)
          String? email,
      @JsonKey(includeIfNull: true)
          String? password,
      @JsonKey(includeIfNull: true)
          String? numberPhone,
      @JsonKey(defaultValue: true, includeIfNull: true)
          bool? returnSecureToken}) = _$_UserRequest;

  factory _UserRequest.fromJson(Map<String, dynamic> json) =
      _$_UserRequest.fromJson;

  @override
  @JsonKey(includeIfNull: true)
  String? get email => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  String? get password => throw _privateConstructorUsedError;
  @override
  @JsonKey(includeIfNull: true)
  String? get numberPhone => throw _privateConstructorUsedError;
  @override
  @JsonKey(defaultValue: true, includeIfNull: true)
  bool? get returnSecureToken => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserRequestCopyWith<_UserRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
