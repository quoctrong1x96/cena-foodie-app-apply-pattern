part of 'helpers.dart';

class CenaConvert {
  static final CenaConvert _singleton = CenaConvert._internal();

  factory CenaConvert() {
    return _singleton;
  }

  CenaConvert._internal();

  Address convertListAddressToAddress(ListAddress listAddress) {
    return Address(
        id: listAddress.id!,
        typeAddress: listAddress.type!,
        receiver: listAddress.receiver!,
        phone: listAddress.phone!,
        addressDetail: listAddress.addressDetail!,
        latitude: listAddress.latitude!,
        longitude: listAddress.longitude!,
        personaId: -1);
  }
}

final cenaConvert = CenaConvert();
