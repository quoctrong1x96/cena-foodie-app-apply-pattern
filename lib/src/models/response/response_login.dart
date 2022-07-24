import 'dart:convert';

import 'package:cenafoodie/models/store/store_model.dart';

ResponseLogin responseLoginFromJson(String str) =>
    ResponseLogin.fromJson(json.decode(str));

String responseLoginToJson(ResponseLogin data) => json.encode(data.toJson());

class ResponseLogin {
  bool resp;
  String msg;
  User? user;
  Store? store;
  String? token;

  ResponseLogin({
    required this.resp,
    required this.msg,
    this.user,
    this.store,
    this.token,
  });

  factory ResponseLogin.dataDefault(int id) {
    switch (id) {
      case -1:
        return ResponseLogin(resp: false, msg: "Lỗi không kết nối được");
      default:
        return ResponseLogin(
            resp: true,
            msg: "Thành công",
            user: User.dataDefault(id),
            token: "Token-login-$id");
    }
  }

  factory ResponseLogin.fromJson(Map<String, dynamic> json) => ResponseLogin(
        resp: json["resp"],
        msg: json["msg"],
        user: User.fromJson(json["data"]["user"] ?? {}),
        store: Store.fromJson(json["data"]["store"] ?? {}),
        token: json["data"]["token"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "resp": resp,
        "msg": msg,
        "user": user!.toJson(),
        "store": store!.toJson(),
        "token": token,
      };
}

class User {
  int? uid;
  String? firstName;
  String? lastName;
  String? image;
  String? email;
  String? phone;
  int? rolId;
  String? notificationToken;
  String? referenceCode;

  User(
      {this.uid,
      this.firstName,
      this.lastName,
      this.phone,
      this.image,
      this.email,
      this.rolId,
      this.referenceCode,
      this.notificationToken});

  factory User.fromJson(Map<String, dynamic> json) => User(
      uid: json["uid"] ?? 0,
      firstName: json["firstName"] ?? '',
      lastName: json["lastName"] ?? '',
      phone: json["phone"] ?? '',
      image: json["image"] ?? '',
      email: json["email"] ?? '',
      rolId: json["rol_id"] ?? 0,
      referenceCode: json["reference_code"] ?? '',
      notificationToken: json["notification_token"] ?? '');

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "firstName": firstName,
        "lastName": lastName,
        "phone": phone,
        "image": image,
        "email": email,
        "rol_id": rolId,
        "reference_code": referenceCode,
        "notification_token": notificationToken
      };

  factory User.dataDefault(int id) {
    switch (id) {
      case 2:
        return User(
            uid: 2,
            email: "cenafoodie@gmail.com",
            firstName: "Cena",
            lastName: "Foodie",
            image: "/Assets/Logo/logo-black.png",
            notificationToken: "Token_01",
            phone: '0999.999.999',
            rolId: 2);
      case 1:
        return User(
            uid: 1,
            email: "cenadeliverye@gmail.com",
            firstName: "Cena",
            lastName: "Delivery",
            image: "/Assets/Logo/logo-black.png",
            notificationToken: "Token_02",
            phone: '0988.888.888',
            rolId: 1);
      case 3:
        return User(
            uid: 3,
            email: "cenastore@gmail.com",
            firstName: "Cena",
            lastName: "Store",
            image: "/Assets/Logo/logo-black.png",
            notificationToken: "Token_03",
            phone: '0977.777.777',
            rolId: 3);
      default:
        return User();
    }
  }
}
