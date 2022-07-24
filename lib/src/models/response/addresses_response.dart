import 'dart:convert';

AddressesResponse addressesResponseFromJson(String str) =>
    AddressesResponse.fromJson(json.decode(str));

String addressesResponseToJson(AddressesResponse data) =>
    json.encode(data.toJson());

class AddressesResponse {
  bool resp;
  String msg;
  List<ListAddress>? listAddresses;

  AddressesResponse({
    required this.resp,
    required this.msg,
    this.listAddresses,
  });

  factory AddressesResponse.dataDefault() {
    List<ListAddress>? listAddressesDefault = [];
    // listAddressesDefault.add(ListAddress.dataDefault(1));
    // listAddressesDefault.add(ListAddress.dataDefault(2));
    return AddressesResponse(
        resp: true, msg: "Thành công", listAddresses: listAddressesDefault);
  }

  factory AddressesResponse.fromJson(Map<String, dynamic> json) =>
      AddressesResponse(
        resp: json["resp"],
        msg: json["msg"],
        listAddresses: List<ListAddress>.from(
            json["data"]["listAddresses"].map((x) => ListAddress.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "resp": resp,
        "msg": msg,
        "listAddresses":
            List<dynamic>.from(listAddresses!.map((x) => x.toJson())),
      };
}

class ListAddress {
  int? id;
  String? addressDetail;
  String? receiver;
  String? phone;
  int? type;
  String? latitude;
  String? longitude;

  ListAddress(
      {this.id,
      this.addressDetail,
      this.receiver,
      this.type,
      this.phone,
      this.latitude,
      this.longitude});

  factory ListAddress.fromJson(Map<String, dynamic> json) => ListAddress(
      id: json["id"],
      type: json["typeid"],
      addressDetail: json["address"],
      receiver: json["receiver"],
      phone: json["phone"],
      latitude: json["Latitude"],
      longitude: json["Longitude"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "typeid": type,
        "address": addressDetail,
        "receiver": receiver,
        "phone": phone,
        "latitude": latitude,
        "longitude": longitude
      };
}
