import '../../models/entities/user/user.dart';
import '../../models/entities/user/user_request.dart';
import '../../models/ui/ui_response.dart';

abstract class IAuthService {
  /// Login with email and password
  Future<UiResponse<User>> onEmail(UserRequest? userRequest);

  ///Login with phone number and OTP
  Future<UiResponse<User>> onPhone(UserRequest? userRequest);

  ///Check token, get user by token
  Future<UiResponse<User>> renewToken(UserRequest? userRequest);
}
