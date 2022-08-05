import '../../models/entities/auth/auth_response.dart';
import '../../models/entities/user/user_request.dart';
import '../../models/ui/ui_response.dart';

abstract class IAuthService {
  /// Login with email and password
  Future<UiResponse<AuthResponse>> onEmail(UserRequest? userRequest);

  ///Login with phone number and OTP
  Future<UiResponse<AuthResponse>> onPhone(UserRequest? userRequest);

  ///Check token, get user by token
  Future<UiResponse<AuthResponse>> renewToken();
}
