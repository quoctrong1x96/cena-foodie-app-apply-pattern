// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'product_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductImage _$ProductImageFromJson(Map<String, dynamic> json) {
  return _ProductImage.fromJson(json);
}

/// @nodoc
class _$ProductImageTearOff {
  const _$ProductImageTearOff();

  _ProductImage call(
      {required int id, required String networkUrl, required int productId}) {
    return _ProductImage(
      id: id,
      networkUrl: networkUrl,
      productId: productId,
    );
  }

  ProductImage fromJson(Map<String, Object> json) {
    return ProductImage.fromJson(json);
  }
}

/// @nodoc
const $ProductImage = _$ProductImageTearOff();

/// @nodoc
mixin _$ProductImage {
  int get id => throw _privateConstructorUsedError;
  String get networkUrl => throw _privateConstructorUsedError;
  int get productId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductImageCopyWith<ProductImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductImageCopyWith<$Res> {
  factory $ProductImageCopyWith(
          ProductImage value, $Res Function(ProductImage) then) =
      _$ProductImageCopyWithImpl<$Res>;
  $Res call({int id, String networkUrl, int productId});
}

/// @nodoc
class _$ProductImageCopyWithImpl<$Res> implements $ProductImageCopyWith<$Res> {
  _$ProductImageCopyWithImpl(this._value, this._then);

  final ProductImage _value;
  // ignore: unused_field
  final $Res Function(ProductImage) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? networkUrl = freezed,
    Object? productId = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      networkUrl: networkUrl == freezed
          ? _value.networkUrl
          : networkUrl // ignore: cast_nullable_to_non_nullable
              as String,
      productId: productId == freezed
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$ProductImageCopyWith<$Res>
    implements $ProductImageCopyWith<$Res> {
  factory _$ProductImageCopyWith(
          _ProductImage value, $Res Function(_ProductImage) then) =
      __$ProductImageCopyWithImpl<$Res>;
  @override
  $Res call({int id, String networkUrl, int productId});
}

/// @nodoc
class __$ProductImageCopyWithImpl<$Res> extends _$ProductImageCopyWithImpl<$Res>
    implements _$ProductImageCopyWith<$Res> {
  __$ProductImageCopyWithImpl(
      _ProductImage _value, $Res Function(_ProductImage) _then)
      : super(_value, (v) => _then(v as _ProductImage));

  @override
  _ProductImage get _value => super._value as _ProductImage;

  @override
  $Res call({
    Object? id = freezed,
    Object? networkUrl = freezed,
    Object? productId = freezed,
  }) {
    return _then(_ProductImage(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      networkUrl: networkUrl == freezed
          ? _value.networkUrl
          : networkUrl // ignore: cast_nullable_to_non_nullable
              as String,
      productId: productId == freezed
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductImage implements _ProductImage {
  _$_ProductImage(
      {required this.id, required this.networkUrl, required this.productId});

  factory _$_ProductImage.fromJson(Map<String, dynamic> json) =>
      _$_$_ProductImageFromJson(json);

  @override
  final int id;
  @override
  final String networkUrl;
  @override
  final int productId;

  @override
  String toString() {
    return 'ProductImage(id: $id, networkUrl: $networkUrl, productId: $productId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProductImage &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.networkUrl, networkUrl) ||
                const DeepCollectionEquality()
                    .equals(other.networkUrl, networkUrl)) &&
            (identical(other.productId, productId) ||
                const DeepCollectionEquality()
                    .equals(other.productId, productId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(networkUrl) ^
      const DeepCollectionEquality().hash(productId);

  @JsonKey(ignore: true)
  @override
  _$ProductImageCopyWith<_ProductImage> get copyWith =>
      __$ProductImageCopyWithImpl<_ProductImage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ProductImageToJson(this);
  }
}

abstract class _ProductImage implements ProductImage {
  factory _ProductImage(
      {required int id,
      required String networkUrl,
      required int productId}) = _$_ProductImage;

  factory _ProductImage.fromJson(Map<String, dynamic> json) =
      _$_ProductImage.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  String get networkUrl => throw _privateConstructorUsedError;
  @override
  int get productId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ProductImageCopyWith<_ProductImage> get copyWith =>
      throw _privateConstructorUsedError;
}
