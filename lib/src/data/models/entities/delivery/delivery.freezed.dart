// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'delivery.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Delivery _$DeliveryFromJson(Map<String, dynamic> json) {
  return _Delivery.fromJson(json);
}

/// @nodoc
class _$DeliveryTearOff {
  const _$DeliveryTearOff();

  _Delivery call(
      {required int id,
      String? name,
      String? phone,
      String? image,
      String? notificationToken}) {
    return _Delivery(
      id: id,
      name: name,
      phone: phone,
      image: image,
      notificationToken: notificationToken,
    );
  }

  Delivery fromJson(Map<String, Object> json) {
    return Delivery.fromJson(json);
  }
}

/// @nodoc
const $Delivery = _$DeliveryTearOff();

/// @nodoc
mixin _$Delivery {
  int get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get notificationToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeliveryCopyWith<Delivery> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryCopyWith<$Res> {
  factory $DeliveryCopyWith(Delivery value, $Res Function(Delivery) then) =
      _$DeliveryCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String? name,
      String? phone,
      String? image,
      String? notificationToken});
}

/// @nodoc
class _$DeliveryCopyWithImpl<$Res> implements $DeliveryCopyWith<$Res> {
  _$DeliveryCopyWithImpl(this._value, this._then);

  final Delivery _value;
  // ignore: unused_field
  final $Res Function(Delivery) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? phone = freezed,
    Object? image = freezed,
    Object? notificationToken = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      notificationToken: notificationToken == freezed
          ? _value.notificationToken
          : notificationToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$DeliveryCopyWith<$Res> implements $DeliveryCopyWith<$Res> {
  factory _$DeliveryCopyWith(_Delivery value, $Res Function(_Delivery) then) =
      __$DeliveryCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String? name,
      String? phone,
      String? image,
      String? notificationToken});
}

/// @nodoc
class __$DeliveryCopyWithImpl<$Res> extends _$DeliveryCopyWithImpl<$Res>
    implements _$DeliveryCopyWith<$Res> {
  __$DeliveryCopyWithImpl(_Delivery _value, $Res Function(_Delivery) _then)
      : super(_value, (v) => _then(v as _Delivery));

  @override
  _Delivery get _value => super._value as _Delivery;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? phone = freezed,
    Object? image = freezed,
    Object? notificationToken = freezed,
  }) {
    return _then(_Delivery(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      notificationToken: notificationToken == freezed
          ? _value.notificationToken
          : notificationToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Delivery implements _Delivery {
  _$_Delivery(
      {required this.id,
      this.name,
      this.phone,
      this.image,
      this.notificationToken});

  factory _$_Delivery.fromJson(Map<String, dynamic> json) =>
      _$_$_DeliveryFromJson(json);

  @override
  final int id;
  @override
  final String? name;
  @override
  final String? phone;
  @override
  final String? image;
  @override
  final String? notificationToken;

  @override
  String toString() {
    return 'Delivery(id: $id, name: $name, phone: $phone, image: $image, notificationToken: $notificationToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Delivery &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.notificationToken, notificationToken) ||
                const DeepCollectionEquality()
                    .equals(other.notificationToken, notificationToken)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(notificationToken);

  @JsonKey(ignore: true)
  @override
  _$DeliveryCopyWith<_Delivery> get copyWith =>
      __$DeliveryCopyWithImpl<_Delivery>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DeliveryToJson(this);
  }
}

abstract class _Delivery implements Delivery {
  factory _Delivery(
      {required int id,
      String? name,
      String? phone,
      String? image,
      String? notificationToken}) = _$_Delivery;

  factory _Delivery.fromJson(Map<String, dynamic> json) = _$_Delivery.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get phone => throw _privateConstructorUsedError;
  @override
  String? get image => throw _privateConstructorUsedError;
  @override
  String? get notificationToken => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DeliveryCopyWith<_Delivery> get copyWith =>
      throw _privateConstructorUsedError;
}
