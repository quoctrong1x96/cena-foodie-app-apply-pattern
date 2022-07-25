import '../../models/entities/user/user.dart';
import '../../models/entities/user/user_request.dart';
import '../../models/ui/ui_response.dart';
import '../../services/entities/auth_service.dart';
import '../base_repository.dart';

class AuthRepository extends BaseRepository implements IAuthService {
  @override
  Future<UiResponse<User>> onEmail(UserRequest? userRequest) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response = await cenaService.loginWithEmail(userRequest);
    return UiResponse.map(response);
  }

  @override
  Future<UiResponse<User>> onPhone(UserRequest? userRequest) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response = await cenaService.loginWithPhone(userRequest);
    return UiResponse.map(response);
  }

  @override
  Future<UiResponse<User>> renewToken(UserRequest? userRequest) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response = await cenaService.renewToken(userRequest);
    return UiResponse.map(response);
  }
  //
}
