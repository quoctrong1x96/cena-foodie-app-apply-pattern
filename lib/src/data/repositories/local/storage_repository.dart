import '../../models/entities/user/user.dart';
import '../../services/local/storage_service.dart';
import 'storage_client.dart';

// A concrete implementation to storage service contract
class StorageRepository implements IStorageService {
  @override
  Future<bool> saveCurrentUser(User? user) {
    return StorageClient.instance.saveUser(user);
  }

  @override
  Future<User?> getCurrentUser() {
    return StorageClient.instance.getUser();
  }

  @override
  Future<bool> saveAccessToken(String? accessToken) {
    return StorageClient.instance.saveAccessToken(accessToken);
  }

  @override
  Future<String?> getAccessToken() async {
    return StorageClient.instance.getAccessToken();
  }

  @override
  bool isValidToken(User? user) {
    // bool hasToken = user?.token?.isNotEmpty ?? false;
    // bool isValid = user?.tokenExpiryDate.isAfter(DateTime.now()) ?? false;
    // return hasToken && isValid;
    return true; //* TODO for token of user
  }

  @override
  Future<bool> clearStorageData() {
    return StorageClient.instance.clear();
  }
}
