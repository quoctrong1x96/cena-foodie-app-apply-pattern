// A storage service contract [Usage: SharedPreferences]
import '../../models/entities/user/user.dart';

abstract class IStorageService {
  Future<bool> saveCurrentUser(User? user);

  Future<User?> getCurrentUser();

  Future<bool> saveAccessToken(String? accessToken);

  Future<String?> getAccessToken();

  bool isValidToken(User? user);

  Future<bool> clearStorageData();
}
