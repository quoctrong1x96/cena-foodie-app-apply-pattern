// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'receiver.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Receiver _$ReceiverFromJson(Map<String, dynamic> json) {
  return _Receiver.fromJson(json);
}

/// @nodoc
class _$ReceiverTearOff {
  const _$ReceiverTearOff();

  _Receiver call({String? name, String? phoneNumber, dynamic isFemale = true}) {
    return _Receiver(
      name: name,
      phoneNumber: phoneNumber,
      isFemale: isFemale,
    );
  }

  Receiver fromJson(Map<String, Object> json) {
    return Receiver.fromJson(json);
  }
}

/// @nodoc
const $Receiver = _$ReceiverTearOff();

/// @nodoc
mixin _$Receiver {
  String? get name => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  dynamic get isFemale => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReceiverCopyWith<Receiver> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceiverCopyWith<$Res> {
  factory $ReceiverCopyWith(Receiver value, $Res Function(Receiver) then) =
      _$ReceiverCopyWithImpl<$Res>;
  $Res call({String? name, String? phoneNumber, dynamic isFemale});
}

/// @nodoc
class _$ReceiverCopyWithImpl<$Res> implements $ReceiverCopyWith<$Res> {
  _$ReceiverCopyWithImpl(this._value, this._then);

  final Receiver _value;
  // ignore: unused_field
  final $Res Function(Receiver) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? phoneNumber = freezed,
    Object? isFemale = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isFemale: isFemale == freezed
          ? _value.isFemale
          : isFemale // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$ReceiverCopyWith<$Res> implements $ReceiverCopyWith<$Res> {
  factory _$ReceiverCopyWith(_Receiver value, $Res Function(_Receiver) then) =
      __$ReceiverCopyWithImpl<$Res>;
  @override
  $Res call({String? name, String? phoneNumber, dynamic isFemale});
}

/// @nodoc
class __$ReceiverCopyWithImpl<$Res> extends _$ReceiverCopyWithImpl<$Res>
    implements _$ReceiverCopyWith<$Res> {
  __$ReceiverCopyWithImpl(_Receiver _value, $Res Function(_Receiver) _then)
      : super(_value, (v) => _then(v as _Receiver));

  @override
  _Receiver get _value => super._value as _Receiver;

  @override
  $Res call({
    Object? name = freezed,
    Object? phoneNumber = freezed,
    Object? isFemale = freezed,
  }) {
    return _then(_Receiver(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isFemale: isFemale == freezed ? _value.isFemale : isFemale,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Receiver implements _Receiver {
  _$_Receiver({this.name, this.phoneNumber, this.isFemale = true});

  factory _$_Receiver.fromJson(Map<String, dynamic> json) =>
      _$_$_ReceiverFromJson(json);

  @override
  final String? name;
  @override
  final String? phoneNumber;
  @JsonKey(defaultValue: true)
  @override
  final dynamic isFemale;

  @override
  String toString() {
    return 'Receiver(name: $name, phoneNumber: $phoneNumber, isFemale: $isFemale)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Receiver &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.isFemale, isFemale) ||
                const DeepCollectionEquality()
                    .equals(other.isFemale, isFemale)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(isFemale);

  @JsonKey(ignore: true)
  @override
  _$ReceiverCopyWith<_Receiver> get copyWith =>
      __$ReceiverCopyWithImpl<_Receiver>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ReceiverToJson(this);
  }
}

abstract class _Receiver implements Receiver {
  factory _Receiver({String? name, String? phoneNumber, dynamic isFemale}) =
      _$_Receiver;

  factory _Receiver.fromJson(Map<String, dynamic> json) = _$_Receiver.fromJson;

  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get phoneNumber => throw _privateConstructorUsedError;
  @override
  dynamic get isFemale => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ReceiverCopyWith<_Receiver> get copyWith =>
      throw _privateConstructorUsedError;
}
