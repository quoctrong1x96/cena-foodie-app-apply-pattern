import 'dart:convert';

import 'discount_model.dart';

class VoucherModel {
  int? id;
  String? name;
  String? description;
  DateTime? startDate;
  DateTime? endDate;
  VoucherTypeModel? voucherType;
  DiscountModel? discount;
  String? imagePanner;
  String? imageAvatar;
  VoucherModel({
    this.id,
    this.name,
    this.description,
    this.startDate,
    this.endDate,
    this.voucherType,
    this.discount,
    this.imagePanner,
    this.imageAvatar,
  });

  VoucherModel copyWith({
    int? id,
    String? name,
    String? description,
    DateTime? startDate,
    DateTime? endDate,
    VoucherTypeModel? voucherType,
    DiscountModel? discount,
    String? imagePanner,
    String? imageAvatar,
  }) {
    return VoucherModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      voucherType: voucherType ?? this.voucherType,
      discount: discount ?? this.discount,
      imagePanner: imagePanner ?? this.imagePanner,
      imageAvatar: imageAvatar ?? this.imageAvatar,
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
    if (description != null) {
      result.addAll({'description': description});
    }
    if (startDate != null) {
      result.addAll({'startDate': startDate!.millisecondsSinceEpoch});
    }
    if (endDate != null) {
      result.addAll({'endDate': endDate!.millisecondsSinceEpoch});
    }
    if (voucherType != null) {
      result.addAll({'voucherType': voucherType!.toMap()});
    }
    if (discount != null) {
      result.addAll({'discount': discount!.toMap()});
    }
    if (imagePanner != null) {
      result.addAll({'imagePanner': imagePanner});
    }
    if (imageAvatar != null) {
      result.addAll({'imageAvatar': imageAvatar});
    }

    return result;
  }

  factory VoucherModel.fromMap(Map<String, dynamic> map) {
    return VoucherModel(
      id: map['id']?.toInt(),
      name: map['name'],
      description: map['description'],
      startDate: map['startDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['startDate'])
          : null,
      endDate: map['endDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['endDate'])
          : null,
      voucherType: map['voucherType'] != null
          ? VoucherTypeModel.fromMap(map['voucherType'])
          : null,
      discount: map['discount'] != null
          ? DiscountModel.fromMap(map['discount'])
          : null,
      imagePanner: map['imagePanner'],
      imageAvatar: map['imageAvatar'],
    );
  }

  String toJson() => json.encode(toMap());

  factory VoucherModel.fromJson(String source) =>
      VoucherModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'VoucherModel(id: $id, name: $name, description: $description, startDate: $startDate, endDate: $endDate, voucherType: $voucherType, discount: $discount, imagePanner: $imagePanner, imageAvatar: $imageAvatar)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VoucherModel &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.voucherType == voucherType &&
        other.discount == discount &&
        other.imagePanner == imagePanner &&
        other.imageAvatar == imageAvatar;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        startDate.hashCode ^
        endDate.hashCode ^
        voucherType.hashCode ^
        discount.hashCode ^
        imagePanner.hashCode ^
        imageAvatar.hashCode;
  }
}

class VoucherTypeModel {
  int? id;
  String? name;
  VoucherTypeModel({
    this.id,
    this.name,
  });

  VoucherTypeModel copyWith({
    int? id,
    String? name,
  }) {
    return VoucherTypeModel(
      id: id ?? this.id,
      name: name ?? this.name,
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

    return result;
  }

  factory VoucherTypeModel.fromMap(Map<String, dynamic> map) {
    return VoucherTypeModel(
      id: map['id']?.toInt(),
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory VoucherTypeModel.fromJson(String source) =>
      VoucherTypeModel.fromMap(json.decode(source));

  @override
  String toString() => 'VoucherTypeModel(id: $id, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VoucherTypeModel && other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
