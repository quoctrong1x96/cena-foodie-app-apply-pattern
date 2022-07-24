class Store {
  int? id;
  String? storeName;
  String? address;
  String? latitude;
  String? longitude;
  String? openTime;
  String? closeTime;
  String? distance;
  String? categories;
  String? image;
  int? userId;

  Store(
      {this.id,
      this.storeName,
      this.address,
      this.latitude,
      this.longitude,
      this.openTime,
      this.distance,
      this.closeTime,
      this.categories,
      this.image,
      this.userId});

  factory Store.fromJson(Map<String, dynamic> json) => Store(
      id: json["id"] ?? -1,
      storeName: json["store_name"] ?? '',
      address: json["address"] ?? '',
      latitude: json["latitude"].toString(),
      longitude: json["longitude"].toString(),
      openTime: json["open_time"] ?? '',
      closeTime: json["close_time"] ?? '',
      categories: json["categories"] ?? '',
      distance: json["distance_in_km"] == null
          ? ''
          : json["distance_in_km"].toString(),
      image: json["image"] ?? '',
      userId: json["userId"] ?? -1);

  Map<String, dynamic> toJson() => {
        "uid": id,
        "store_name": storeName,
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
        "open_time": openTime,
        "close_time": closeTime,
        "categories": categories,
        "distance_in_km": distance,
        "image": image,
        "userId": userId
      };
}
