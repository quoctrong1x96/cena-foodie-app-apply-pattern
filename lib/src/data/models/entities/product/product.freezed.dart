// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
class _$ProductTearOff {
  const _$ProductTearOff();

  _Product call(
      {required int id,
      @JsonKey(name: 'name') String? nameProduct,
      String? description,
      double price = 0,
      int status = 1,
      String? picture,
      String? category,
      @JsonKey(name: 'category_id') required int categoryId,
      @JsonKey(name: 'store_id') required int storeId,
      int liked = 0,
      int viewer = 0,
      int sales = 0,
      @JsonKey(name: 'total_sales') int totalSales = 0}) {
    return _Product(
      id: id,
      nameProduct: nameProduct,
      description: description,
      price: price,
      status: status,
      picture: picture,
      category: category,
      categoryId: categoryId,
      storeId: storeId,
      liked: liked,
      viewer: viewer,
      sales: sales,
      totalSales: totalSales,
    );
  }

  Product fromJson(Map<String, Object> json) {
    return Product.fromJson(json);
  }
}

/// @nodoc
const $Product = _$ProductTearOff();

/// @nodoc
mixin _$Product {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get nameProduct => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;
  String? get picture => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  int get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'store_id')
  int get storeId => throw _privateConstructorUsedError;
  int get liked => throw _privateConstructorUsedError;
  int get viewer => throw _privateConstructorUsedError;
  int get sales => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_sales')
  int get totalSales => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res>;
  $Res call(
      {int id,
      @JsonKey(name: 'name') String? nameProduct,
      String? description,
      double price,
      int status,
      String? picture,
      String? category,
      @JsonKey(name: 'category_id') int categoryId,
      @JsonKey(name: 'store_id') int storeId,
      int liked,
      int viewer,
      int sales,
      @JsonKey(name: 'total_sales') int totalSales});
}

/// @nodoc
class _$ProductCopyWithImpl<$Res> implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  final Product _value;
  // ignore: unused_field
  final $Res Function(Product) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? nameProduct = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? status = freezed,
    Object? picture = freezed,
    Object? category = freezed,
    Object? categoryId = freezed,
    Object? storeId = freezed,
    Object? liked = freezed,
    Object? viewer = freezed,
    Object? sales = freezed,
    Object? totalSales = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nameProduct: nameProduct == freezed
          ? _value.nameProduct
          : nameProduct // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      picture: picture == freezed
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
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
      liked: liked == freezed
          ? _value.liked
          : liked // ignore: cast_nullable_to_non_nullable
              as int,
      viewer: viewer == freezed
          ? _value.viewer
          : viewer // ignore: cast_nullable_to_non_nullable
              as int,
      sales: sales == freezed
          ? _value.sales
          : sales // ignore: cast_nullable_to_non_nullable
              as int,
      totalSales: totalSales == freezed
          ? _value.totalSales
          : totalSales // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$ProductCopyWith(_Product value, $Res Function(_Product) then) =
      __$ProductCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      @JsonKey(name: 'name') String? nameProduct,
      String? description,
      double price,
      int status,
      String? picture,
      String? category,
      @JsonKey(name: 'category_id') int categoryId,
      @JsonKey(name: 'store_id') int storeId,
      int liked,
      int viewer,
      int sales,
      @JsonKey(name: 'total_sales') int totalSales});
}

/// @nodoc
class __$ProductCopyWithImpl<$Res> extends _$ProductCopyWithImpl<$Res>
    implements _$ProductCopyWith<$Res> {
  __$ProductCopyWithImpl(_Product _value, $Res Function(_Product) _then)
      : super(_value, (v) => _then(v as _Product));

  @override
  _Product get _value => super._value as _Product;

  @override
  $Res call({
    Object? id = freezed,
    Object? nameProduct = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? status = freezed,
    Object? picture = freezed,
    Object? category = freezed,
    Object? categoryId = freezed,
    Object? storeId = freezed,
    Object? liked = freezed,
    Object? viewer = freezed,
    Object? sales = freezed,
    Object? totalSales = freezed,
  }) {
    return _then(_Product(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nameProduct: nameProduct == freezed
          ? _value.nameProduct
          : nameProduct // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      picture: picture == freezed
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
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
      liked: liked == freezed
          ? _value.liked
          : liked // ignore: cast_nullable_to_non_nullable
              as int,
      viewer: viewer == freezed
          ? _value.viewer
          : viewer // ignore: cast_nullable_to_non_nullable
              as int,
      sales: sales == freezed
          ? _value.sales
          : sales // ignore: cast_nullable_to_non_nullable
              as int,
      totalSales: totalSales == freezed
          ? _value.totalSales
          : totalSales // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Product implements _Product {
  _$_Product(
      {required this.id,
      @JsonKey(name: 'name') this.nameProduct,
      this.description,
      this.price = 0,
      this.status = 1,
      this.picture,
      this.category,
      @JsonKey(name: 'category_id') required this.categoryId,
      @JsonKey(name: 'store_id') required this.storeId,
      this.liked = 0,
      this.viewer = 0,
      this.sales = 0,
      @JsonKey(name: 'total_sales') this.totalSales = 0});

  factory _$_Product.fromJson(Map<String, dynamic> json) =>
      _$_$_ProductFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'name')
  final String? nameProduct;
  @override
  final String? description;
  @JsonKey(defaultValue: 0)
  @override
  final double price;
  @JsonKey(defaultValue: 1)
  @override
  final int status;
  @override
  final String? picture;
  @override
  final String? category;
  @override
  @JsonKey(name: 'category_id')
  final int categoryId;
  @override
  @JsonKey(name: 'store_id')
  final int storeId;
  @JsonKey(defaultValue: 0)
  @override
  final int liked;
  @JsonKey(defaultValue: 0)
  @override
  final int viewer;
  @JsonKey(defaultValue: 0)
  @override
  final int sales;
  @override
  @JsonKey(name: 'total_sales')
  final int totalSales;

  @override
  String toString() {
    return 'Product(id: $id, nameProduct: $nameProduct, description: $description, price: $price, status: $status, picture: $picture, category: $category, categoryId: $categoryId, storeId: $storeId, liked: $liked, viewer: $viewer, sales: $sales, totalSales: $totalSales)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Product &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.nameProduct, nameProduct) ||
                const DeepCollectionEquality()
                    .equals(other.nameProduct, nameProduct)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.picture, picture) ||
                const DeepCollectionEquality()
                    .equals(other.picture, picture)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.categoryId, categoryId) ||
                const DeepCollectionEquality()
                    .equals(other.categoryId, categoryId)) &&
            (identical(other.storeId, storeId) ||
                const DeepCollectionEquality()
                    .equals(other.storeId, storeId)) &&
            (identical(other.liked, liked) ||
                const DeepCollectionEquality().equals(other.liked, liked)) &&
            (identical(other.viewer, viewer) ||
                const DeepCollectionEquality().equals(other.viewer, viewer)) &&
            (identical(other.sales, sales) ||
                const DeepCollectionEquality().equals(other.sales, sales)) &&
            (identical(other.totalSales, totalSales) ||
                const DeepCollectionEquality()
                    .equals(other.totalSales, totalSales)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(nameProduct) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(picture) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(categoryId) ^
      const DeepCollectionEquality().hash(storeId) ^
      const DeepCollectionEquality().hash(liked) ^
      const DeepCollectionEquality().hash(viewer) ^
      const DeepCollectionEquality().hash(sales) ^
      const DeepCollectionEquality().hash(totalSales);

  @JsonKey(ignore: true)
  @override
  _$ProductCopyWith<_Product> get copyWith =>
      __$ProductCopyWithImpl<_Product>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ProductToJson(this);
  }
}

abstract class _Product implements Product {
  factory _Product(
      {required int id,
      @JsonKey(name: 'name') String? nameProduct,
      String? description,
      double price,
      int status,
      String? picture,
      String? category,
      @JsonKey(name: 'category_id') required int categoryId,
      @JsonKey(name: 'store_id') required int storeId,
      int liked,
      int viewer,
      int sales,
      @JsonKey(name: 'total_sales') int totalSales}) = _$_Product;

  factory _Product.fromJson(Map<String, dynamic> json) = _$_Product.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'name')
  String? get nameProduct => throw _privateConstructorUsedError;
  @override
  String? get description => throw _privateConstructorUsedError;
  @override
  double get price => throw _privateConstructorUsedError;
  @override
  int get status => throw _privateConstructorUsedError;
  @override
  String? get picture => throw _privateConstructorUsedError;
  @override
  String? get category => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'category_id')
  int get categoryId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'store_id')
  int get storeId => throw _privateConstructorUsedError;
  @override
  int get liked => throw _privateConstructorUsedError;
  @override
  int get viewer => throw _privateConstructorUsedError;
  @override
  int get sales => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'total_sales')
  int get totalSales => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ProductCopyWith<_Product> get copyWith =>
      throw _privateConstructorUsedError;
}
