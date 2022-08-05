import '../../models/entities/auth/auth_response.dart';
import '../../models/entities/user/user_request.dart';
import '../../models/ui/ui_response.dart';
import '../../services/entities/auth_service.dart';
import '../base_repository.dart';

class AuthRepository extends BaseRepository implements IAuthService {
  @override
  Future<UiResponse<AuthResponse>> onEmail(UserRequest? userRequest) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response = await cenaService.loginWithEmail(userRequest);
    return UiResponse.map(response);
  }

  @override
  Future<UiResponse<AuthResponse>> onPhone(UserRequest? userRequest) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response = await cenaService.loginWithPhone(userRequest);
    return UiResponse.map(response);
  }

  @override
  Future<UiResponse<AuthResponse>> renewToken() async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response = await cenaService.renewToken();
    return UiResponse.map(response);
  }
  //
}
