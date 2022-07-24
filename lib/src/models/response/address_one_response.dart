import 'dart:convert';

AddressOneResponse addressOneResponseFromJson(String str) =>
    AddressOneResponse.fromJson(json.decode(str));

String addressOneResponseToJson(AddressOneResponse data) =>
    json.encode(data.toJson());

class AddressOneResponse {
  bool resp;
  String msg;
  Address? address;

  AddressOneResponse({
    required this.resp,
    required this.msg,
    this.address,
  });

  factory AddressOneResponse.fromJson(Map<String, dynamic> json) =>
      AddressOneResponse(
        resp: json["resp"],
        msg: json["msg"],
        address: Address.fromJson(json['data']["address"]),
      );

  Map<String, dynamic> toJson() => {
        "resp": resp,
        "msg": msg,
        "address": address!.toJson(),
      };
}

class Address {
  int id;
  int typeAddress;
  String receiver;
  String phone;
  String? building;
  String? door;
  String? note;
  String addressDetail;
  String latitude;
  String longitude;
  int personaId;

  Address({
    required this.id,
    required this.typeAddress,
    required this.receiver,
    required this.phone,
    this.building,
    this.door,
    this.note,
    required this.addressDetail,
    required this.latitude,
    required this.longitude,
    required this.personaId,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        typeAddress: json["type_address"],
        receiver: json["receiver"],
        phone: json["phone"],
        building: json["building"],
        door: json["door"],
        note: json["note"],
        addressDetail: json["address"],
        latitude: json["Latitude"],
        longitude: json["Longitude"],
        personaId: json["persona_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type_address": typeAddress,
        "receiver": receiver,
        "phone": phone,
        "building": building,
        "phdoorone": door,
        "note": note,
        "address": addressDetail,
        "Latitude": latitude,
        "Longitude": longitude,
        "persona_id": personaId,
      };
}
