// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Store _$StoreFromJson(Map<String, dynamic> json) {
  return _Store.fromJson(json);
}

/// @nodoc
class _$StoreTearOff {
  const _$StoreTearOff();

  _Store call(
      {required int id,
      required String storeName,
      String? address,
      required String latitude,
      required String longitude,
      required String openTime,
      required String closeTime,
      String? distance,
      String? categories,
      String? image,
      int? userId}) {
    return _Store(
      id: id,
      storeName: storeName,
      address: address,
      latitude: latitude,
      longitude: longitude,
      openTime: openTime,
      closeTime: closeTime,
      distance: distance,
      categories: categories,
      image: image,
      userId: userId,
    );
  }

  Store fromJson(Map<String, Object> json) {
    return Store.fromJson(json);
  }
}

/// @nodoc
const $Store = _$StoreTearOff();

/// @nodoc
mixin _$Store {
  int get id => throw _privateConstructorUsedError;
  String get storeName => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String get latitude => throw _privateConstructorUsedError;
  String get longitude => throw _privateConstructorUsedError;
  String get openTime => throw _privateConstructorUsedError;
  String get closeTime => throw _privateConstructorUsedError;
  String? get distance => throw _privateConstructorUsedError;
  String? get categories => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  int? get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreCopyWith<Store> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreCopyWith<$Res> {
  factory $StoreCopyWith(Store value, $Res Function(Store) then) =
      _$StoreCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String storeName,
      String? address,
      String latitude,
      String longitude,
      String openTime,
      String closeTime,
      String? distance,
      String? categories,
      String? image,
      int? userId});
}

/// @nodoc
class _$StoreCopyWithImpl<$Res> implements $StoreCopyWith<$Res> {
  _$StoreCopyWithImpl(this._value, this._then);

  final Store _value;
  // ignore: unused_field
  final $Res Function(Store) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? storeName = freezed,
    Object? address = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? openTime = freezed,
    Object? closeTime = freezed,
    Object? distance = freezed,
    Object? categories = freezed,
    Object? image = freezed,
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      storeName: storeName == freezed
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
      openTime: openTime == freezed
          ? _value.openTime
          : openTime // ignore: cast_nullable_to_non_nullable
              as String,
      closeTime: closeTime == freezed
          ? _value.closeTime
          : closeTime // ignore: cast_nullable_to_non_nullable
              as String,
      distance: distance == freezed
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as String?,
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as String?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$StoreCopyWith<$Res> implements $StoreCopyWith<$Res> {
  factory _$StoreCopyWith(_Store value, $Res Function(_Store) then) =
      __$StoreCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String storeName,
      String? address,
      String latitude,
      String longitude,
      String openTime,
      String closeTime,
      String? distance,
      String? categories,
      String? image,
      int? userId});
}

/// @nodoc
class __$StoreCopyWithImpl<$Res> extends _$StoreCopyWithImpl<$Res>
    implements _$StoreCopyWith<$Res> {
  __$StoreCopyWithImpl(_Store _value, $Res Function(_Store) _then)
      : super(_value, (v) => _then(v as _Store));

  @override
  _Store get _value => super._value as _Store;

  @override
  $Res call({
    Object? id = freezed,
    Object? storeName = freezed,
    Object? address = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? openTime = freezed,
    Object? closeTime = freezed,
    Object? distance = freezed,
    Object? categories = freezed,
    Object? image = freezed,
    Object? userId = freezed,
  }) {
    return _then(_Store(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      storeName: storeName == freezed
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
      openTime: openTime == freezed
          ? _value.openTime
          : openTime // ignore: cast_nullable_to_non_nullable
              as String,
      closeTime: closeTime == freezed
          ? _value.closeTime
          : closeTime // ignore: cast_nullable_to_non_nullable
              as String,
      distance: distance == freezed
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as String?,
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as String?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Store implements _Store {
  _$_Store(
      {required this.id,
      required this.storeName,
      this.address,
      required this.latitude,
      required this.longitude,
      required this.openTime,
      required this.closeTime,
      this.distance,
      this.categories,
      this.image,
      this.userId});

  factory _$_Store.fromJson(Map<String, dynamic> json) =>
      _$_$_StoreFromJson(json);

  @override
  final int id;
  @override
  final String storeName;
  @override
  final String? address;
  @override
  final String latitude;
  @override
  final String longitude;
  @override
  final String openTime;
  @override
  final String closeTime;
  @override
  final String? distance;
  @override
  final String? categories;
  @override
  final String? image;
  @override
  final int? userId;

  @override
  String toString() {
    return 'Store(id: $id, storeName: $storeName, address: $address, latitude: $latitude, longitude: $longitude, openTime: $openTime, closeTime: $closeTime, distance: $distance, categories: $categories, image: $image, userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Store &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.storeName, storeName) ||
                const DeepCollectionEquality()
                    .equals(other.storeName, storeName)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.latitude, latitude) ||
                const DeepCollectionEquality()
                    .equals(other.latitude, latitude)) &&
            (identical(other.longitude, longitude) ||
                const DeepCollectionEquality()
                    .equals(other.longitude, longitude)) &&
            (identical(other.openTime, openTime) ||
                const DeepCollectionEquality()
                    .equals(other.openTime, openTime)) &&
            (identical(other.closeTime, closeTime) ||
                const DeepCollectionEquality()
                    .equals(other.closeTime, closeTime)) &&
            (identical(other.distance, distance) ||
                const DeepCollectionEquality()
                    .equals(other.distance, distance)) &&
            (identical(other.categories, categories) ||
                const DeepCollectionEquality()
                    .equals(other.categories, categories)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(storeName) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(latitude) ^
      const DeepCollectionEquality().hash(longitude) ^
      const DeepCollectionEquality().hash(openTime) ^
      const DeepCollectionEquality().hash(closeTime) ^
      const DeepCollectionEquality().hash(distance) ^
      const DeepCollectionEquality().hash(categories) ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(userId);

  @JsonKey(ignore: true)
  @override
  _$StoreCopyWith<_Store> get copyWith =>
      __$StoreCopyWithImpl<_Store>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_StoreToJson(this);
  }
}

abstract class _Store implements Store {
  factory _Store(
      {required int id,
      required String storeName,
      String? address,
      required String latitude,
      required String longitude,
      required String openTime,
      required String closeTime,
      String? distance,
      String? categories,
      String? image,
      int? userId}) = _$_Store;

  factory _Store.fromJson(Map<String, dynamic> json) = _$_Store.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get storeName => throw _privateConstructorUsedError;
  @override
  String? get address => throw _privateConstructorUsedError;
  @override
  String get latitude => throw _privateConstructorUsedError;
  @override
  String get longitude => throw _privateConstructorUsedError;
  @override
  String get openTime => throw _privateConstructorUsedError;
  @override
  String get closeTime => throw _privateConstructorUsedError;
  @override
  String? get distance => throw _privateConstructorUsedError;
  @override
  String? get categories => throw _privateConstructorUsedError;
  @override
  String? get image => throw _privateConstructorUsedError;
  @override
  int? get userId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StoreCopyWith<_Store> get copyWith => throw _privateConstructorUsedError;
}
