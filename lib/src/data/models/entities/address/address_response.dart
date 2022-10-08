import '../../base_model.dart';
import 'address.dart';

class AddressFetchResponse implements IModel {
  List<Address> addresses;

  AddressFetchResponse({required this.addresses});

  factory AddressFetchResponse.fromJson(Map<String, dynamic> json) =>
      AddressFetchResponse(
        addresses: List<Address>.from(
            json['addresses'].map((x) => Address.fromJson(x))),
      );

  @override
  Map<String, dynamic> toJson() => {
        "addresses": List<dynamic>.from(addresses.map((x) => x.toJson())),
      };
}
