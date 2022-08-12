import '../../models/entities/address/address.dart';
import '../../models/ui/ui_response.dart';
import '../../services/entities/address_service.dart';
import '../base_repository.dart';

class AddressRepository extends BaseRepository implements IAddressService {
  @override
  Future<UiResponse<Address>> add(
      {required int userId, required Address address}) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response =
        await cenaService.addAddress(userId: userId, address: address);
    return UiResponse.map(response);
  }

  @override
  Future<UiResponse<Address>> byId(
      {required int userId, required int addressId}) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response =
        await cenaService.getAddressById(userId: userId, addressId: addressId);
    return UiResponse.map(response);
  }

  @override
  Future<UiResponse<String>> delete(
      {required int userId, required int addressId}) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response =
        await cenaService.deleteAddress(userId: userId, addressId: addressId);
    return UiResponse.map(response);
  }

  @override
  Future<UiResponse<List<Address>>> fetchAll({required int userId}) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response = await cenaService.fetchAllAddress(userId: userId);
    return UiResponse.map(response);
  }

  @override
  Future<UiResponse<Address>> first({required int userId}) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response = await cenaService.fisrtAddress(userId: userId);
    return UiResponse.map(response);
  }
}
