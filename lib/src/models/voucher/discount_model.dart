import 'dart:convert';

class DiscountModel {
  int? id;
  int? minOrders;
  int? usedTime;
  int? valueDiscount;
  int? maxDiscount;
  DiscountTypeModel? discountType;
  DiscountModel({
    this.id,
    this.minOrders,
    this.usedTime,
    this.valueDiscount,
    this.maxDiscount,
    this.discountType,
  });

  DiscountModel copyWith({
    int? id,
    int? minOrders,
    int? usedTime,
    int? valueDiscount,
    int? maxDiscount,
    DiscountTypeModel? discountType,
  }) {
    return DiscountModel(
      id: id ?? this.id,
      minOrders: minOrders ?? this.minOrders,
      usedTime: usedTime ?? this.usedTime,
      valueDiscount: valueDiscount ?? this.valueDiscount,
      maxDiscount: maxDiscount ?? this.maxDiscount,
      discountType: discountType ?? this.discountType,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (minOrders != null) {
      result.addAll({'min_orders': minOrders});
    }
    if (usedTime != null) {
      result.addAll({'used_time': usedTime});
    }
    if (valueDiscount != null) {
      result.addAll({'value_discount': valueDiscount});
    }
    if (maxDiscount != null) {
      result.addAll({'max_discount': maxDiscount});
    }
    if (discountType != null) {
      result.addAll({'discount_type': discountType!.toMap()});
    }

    return result;
  }

  factory DiscountModel.fromMap(Map<String, dynamic> map) {
    return DiscountModel(
      id: map['id']?.toInt(),
      minOrders: map['min_orders']?.toInt(),
      usedTime: map['used_time']?.toInt(),
      valueDiscount: map['value_discount']?.toInt(),
      maxDiscount: map['max_discount']?.toInt(),
      discountType: map['discount_type'] != null
          ? DiscountTypeModel.fromMap(map['discount_type'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DiscountModel.fromJson(String source) =>
      DiscountModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DiscountModel(id: $id, minOrders: $minOrders, usedTime: $usedTime, valueDiscount: $valueDiscount, maxDiscount: $maxDiscount, discountType: $discountType)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DiscountModel &&
        other.id == id &&
        other.minOrders == minOrders &&
        other.usedTime == usedTime &&
        other.valueDiscount == valueDiscount &&
        other.maxDiscount == maxDiscount &&
        other.discountType == discountType;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        minOrders.hashCode ^
        usedTime.hashCode ^
        valueDiscount.hashCode ^
        maxDiscount.hashCode ^
        discountType.hashCode;
  }
}

class DiscountTypeModel {
  int? id;
  String? name;
  String? unit;
  String? math;
  DiscountTypeModel({
    this.id,
    this.name,
    this.unit,
    this.math,
  });

  DiscountTypeModel copyWith({
    int? id,
    String? name,
    String? unit,
    String? math,
  }) {
    return DiscountTypeModel(
      id: id ?? this.id,
      name: name ?? this.name,
      unit: unit ?? this.unit,
      math: math ?? this.math,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (name != null) {
      result.addAll({'name': name});
    }
    if (unit != null) {
      result.addAll({'unit': unit});
    }
    if (math != null) {
      result.addAll({'math': math});
    }

    return result;
  }

  factory DiscountTypeModel.fromMap(Map<String, dynamic> map) {
    return DiscountTypeModel(
      id: map['id']?.toInt(),
      name: map['name'],
      unit: map['unit'],
      math: map['math'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DiscountTypeModel.fromJson(String source) =>
      DiscountTypeModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DiscountTypeModel(id: $id, name: $name, unit: $unit, math: $math)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DiscountTypeModel &&
        other.id == id &&
        other.name == name &&
        other.unit == unit &&
        other.math == math;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ unit.hashCode ^ math.hashCode;
  }
}
