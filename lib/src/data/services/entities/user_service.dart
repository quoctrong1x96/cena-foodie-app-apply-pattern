import 'package:cenafoodie/src/data/models/ui/ui_response.dart';

import '../../models/entities/user/user.dart';

abstract class IUserService {
  ///Get user by id
  Future<UiResponse<User>> byId({required int userID});

  ///Change all profiles
  Future<UiResponse<String>> changeProfile({required User user});

  ///Change Password
  Future<UiResponse<String>> changePassword({
    required int userId,
    required String oldPassword,
    required newPassword,
  });

  ///Change profile image
  Future<UiResponse<String>> changeImage({
    required int userId,
    required String imageUrl,
  });

  /// Change last name
  Future<UiResponse<String>> changeLastName({
    required int userId,
    required String lastName,
  });

  /// Change first name
  Future<UiResponse<String>> changeFirstName({
    required int userId,
    required String lastName,
  });

  /// Change sex
  Future<UiResponse<String>> changeSex({
    required int userId,
    required String sexType,
  });

  /// Change first name
  Future<UiResponse<String>> changeDateOfBirth({
    required int userId,
    required DateTime dateOfBirth,
  });

  /// Change work
  Future<UiResponse<String>> changeWork({
    required int userId,
    required String work,
  });

  /// Register new user
  Future<UiResponse<User>> register({
    required User user,
    required String password,
  });

  //Update notification token
  Future<UiResponse<String>> updateNotifyToken({
    required User user,
    required String password,
  });

  ///Enter reference code
  Future<UiResponse<String>> enterReferenceCode({
    required User user,
    required String code,
  });
}