// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'auth_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) {
  return _AuthResponse.fromJson(json);
}

/// @nodoc
class _$AuthResponseTearOff {
  const _$AuthResponseTearOff();

  _AuthResponse call({required String token, Store? store, User? user}) {
    return _AuthResponse(
      token: token,
      store: store,
      user: user,
    );
  }

  AuthResponse fromJson(Map<String, Object> json) {
    return AuthResponse.fromJson(json);
  }
}

/// @nodoc
const $AuthResponse = _$AuthResponseTearOff();

/// @nodoc
mixin _$AuthResponse {
  String get token => throw _privateConstructorUsedError;
  Store? get store => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthResponseCopyWith<AuthResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthResponseCopyWith<$Res> {
  factory $AuthResponseCopyWith(
          AuthResponse value, $Res Function(AuthResponse) then) =
      _$AuthResponseCopyWithImpl<$Res>;
  $Res call({String token, Store? store, User? user});

  $StoreCopyWith<$Res>? get store;
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$AuthResponseCopyWithImpl<$Res> implements $AuthResponseCopyWith<$Res> {
  _$AuthResponseCopyWithImpl(this._value, this._then);

  final AuthResponse _value;
  // ignore: unused_field
  final $Res Function(AuthResponse) _then;

  @override
  $Res call({
    Object? token = freezed,
    Object? store = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      store: store == freezed
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as Store?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }

  @override
  $StoreCopyWith<$Res>? get store {
    if (_value.store == null) {
      return null;
    }

    return $StoreCopyWith<$Res>(_value.store!, (value) {
      return _then(_value.copyWith(store: value));
    });
  }

  @override
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$AuthResponseCopyWith<$Res>
    implements $AuthResponseCopyWith<$Res> {
  factory _$AuthResponseCopyWith(
          _AuthResponse value, $Res Function(_AuthResponse) then) =
      __$AuthResponseCopyWithImpl<$Res>;
  @override
  $Res call({String token, Store? store, User? user});

  @override
  $StoreCopyWith<$Res>? get store;
  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$AuthResponseCopyWithImpl<$Res> extends _$AuthResponseCopyWithImpl<$Res>
    implements _$AuthResponseCopyWith<$Res> {
  __$AuthResponseCopyWithImpl(
      _AuthResponse _value, $Res Function(_AuthResponse) _then)
      : super(_value, (v) => _then(v as _AuthResponse));

  @override
  _AuthResponse get _value => super._value as _AuthResponse;

  @override
  $Res call({
    Object? token = freezed,
    Object? store = freezed,
    Object? user = freezed,
  }) {
    return _then(_AuthResponse(
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      store: store == freezed
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as Store?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthResponse implements _AuthResponse {
  _$_AuthResponse({required this.token, this.store, this.user});

  factory _$_AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_AuthResponseFromJson(json);

  @override
  final String token;
  @override
  final Store? store;
  @override
  final User? user;

  @override
  String toString() {
    return 'AuthResponse(token: $token, store: $store, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthResponse &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)) &&
            (identical(other.store, store) ||
                const DeepCollectionEquality().equals(other.store, store)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(token) ^
      const DeepCollectionEquality().hash(store) ^
      const DeepCollectionEquality().hash(user);

  @JsonKey(ignore: true)
  @override
  _$AuthResponseCopyWith<_AuthResponse> get copyWith =>
      __$AuthResponseCopyWithImpl<_AuthResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AuthResponseToJson(this);
  }
}

abstract class _AuthResponse implements AuthResponse {
  factory _AuthResponse({required String token, Store? store, User? user}) =
      _$_AuthResponse;

  factory _AuthResponse.fromJson(Map<String, dynamic> json) =
      _$_AuthResponse.fromJson;

  @override
  String get token => throw _privateConstructorUsedError;
  @override
  Store? get store => throw _privateConstructorUsedError;
  @override
  User? get user => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AuthResponseCopyWith<_AuthResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
