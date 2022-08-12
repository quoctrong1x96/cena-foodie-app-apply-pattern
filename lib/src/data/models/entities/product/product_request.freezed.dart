// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'product_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductRequest _$ProductRequestFromJson(Map<String, dynamic> json) {
  return _ProductAddRequest.fromJson(json);
}

/// @nodoc
class _$ProductRequestTearOff {
  const _$ProductRequestTearOff();

  _ProductAddRequest call(
      {String? name,
      String? description,
      double price = 0,
      List<String>? images,
      String? category,
      required int categoryId,
      required int storeId}) {
    return _ProductAddRequest(
      name: name,
      description: description,
      price: price,
      images: images,
      category: category,
      categoryId: categoryId,
      storeId: storeId,
    );
  }

  ProductRequest fromJson(Map<String, Object> json) {
    return ProductRequest.fromJson(json);
  }
}

/// @nodoc
const $ProductRequest = _$ProductRequestTearOff();

/// @nodoc
mixin _$ProductRequest {
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  List<String>? get images => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  int get categoryId => throw _privateConstructorUsedError;
  int get storeId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductRequestCopyWith<ProductRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductRequestCopyWith<$Res> {
  factory $ProductRequestCopyWith(
          ProductRequest value, $Res Function(ProductRequest) then) =
      _$ProductRequestCopyWithImpl<$Res>;
  $Res call(
      {String? name,
      String? description,
      double price,
      List<String>? images,
      String? category,
      int categoryId,
      int storeId});
}

/// @nodoc
class _$ProductRequestCopyWithImpl<$Res>
    implements $ProductRequestCopyWith<$Res> {
  _$ProductRequestCopyWithImpl(this._value, this._then);

  final ProductRequest _value;
  // ignore: unused_field
  final $Res Function(ProductRequest) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? images = freezed,
    Object? category = freezed,
    Object? categoryId = freezed,
    Object? storeId = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      images: images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      storeId: storeId == freezed
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$ProductAddRequestCopyWith<$Res>
    implements $ProductRequestCopyWith<$Res> {
  factory _$ProductAddRequestCopyWith(
          _ProductAddRequest value, $Res Function(_ProductAddRequest) then) =
      __$ProductAddRequestCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? name,
      String? description,
      double price,
      List<String>? images,
      String? category,
      int categoryId,
      int storeId});
}

/// @nodoc
class __$ProductAddRequestCopyWithImpl<$Res>
    extends _$ProductRequestCopyWithImpl<$Res>
    implements _$ProductAddRequestCopyWith<$Res> {
  __$ProductAddRequestCopyWithImpl(
      _ProductAddRequest _value, $Res Function(_ProductAddRequest) _then)
      : super(_value, (v) => _then(v as _ProductAddRequest));

  @override
  _ProductAddRequest get _value => super._value as _ProductAddRequest;

  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? images = freezed,
    Object? category = freezed,
    Object? categoryId = freezed,
    Object? storeId = freezed,
  }) {
    return _then(_ProductAddRequest(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      images: images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      storeId: storeId == freezed
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductAddRequest implements _ProductAddRequest {
  _$_ProductAddRequest(
      {this.name,
      this.description,
      this.price = 0,
      this.images,
      this.category,
      required this.categoryId,
      required this.storeId});

  factory _$_ProductAddRequest.fromJson(Map<String, dynamic> json) =>
      _$_$_ProductAddRequestFromJson(json);

  @override
  final String? name;
  @override
  final String? description;
  @JsonKey(defaultValue: 0)
  @override
  final double price;
  @override
  final List<String>? images;
  @override
  final String? category;
  @override
  final int categoryId;
  @override
  final int storeId;

  @override
  String toString() {
    return 'ProductRequest(name: $name, description: $description, price: $price, images: $images, category: $category, categoryId: $categoryId, storeId: $storeId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProductAddRequest &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.images, images) ||
                const DeepCollectionEquality().equals(other.images, images)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.categoryId, categoryId) ||
                const DeepCollectionEquality()
                    .equals(other.categoryId, categoryId)) &&
            (identical(other.storeId, storeId) ||
                const DeepCollectionEquality().equals(other.storeId, storeId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(images) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(categoryId) ^
      const DeepCollectionEquality().hash(storeId);

  @JsonKey(ignore: true)
  @override
  _$ProductAddRequestCopyWith<_ProductAddRequest> get copyWith =>
      __$ProductAddRequestCopyWithImpl<_ProductAddRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ProductAddRequestToJson(this);
  }
}

abstract class _ProductAddRequest implements ProductRequest {
  factory _ProductAddRequest(
      {String? name,
      String? description,
      double price,
      List<String>? images,
      String? category,
      required int categoryId,
      required int storeId}) = _$_ProductAddRequest;

  factory _ProductAddRequest.fromJson(Map<String, dynamic> json) =
      _$_ProductAddRequest.fromJson;

  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get description => throw _privateConstructorUsedError;
  @override
  double get price => throw _privateConstructorUsedError;
  @override
  List<String>? get images => throw _privateConstructorUsedError;
  @override
  String? get category => throw _privateConstructorUsedError;
  @override
  int get categoryId => throw _privateConstructorUsedError;
  @override
  int get storeId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ProductAddRequestCopyWith<_ProductAddRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
