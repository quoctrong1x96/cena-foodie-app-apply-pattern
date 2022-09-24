// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'order_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderDetail _$OrderDetailFromJson(Map<String, dynamic> json) {
  return _OrderDetail.fromJson(json);
}

/// @nodoc
class _$OrderDetailTearOff {
  const _$OrderDetailTearOff();

  _OrderDetail call(
      {required int? id,
      @JsonKey(name: 'order_id') int? orderId,
      @JsonKey(name: 'product_id') int? productId,
      @JsonKey(name: 'product_name') String? nameProduct,
      String? picture,
      int? quantity,
      double? total}) {
    return _OrderDetail(
      id: id,
      orderId: orderId,
      productId: productId,
      nameProduct: nameProduct,
      picture: picture,
      quantity: quantity,
      total: total,
    );
  }

  OrderDetail fromJson(Map<String, Object> json) {
    return OrderDetail.fromJson(json);
  }
}

/// @nodoc
const $OrderDetail = _$OrderDetailTearOff();

/// @nodoc
mixin _$OrderDetail {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_id')
  int? get orderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id')
  int? get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String? get nameProduct => throw _privateConstructorUsedError;
  String? get picture => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;
  double? get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderDetailCopyWith<OrderDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDetailCopyWith<$Res> {
  factory $OrderDetailCopyWith(
          OrderDetail value, $Res Function(OrderDetail) then) =
      _$OrderDetailCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      @JsonKey(name: 'order_id') int? orderId,
      @JsonKey(name: 'product_id') int? productId,
      @JsonKey(name: 'product_name') String? nameProduct,
      String? picture,
      int? quantity,
      double? total});
}

/// @nodoc
class _$OrderDetailCopyWithImpl<$Res> implements $OrderDetailCopyWith<$Res> {
  _$OrderDetailCopyWithImpl(this._value, this._then);

  final OrderDetail _value;
  // ignore: unused_field
  final $Res Function(OrderDetail) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? orderId = freezed,
    Object? productId = freezed,
    Object? nameProduct = freezed,
    Object? picture = freezed,
    Object? quantity = freezed,
    Object? total = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      orderId: orderId == freezed
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int?,
      productId: productId == freezed
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int?,
      nameProduct: nameProduct == freezed
          ? _value.nameProduct
          : nameProduct // ignore: cast_nullable_to_non_nullable
              as String?,
      picture: picture == freezed
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
abstract class _$OrderDetailCopyWith<$Res>
    implements $OrderDetailCopyWith<$Res> {
  factory _$OrderDetailCopyWith(
          _OrderDetail value, $Res Function(_OrderDetail) then) =
      __$OrderDetailCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      @JsonKey(name: 'order_id') int? orderId,
      @JsonKey(name: 'product_id') int? productId,
      @JsonKey(name: 'product_name') String? nameProduct,
      String? picture,
      int? quantity,
      double? total});
}

/// @nodoc
class __$OrderDetailCopyWithImpl<$Res> extends _$OrderDetailCopyWithImpl<$Res>
    implements _$OrderDetailCopyWith<$Res> {
  __$OrderDetailCopyWithImpl(
      _OrderDetail _value, $Res Function(_OrderDetail) _then)
      : super(_value, (v) => _then(v as _OrderDetail));

  @override
  _OrderDetail get _value => super._value as _OrderDetail;

  @override
  $Res call({
    Object? id = freezed,
    Object? orderId = freezed,
    Object? productId = freezed,
    Object? nameProduct = freezed,
    Object? picture = freezed,
    Object? quantity = freezed,
    Object? total = freezed,
  }) {
    return _then(_OrderDetail(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      orderId: orderId == freezed
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int?,
      productId: productId == freezed
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int?,
      nameProduct: nameProduct == freezed
          ? _value.nameProduct
          : nameProduct // ignore: cast_nullable_to_non_nullable
              as String?,
      picture: picture == freezed
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderDetail implements _OrderDetail {
  _$_OrderDetail(
      {required this.id,
      @JsonKey(name: 'order_id') this.orderId,
      @JsonKey(name: 'product_id') this.productId,
      @JsonKey(name: 'product_name') this.nameProduct,
      this.picture,
      this.quantity,
      this.total});

  factory _$_OrderDetail.fromJson(Map<String, dynamic> json) =>
      _$_$_OrderDetailFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'order_id')
  final int? orderId;
  @override
  @JsonKey(name: 'product_id')
  final int? productId;
  @override
  @JsonKey(name: 'product_name')
  final String? nameProduct;
  @override
  final String? picture;
  @override
  final int? quantity;
  @override
  final double? total;

  @override
  String toString() {
    return 'OrderDetail(id: $id, orderId: $orderId, productId: $productId, nameProduct: $nameProduct, picture: $picture, quantity: $quantity, total: $total)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OrderDetail &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.orderId, orderId) ||
                const DeepCollectionEquality()
                    .equals(other.orderId, orderId)) &&
            (identical(other.productId, productId) ||
                const DeepCollectionEquality()
                    .equals(other.productId, productId)) &&
            (identical(other.nameProduct, nameProduct) ||
                const DeepCollectionEquality()
                    .equals(other.nameProduct, nameProduct)) &&
            (identical(other.picture, picture) ||
                const DeepCollectionEquality()
                    .equals(other.picture, picture)) &&
            (identical(other.quantity, quantity) ||
                const DeepCollectionEquality()
                    .equals(other.quantity, quantity)) &&
            (identical(other.total, total) ||
                const DeepCollectionEquality().equals(other.total, total)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(orderId) ^
      const DeepCollectionEquality().hash(productId) ^
      const DeepCollectionEquality().hash(nameProduct) ^
      const DeepCollectionEquality().hash(picture) ^
      const DeepCollectionEquality().hash(quantity) ^
      const DeepCollectionEquality().hash(total);

  @JsonKey(ignore: true)
  @override
  _$OrderDetailCopyWith<_OrderDetail> get copyWith =>
      __$OrderDetailCopyWithImpl<_OrderDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_OrderDetailToJson(this);
  }
}

abstract class _OrderDetail implements OrderDetail {
  factory _OrderDetail(
      {required int? id,
      @JsonKey(name: 'order_id') int? orderId,
      @JsonKey(name: 'product_id') int? productId,
      @JsonKey(name: 'product_name') String? nameProduct,
      String? picture,
      int? quantity,
      double? total}) = _$_OrderDetail;

  factory _OrderDetail.fromJson(Map<String, dynamic> json) =
      _$_OrderDetail.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'order_id')
  int? get orderId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'product_id')
  int? get productId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'product_name')
  String? get nameProduct => throw _privateConstructorUsedError;
  @override
  String? get picture => throw _privateConstructorUsedError;
  @override
  int? get quantity => throw _privateConstructorUsedError;
  @override
  double? get total => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$OrderDetailCopyWith<_OrderDetail> get copyWith =>
      throw _privateConstructorUsedError;
}
