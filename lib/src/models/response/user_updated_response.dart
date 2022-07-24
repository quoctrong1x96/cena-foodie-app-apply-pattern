import 'dart:convert';

UserUpdatedResponse userUpdatedResponseFromJson(String str) =>
    UserUpdatedResponse.fromJson(json.decode(str));

String userUpdatedResponseToJson(UserUpdatedResponse data) =>
    json.encode(data.toJson());

class UserUpdatedResponse {
  bool resp;
  String msg;
  UserUpdated user;

  UserUpdatedResponse({
    required this.resp,
    required this.msg,
    required this.user,
  });

  factory UserUpdatedResponse.dataDefault(String token) {
    return UserUpdatedResponse(
        resp: true, msg: "Thành công", user: UserUpdated.dataDefault(token));
  }

  factory UserUpdatedResponse.fromJson(Map<String, dynamic> json) =>
      UserUpdatedResponse(
        resp: json["resp"],
        msg: json["msg"],
        user: UserUpdated.fromJson(json["data"]["user"]),
      );

  Map<String, dynamic> toJson() => {
        "resp": resp,
        "msg": msg,
        "user": user.toJson(),
      };
}

class UserUpdated {
  String firstName;
  String lastName;
  String image;
  String email;
  int rolId;
  String? address;
  String? reference;

  UserUpdated(
      {required this.firstName,
      required this.lastName,
      required this.image,
      required this.email,
      required this.rolId,
      this.address,
      this.reference});

  factory UserUpdated.dataDefault(String token) {
    switch (token) {
      case "Token-login-2":
        return UserUpdated(
            email: "cenafoodie@gmail.com",
            firstName: "Cena",
            lastName: "Foodie",
            image: "/Assets/Logo/logo-black.png",
            reference: "Foodie",
            address: "Địa chỉ Foodie",
            rolId: 2);
      case 'Token-login-1':
        return UserUpdated(
            email: "cenadeliverye@gmail.com",
            firstName: "Cena",
            lastName: "Delivery",
            image: "/Assets/Logo/logo-black.png",
            rolId: 1,
            reference: "Delivery",
            address: "Địa chỉ Delivery");
      case "Token-login-3":
        return UserUpdated(
            email: "cenastore@gmail.com",
            firstName: "Cena",
            lastName: "Store",
            image: "/Assets/Logo/logo-black.png",
            rolId: 3,
            reference: "Store",
            address: "Địa chỉ Store");
      default:
        return UserUpdated(
            email: "cenafoodie@gmail.com",
            firstName: "Cena",
            lastName: "Foodie",
            image: "/Assets/Logo/logo-black.png",
            reference: "Foodie",
            address: "Địa chỉ Foodie",
            rolId: 2);
    }
  }

  factory UserUpdated.fromJson(Map<String, dynamic> json) => UserUpdated(
      firstName: json["firstName"],
      lastName: json["lastName"],
      image: json["image"],
      email: json["email"],
      rolId: json["rol_id"],
      address: json["address"],
      reference: json["reference"]);

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "image": image,
        "email": email,
        "rol_id": rolId,
        "address": address,
        "reference": reference
      };
}
