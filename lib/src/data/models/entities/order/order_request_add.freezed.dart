// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'order_request_add.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderRequestAdd _$OrderRequestAddFromJson(Map<String, dynamic> json) {
  return _OrderRequestAdd.fromJson(json);
}

/// @nodoc
class _$OrderRequestAddTearOff {
  const _$OrderRequestAddTearOff();

  _OrderRequestAdd call(
      {@JsonKey(name: 'uidAddress') required int addressId,
      required double total,
      required String typePayment,
      @JsonKey(name: 'products') required List<Cart> carts}) {
    return _OrderRequestAdd(
      addressId: addressId,
      total: total,
      typePayment: typePayment,
      carts: carts,
    );
  }

  OrderRequestAdd fromJson(Map<String, Object> json) {
    return OrderRequestAdd.fromJson(json);
  }
}

/// @nodoc
const $OrderRequestAdd = _$OrderRequestAddTearOff();

/// @nodoc
mixin _$OrderRequestAdd {
  @JsonKey(name: 'uidAddress')
  int get addressId => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  String get typePayment => throw _privateConstructorUsedError;
  @JsonKey(name: 'products')
  List<Cart> get carts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderRequestAddCopyWith<OrderRequestAdd> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderRequestAddCopyWith<$Res> {
  factory $OrderRequestAddCopyWith(
          OrderRequestAdd value, $Res Function(OrderRequestAdd) then) =
      _$OrderRequestAddCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'uidAddress') int addressId,
      double total,
      String typePayment,
      @JsonKey(name: 'products') List<Cart> carts});
}

/// @nodoc
class _$OrderRequestAddCopyWithImpl<$Res>
    implements $OrderRequestAddCopyWith<$Res> {
  _$OrderRequestAddCopyWithImpl(this._value, this._then);

  final OrderRequestAdd _value;
  // ignore: unused_field
  final $Res Function(OrderRequestAdd) _then;

  @override
  $Res call({
    Object? addressId = freezed,
    Object? total = freezed,
    Object? typePayment = freezed,
    Object? carts = freezed,
  }) {
    return _then(_value.copyWith(
      addressId: addressId == freezed
          ? _value.addressId
          : addressId // ignore: cast_nullable_to_non_nullable
              as int,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      typePayment: typePayment == freezed
          ? _value.typePayment
          : typePayment // ignore: cast_nullable_to_non_nullable
              as String,
      carts: carts == freezed
          ? _value.carts
          : carts // ignore: cast_nullable_to_non_nullable
              as List<Cart>,
    ));
  }
}

/// @nodoc
abstract class _$OrderRequestAddCopyWith<$Res>
    implements $OrderRequestAddCopyWith<$Res> {
  factory _$OrderRequestAddCopyWith(
          _OrderRequestAdd value, $Res Function(_OrderRequestAdd) then) =
      __$OrderRequestAddCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'uidAddress') int addressId,
      double total,
      String typePayment,
      @JsonKey(name: 'products') List<Cart> carts});
}

/// @nodoc
class __$OrderRequestAddCopyWithImpl<$Res>
    extends _$OrderRequestAddCopyWithImpl<$Res>
    implements _$OrderRequestAddCopyWith<$Res> {
  __$OrderRequestAddCopyWithImpl(
      _OrderRequestAdd _value, $Res Function(_OrderRequestAdd) _then)
      : super(_value, (v) => _then(v as _OrderRequestAdd));

  @override
  _OrderRequestAdd get _value => super._value as _OrderRequestAdd;

  @override
  $Res call({
    Object? addressId = freezed,
    Object? total = freezed,
    Object? typePayment = freezed,
    Object? carts = freezed,
  }) {
    return _then(_OrderRequestAdd(
      addressId: addressId == freezed
          ? _value.addressId
          : addressId // ignore: cast_nullable_to_non_nullable
              as int,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      typePayment: typePayment == freezed
          ? _value.typePayment
          : typePayment // ignore: cast_nullable_to_non_nullable
              as String,
      carts: carts == freezed
          ? _value.carts
          : carts // ignore: cast_nullable_to_non_nullable
              as List<Cart>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderRequestAdd implements _OrderRequestAdd {
  _$_OrderRequestAdd(
      {@JsonKey(name: 'uidAddress') required this.addressId,
      required this.total,
      required this.typePayment,
      @JsonKey(name: 'products') required this.carts});

  factory _$_OrderRequestAdd.fromJson(Map<String, dynamic> json) =>
      _$_$_OrderRequestAddFromJson(json);

  @override
  @JsonKey(name: 'uidAddress')
  final int addressId;
  @override
  final double total;
  @override
  final String typePayment;
  @override
  @JsonKey(name: 'products')
  final List<Cart> carts;

  @override
  String toString() {
    return 'OrderRequestAdd(addressId: $addressId, total: $total, typePayment: $typePayment, carts: $carts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OrderRequestAdd &&
            (identical(other.addressId, addressId) ||
                const DeepCollectionEquality()
                    .equals(other.addressId, addressId)) &&
            (identical(other.total, total) ||
                const DeepCollectionEquality().equals(other.total, total)) &&
            (identical(other.typePayment, typePayment) ||
                const DeepCollectionEquality()
                    .equals(other.typePayment, typePayment)) &&
            (identical(other.carts, carts) ||
                const DeepCollectionEquality().equals(other.carts, carts)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(addressId) ^
      const DeepCollectionEquality().hash(total) ^
      const DeepCollectionEquality().hash(typePayment) ^
      const DeepCollectionEquality().hash(carts);

  @JsonKey(ignore: true)
  @override
  _$OrderRequestAddCopyWith<_OrderRequestAdd> get copyWith =>
      __$OrderRequestAddCopyWithImpl<_OrderRequestAdd>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_OrderRequestAddToJson(this);
  }
}

abstract class _OrderRequestAdd implements OrderRequestAdd {
  factory _OrderRequestAdd(
          {@JsonKey(name: 'uidAddress') required int addressId,
          required double total,
          required String typePayment,
          @JsonKey(name: 'products') required List<Cart> carts}) =
      _$_OrderRequestAdd;

  factory _OrderRequestAdd.fromJson(Map<String, dynamic> json) =
      _$_OrderRequestAdd.fromJson;

  @override
  @JsonKey(name: 'uidAddress')
  int get addressId => throw _privateConstructorUsedError;
  @override
  double get total => throw _privateConstructorUsedError;
  @override
  String get typePayment => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'products')
  List<Cart> get carts => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$OrderRequestAddCopyWith<_OrderRequestAdd> get copyWith =>
      throw _privateConstructorUsedError;
}
