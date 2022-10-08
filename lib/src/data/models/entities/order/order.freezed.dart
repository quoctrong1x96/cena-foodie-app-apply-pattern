// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
class _$OrderTearOff {
  const _$OrderTearOff();

  _Order call(
      {@JsonKey(name: "order_id") required int id,
      @JsonKey(name: "delivery_id") int? deliveryId,
      @JsonKey(name: "delivery") String? deliveryName,
      @JsonKey(name: "delivery_image") String? deliveryImage,
      @JsonKey(name: "client_id") int? clientId,
      @JsonKey(name: "client") String? client,
      @JsonKey(name: "client_image") String? clientImage,
      @JsonKey(name: "client_phone") String? clientPhone,
      @JsonKey(name: "address_id") int? addressId,
      String? address,
      @JsonKey(name: "receiver") String? receiver,
      @JsonKey(name: "latitude") String? latitude,
      @JsonKey(name: "longitude") String? longitude,
      String? status,
      @JsonKey(name: "pay_type") String? payType,
      double? amount,
      @JsonKey(name: "update_date") DateTime? currentDate,
      @JsonKey(name: "store_id") int? storeId,
      @JsonKey(name: "store_latitude") String? storeLatitude,
      @JsonKey(name: "store_longitude") String? storeLongitude}) {
    return _Order(
      id: id,
      deliveryId: deliveryId,
      deliveryName: deliveryName,
      deliveryImage: deliveryImage,
      clientId: clientId,
      client: client,
      clientImage: clientImage,
      clientPhone: clientPhone,
      addressId: addressId,
      address: address,
      receiver: receiver,
      latitude: latitude,
      longitude: longitude,
      status: status,
      payType: payType,
      amount: amount,
      currentDate: currentDate,
      storeId: storeId,
      storeLatitude: storeLatitude,
      storeLongitude: storeLongitude,
    );
  }

  Order fromJson(Map<String, Object> json) {
    return Order.fromJson(json);
  }
}

/// @nodoc
const $Order = _$OrderTearOff();

/// @nodoc
mixin _$Order {
  @JsonKey(name: "order_id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "delivery_id")
  int? get deliveryId => throw _privateConstructorUsedError;
  @JsonKey(name: "delivery")
  String? get deliveryName => throw _privateConstructorUsedError;
  @JsonKey(name: "delivery_image")
  String? get deliveryImage => throw _privateConstructorUsedError;
  @JsonKey(name: "client_id")
  int? get clientId => throw _privateConstructorUsedError;
  @JsonKey(name: "client")
  String? get client => throw _privateConstructorUsedError;
  @JsonKey(name: "client_image")
  String? get clientImage => throw _privateConstructorUsedError;
  @JsonKey(name: "client_phone")
  String? get clientPhone => throw _privateConstructorUsedError;
  @JsonKey(name: "address_id")
  int? get addressId => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: "receiver")
  String? get receiver => throw _privateConstructorUsedError;
  @JsonKey(name: "latitude")
  String? get latitude => throw _privateConstructorUsedError;
  @JsonKey(name: "longitude")
  String? get longitude => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "pay_type")
  String? get payType => throw _privateConstructorUsedError;
  double? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: "update_date")
  DateTime? get currentDate => throw _privateConstructorUsedError;
  @JsonKey(name: "store_id")
  int? get storeId => throw _privateConstructorUsedError;
  @JsonKey(name: "store_latitude")
  String? get storeLatitude => throw _privateConstructorUsedError;
  @JsonKey(name: "store_longitude")
  String? get storeLongitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "order_id") int id,
      @JsonKey(name: "delivery_id") int? deliveryId,
      @JsonKey(name: "delivery") String? deliveryName,
      @JsonKey(name: "delivery_image") String? deliveryImage,
      @JsonKey(name: "client_id") int? clientId,
      @JsonKey(name: "client") String? client,
      @JsonKey(name: "client_image") String? clientImage,
      @JsonKey(name: "client_phone") String? clientPhone,
      @JsonKey(name: "address_id") int? addressId,
      String? address,
      @JsonKey(name: "receiver") String? receiver,
      @JsonKey(name: "latitude") String? latitude,
      @JsonKey(name: "longitude") String? longitude,
      String? status,
      @JsonKey(name: "pay_type") String? payType,
      double? amount,
      @JsonKey(name: "update_date") DateTime? currentDate,
      @JsonKey(name: "store_id") int? storeId,
      @JsonKey(name: "store_latitude") String? storeLatitude,
      @JsonKey(name: "store_longitude") String? storeLongitude});
}

/// @nodoc
class _$OrderCopyWithImpl<$Res> implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  final Order _value;
  // ignore: unused_field
  final $Res Function(Order) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? deliveryId = freezed,
    Object? deliveryName = freezed,
    Object? deliveryImage = freezed,
    Object? clientId = freezed,
    Object? client = freezed,
    Object? clientImage = freezed,
    Object? clientPhone = freezed,
    Object? addressId = freezed,
    Object? address = freezed,
    Object? receiver = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? status = freezed,
    Object? payType = freezed,
    Object? amount = freezed,
    Object? currentDate = freezed,
    Object? storeId = freezed,
    Object? storeLatitude = freezed,
    Object? storeLongitude = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryId: deliveryId == freezed
          ? _value.deliveryId
          : deliveryId // ignore: cast_nullable_to_non_nullable
              as int?,
      deliveryName: deliveryName == freezed
          ? _value.deliveryName
          : deliveryName // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryImage: deliveryImage == freezed
          ? _value.deliveryImage
          : deliveryImage // ignore: cast_nullable_to_non_nullable
              as String?,
      clientId: clientId == freezed
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as int?,
      client: client == freezed
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as String?,
      clientImage: clientImage == freezed
          ? _value.clientImage
          : clientImage // ignore: cast_nullable_to_non_nullable
              as String?,
      clientPhone: clientPhone == freezed
          ? _value.clientPhone
          : clientPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      addressId: addressId == freezed
          ? _value.addressId
          : addressId // ignore: cast_nullable_to_non_nullable
              as int?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      receiver: receiver == freezed
          ? _value.receiver
          : receiver // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      payType: payType == freezed
          ? _value.payType
          : payType // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      currentDate: currentDate == freezed
          ? _value.currentDate
          : currentDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      storeId: storeId == freezed
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int?,
      storeLatitude: storeLatitude == freezed
          ? _value.storeLatitude
          : storeLatitude // ignore: cast_nullable_to_non_nullable
              as String?,
      storeLongitude: storeLongitude == freezed
          ? _value.storeLongitude
          : storeLongitude // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$OrderCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$OrderCopyWith(_Order value, $Res Function(_Order) then) =
      __$OrderCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "order_id") int id,
      @JsonKey(name: "delivery_id") int? deliveryId,
      @JsonKey(name: "delivery") String? deliveryName,
      @JsonKey(name: "delivery_image") String? deliveryImage,
      @JsonKey(name: "client_id") int? clientId,
      @JsonKey(name: "client") String? client,
      @JsonKey(name: "client_image") String? clientImage,
      @JsonKey(name: "client_phone") String? clientPhone,
      @JsonKey(name: "address_id") int? addressId,
      String? address,
      @JsonKey(name: "receiver") String? receiver,
      @JsonKey(name: "latitude") String? latitude,
      @JsonKey(name: "longitude") String? longitude,
      String? status,
      @JsonKey(name: "pay_type") String? payType,
      double? amount,
      @JsonKey(name: "update_date") DateTime? currentDate,
      @JsonKey(name: "store_id") int? storeId,
      @JsonKey(name: "store_latitude") String? storeLatitude,
      @JsonKey(name: "store_longitude") String? storeLongitude});
}

/// @nodoc
class __$OrderCopyWithImpl<$Res> extends _$OrderCopyWithImpl<$Res>
    implements _$OrderCopyWith<$Res> {
  __$OrderCopyWithImpl(_Order _value, $Res Function(_Order) _then)
      : super(_value, (v) => _then(v as _Order));

  @override
  _Order get _value => super._value as _Order;

  @override
  $Res call({
    Object? id = freezed,
    Object? deliveryId = freezed,
    Object? deliveryName = freezed,
    Object? deliveryImage = freezed,
    Object? clientId = freezed,
    Object? client = freezed,
    Object? clientImage = freezed,
    Object? clientPhone = freezed,
    Object? addressId = freezed,
    Object? address = freezed,
    Object? receiver = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? status = freezed,
    Object? payType = freezed,
    Object? amount = freezed,
    Object? currentDate = freezed,
    Object? storeId = freezed,
    Object? storeLatitude = freezed,
    Object? storeLongitude = freezed,
  }) {
    return _then(_Order(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryId: deliveryId == freezed
          ? _value.deliveryId
          : deliveryId // ignore: cast_nullable_to_non_nullable
              as int?,
      deliveryName: deliveryName == freezed
          ? _value.deliveryName
          : deliveryName // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryImage: deliveryImage == freezed
          ? _value.deliveryImage
          : deliveryImage // ignore: cast_nullable_to_non_nullable
              as String?,
      clientId: clientId == freezed
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as int?,
      client: client == freezed
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as String?,
      clientImage: clientImage == freezed
          ? _value.clientImage
          : clientImage // ignore: cast_nullable_to_non_nullable
              as String?,
      clientPhone: clientPhone == freezed
          ? _value.clientPhone
          : clientPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      addressId: addressId == freezed
          ? _value.addressId
          : addressId // ignore: cast_nullable_to_non_nullable
              as int?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      receiver: receiver == freezed
          ? _value.receiver
          : receiver // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      payType: payType == freezed
          ? _value.payType
          : payType // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      currentDate: currentDate == freezed
          ? _value.currentDate
          : currentDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      storeId: storeId == freezed
          ? _value.storeId
          : storeId // ignore: cast_nullable_to_non_nullable
              as int?,
      storeLatitude: storeLatitude == freezed
          ? _value.storeLatitude
          : storeLatitude // ignore: cast_nullable_to_non_nullable
              as String?,
      storeLongitude: storeLongitude == freezed
          ? _value.storeLongitude
          : storeLongitude // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Order implements _Order {
  _$_Order(
      {@JsonKey(name: "order_id") required this.id,
      @JsonKey(name: "delivery_id") this.deliveryId,
      @JsonKey(name: "delivery") this.deliveryName,
      @JsonKey(name: "delivery_image") this.deliveryImage,
      @JsonKey(name: "client_id") this.clientId,
      @JsonKey(name: "client") this.client,
      @JsonKey(name: "client_image") this.clientImage,
      @JsonKey(name: "client_phone") this.clientPhone,
      @JsonKey(name: "address_id") this.addressId,
      this.address,
      @JsonKey(name: "receiver") this.receiver,
      @JsonKey(name: "latitude") this.latitude,
      @JsonKey(name: "longitude") this.longitude,
      this.status,
      @JsonKey(name: "pay_type") this.payType,
      this.amount,
      @JsonKey(name: "update_date") this.currentDate,
      @JsonKey(name: "store_id") this.storeId,
      @JsonKey(name: "store_latitude") this.storeLatitude,
      @JsonKey(name: "store_longitude") this.storeLongitude});

  factory _$_Order.fromJson(Map<String, dynamic> json) =>
      _$_$_OrderFromJson(json);

  @override
  @JsonKey(name: "order_id")
  final int id;
  @override
  @JsonKey(name: "delivery_id")
  final int? deliveryId;
  @override
  @JsonKey(name: "delivery")
  final String? deliveryName;
  @override
  @JsonKey(name: "delivery_image")
  final String? deliveryImage;
  @override
  @JsonKey(name: "client_id")
  final int? clientId;
  @override
  @JsonKey(name: "client")
  final String? client;
  @override
  @JsonKey(name: "client_image")
  final String? clientImage;
  @override
  @JsonKey(name: "client_phone")
  final String? clientPhone;
  @override
  @JsonKey(name: "address_id")
  final int? addressId;
  @override
  final String? address;
  @override
  @JsonKey(name: "receiver")
  final String? receiver;
  @override
  @JsonKey(name: "latitude")
  final String? latitude;
  @override
  @JsonKey(name: "longitude")
  final String? longitude;
  @override
  final String? status;
  @override
  @JsonKey(name: "pay_type")
  final String? payType;
  @override
  final double? amount;
  @override
  @JsonKey(name: "update_date")
  final DateTime? currentDate;
  @override
  @JsonKey(name: "store_id")
  final int? storeId;
  @override
  @JsonKey(name: "store_latitude")
  final String? storeLatitude;
  @override
  @JsonKey(name: "store_longitude")
  final String? storeLongitude;

  @override
  String toString() {
    return 'Order(id: $id, deliveryId: $deliveryId, deliveryName: $deliveryName, deliveryImage: $deliveryImage, clientId: $clientId, client: $client, clientImage: $clientImage, clientPhone: $clientPhone, addressId: $addressId, address: $address, receiver: $receiver, latitude: $latitude, longitude: $longitude, status: $status, payType: $payType, amount: $amount, currentDate: $currentDate, storeId: $storeId, storeLatitude: $storeLatitude, storeLongitude: $storeLongitude)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Order &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.deliveryId, deliveryId) ||
                const DeepCollectionEquality()
                    .equals(other.deliveryId, deliveryId)) &&
            (identical(other.deliveryName, deliveryName) ||
                const DeepCollectionEquality()
                    .equals(other.deliveryName, deliveryName)) &&
            (identical(other.deliveryImage, deliveryImage) ||
                const DeepCollectionEquality()
                    .equals(other.deliveryImage, deliveryImage)) &&
            (identical(other.clientId, clientId) ||
                const DeepCollectionEquality()
                    .equals(other.clientId, clientId)) &&
            (identical(other.client, client) ||
                const DeepCollectionEquality().equals(other.client, client)) &&
            (identical(other.clientImage, clientImage) ||
                const DeepCollectionEquality()
                    .equals(other.clientImage, clientImage)) &&
            (identical(other.clientPhone, clientPhone) ||
                const DeepCollectionEquality()
                    .equals(other.clientPhone, clientPhone)) &&
            (identical(other.addressId, addressId) ||
                const DeepCollectionEquality()
                    .equals(other.addressId, addressId)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.receiver, receiver) ||
                const DeepCollectionEquality()
                    .equals(other.receiver, receiver)) &&
            (identical(other.latitude, latitude) ||
                const DeepCollectionEquality()
                    .equals(other.latitude, latitude)) &&
            (identical(other.longitude, longitude) ||
                const DeepCollectionEquality()
                    .equals(other.longitude, longitude)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.payType, payType) ||
                const DeepCollectionEquality()
                    .equals(other.payType, payType)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.currentDate, currentDate) ||
                const DeepCollectionEquality()
                    .equals(other.currentDate, currentDate)) &&
            (identical(other.storeId, storeId) ||
                const DeepCollectionEquality()
                    .equals(other.storeId, storeId)) &&
            (identical(other.storeLatitude, storeLatitude) ||
                const DeepCollectionEquality()
                    .equals(other.storeLatitude, storeLatitude)) &&
            (identical(other.storeLongitude, storeLongitude) ||
                const DeepCollectionEquality()
                    .equals(other.storeLongitude, storeLongitude)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(deliveryId) ^
      const DeepCollectionEquality().hash(deliveryName) ^
      const DeepCollectionEquality().hash(deliveryImage) ^
      const DeepCollectionEquality().hash(clientId) ^
      const DeepCollectionEquality().hash(client) ^
      const DeepCollectionEquality().hash(clientImage) ^
      const DeepCollectionEquality().hash(clientPhone) ^
      const DeepCollectionEquality().hash(addressId) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(receiver) ^
      const DeepCollectionEquality().hash(latitude) ^
      const DeepCollectionEquality().hash(longitude) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(payType) ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(currentDate) ^
      const DeepCollectionEquality().hash(storeId) ^
      const DeepCollectionEquality().hash(storeLatitude) ^
      const DeepCollectionEquality().hash(storeLongitude);

  @JsonKey(ignore: true)
  @override
  _$OrderCopyWith<_Order> get copyWith =>
      __$OrderCopyWithImpl<_Order>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_OrderToJson(this);
  }
}

abstract class _Order implements Order {
  factory _Order(
      {@JsonKey(name: "order_id") required int id,
      @JsonKey(name: "delivery_id") int? deliveryId,
      @JsonKey(name: "delivery") String? deliveryName,
      @JsonKey(name: "delivery_image") String? deliveryImage,
      @JsonKey(name: "client_id") int? clientId,
      @JsonKey(name: "client") String? client,
      @JsonKey(name: "client_image") String? clientImage,
      @JsonKey(name: "client_phone") String? clientPhone,
      @JsonKey(name: "address_id") int? addressId,
      String? address,
      @JsonKey(name: "receiver") String? receiver,
      @JsonKey(name: "latitude") String? latitude,
      @JsonKey(name: "longitude") String? longitude,
      String? status,
      @JsonKey(name: "pay_type") String? payType,
      double? amount,
      @JsonKey(name: "update_date") DateTime? currentDate,
      @JsonKey(name: "store_id") int? storeId,
      @JsonKey(name: "store_latitude") String? storeLatitude,
      @JsonKey(name: "store_longitude") String? storeLongitude}) = _$_Order;

  factory _Order.fromJson(Map<String, dynamic> json) = _$_Order.fromJson;

  @override
  @JsonKey(name: "order_id")
  int get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "delivery_id")
  int? get deliveryId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "delivery")
  String? get deliveryName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "delivery_image")
  String? get deliveryImage => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "client_id")
  int? get clientId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "client")
  String? get client => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "client_image")
  String? get clientImage => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "client_phone")
  String? get clientPhone => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "address_id")
  int? get addressId => throw _privateConstructorUsedError;
  @override
  String? get address => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "receiver")
  String? get receiver => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "latitude")
  String? get latitude => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "longitude")
  String? get longitude => throw _privateConstructorUsedError;
  @override
  String? get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "pay_type")
  String? get payType => throw _privateConstructorUsedError;
  @override
  double? get amount => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "update_date")
  DateTime? get currentDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "store_id")
  int? get storeId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "store_latitude")
  String? get storeLatitude => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: "store_longitude")
  String? get storeLongitude => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$OrderCopyWith<_Order> get copyWith => throw _privateConstructorUsedError;
}
