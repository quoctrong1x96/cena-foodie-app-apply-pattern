import 'package:cenafoodie/src/data/models/ui/ui_response.dart';

import 'package:cenafoodie/src/data/models/entities/user/user.dart';

import '../../services/entities/user_service.dart';
import '../base_repository.dart';

class UserRepository extends BaseRepository implements IUserService {
  @override
  Future<UiResponse<User>> byId({required int userID}) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response = await cenaService.getUserById(userID: userID);
    return UiResponse.map(response);
  }

  @override
  Future<UiResponse<String>> changeDateOfBirth(
      {required int userId, required DateTime dateOfBirth}) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response = await cenaService.changeUserDateOfBirth(
        userId: userId, dateOfBirth: dateOfBirth);
    return UiResponse.map(response);
  }

  @override
  Future<UiResponse<String>> changeFirstName(
      {required int userId, required String firstName}) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response = await cenaService.changeUserFirstName(
        userId: userId, firstName: firstName);
    return UiResponse.map(response);
  }

  @override
  Future<UiResponse<String>> changeImage(
      {required int userId, required String imageUrl}) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response =
        await cenaService.changeUserImage(userId: userId, imageUrl: imageUrl);
    return UiResponse.map(response);
  }

  @override
  Future<UiResponse<String>> changeLastName(
      {required int userId, required String lastName}) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response = await cenaService.changeUserLastName(
        userId: userId, lastName: lastName);
    return UiResponse.map(response);
  }

  @override
  Future<UiResponse<String>> changePassword(
      {required int userId,
      required String oldPassword,
      required newPassword}) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response = await cenaService.changeUserPassword(
        userId: userId, oldPassword: oldPassword, newPassword: newPassword);
    return UiResponse.map(response);
  }

  @override
  Future<UiResponse<String>> changeProfile({required User user}) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response = await cenaService.changeUserProfile(user: user);
    return UiResponse.map(response);
  }

  @override
  Future<UiResponse<String>> changeSex(
      {required int userId, required String sexType}) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response =
        await cenaService.changeUserSex(userId: userId, sexType: sexType);
    return UiResponse.map(response);
  }

  @override
  Future<UiResponse<String>> changeWork(
      {required int userId, required String work}) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response =
        await cenaService.changeUserWork(userId: userId, work: work);
    return UiResponse.map(response);
  }

  @override
  Future<UiResponse<String>> enterReferenceCode(
      {required int userId, required String code}) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response =
        await cenaService.enterReferenceCodeOfUser(userId: userId, code: code);
    return UiResponse.map(response);
  }

  @override
  Future<UiResponse<User>> register(
      {required User user, required String password}) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response =
        await cenaService.registerUser(user: user, password: password);
    return UiResponse.map(response);
  }

  @override
  Future<UiResponse<String>> updateNotifyToken(
      {required int userId, required String notifyToken}) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response = await cenaService.updateUserNotifyToken(
        userId: userId, notifyToken: notifyToken);
    return UiResponse.map(response);
  }
}
