import 'package:cenafoodie/src/data/models/ui/ui_response.dart';

import '../../models/entities/address/address.dart';

abstract class IAddressService {
  ///Get All address by User
  Future<UiResponse<List<Address>>> fetchAll({required int userId});

  /// Get address by id
  Future<UiResponse<Address>> byId({
    required int userId,
    required int addressId,
  });

  ///Delete address
  Future<UiResponse<String>> delete({
    required int userId,
    required int addressId,
  });

  /// Add address for user
  Future<UiResponse<Address>> add({required Address address});
}
