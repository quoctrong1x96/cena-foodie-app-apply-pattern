import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

import '../../controllers/user_controller.dart';
import '../../helpers/geolocator_util.dart';
import '../../models/response/address_one_response.dart';
import '../../models/response/response_login.dart';
import '../../services/push_notification.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserState()) {
    on<OnGetUserEvent>(_onGetUser);
    on<OnSelectPictureEvent>(_onSelectPicture);
    on<OnClearPicturePathEvent>(_onClearPicturePath);
    on<OnChangeImageProfileEvent>(_onChangePictureProfile);
    on<OnChangeLastNameProfileEvent>(_onChangeLastNameProfile);
    on<OnChangeFirstNameProfileEvent>(_onChangeFirstNameProfile);
    on<OnChangeSexProfileEvent>(_onChangeSexProfile);
    on<OnChangeDateOfBirthProfileEvent>(_onChangeDateOfBirthProfile);
    on<OnChangeWorkProfileEvent>(_onChangeWorkProfile);
    // on<OnChangePhoneNumberProfileEvent>(_onChangePhoneNumberProfile);
    on<OnEditUserEvent>(_onEditProfileUser);
    on<OnChangePasswordEvent>(_onChangePassword);
    on<OnRegisterClientEvent>(_onRegisterClient);
    // on<OnRegisterDeliveryEvent>(_onRegisterDelivery);
    on<OnUpdateDeliveryToClientEvent>(_onUpdateDeliveryToClient);
    on<OnDeleteStreetAddressEvent>(_onDeleteStreetAddress);
    on<OnSelectAddressButtonEvent>(_onSelectAddressButton);
    on<OnAddNewAddressEvent>(_onAddNewStreetAddress);
    on<OnInitialCurrentAddressEvent>(_onInitialCurrentAddress);
  }

  Future<void> _onGetUser(OnGetUserEvent event, Emitter<UserState> emit) async {
    emit(state.copyWith(user: event.user));
  }

  Future<void> _onSelectPicture(
      OnSelectPictureEvent event, Emitter<UserState> emit) async {
    emit(state.copyWith(pictureProfilePath: event.pictureProfilePath));
  }

  Future<void> _onClearPicturePath(
      OnClearPicturePathEvent event, Emitter<UserState> emit) async {
    emit(state.copyWith(pictureProfilePath: ''));
  }

  Future<void> _onChangePictureProfile(
      OnChangeImageProfileEvent event, Emitter<UserState> emit) async {
    try {
      final Address? address = state.address;
      final User? user = state.user;
      final String picture = state.pictureProfilePath;
      emit(LoadingUserState());

      final data =
          await userController.changeImageProfile(event.userId, event.image);

      if (data.resp) {
        // final user = await userController.getUserById();

        emit(SuccessUserState());

        emit(state.copyWith(
            user: user, address: address, pictureProfilePath: picture));
      } else {
        emit(FailureUserState(data.msg));
      }
    } catch (e) {
      emit(FailureUserState(e.toString()));
    }
  }

  Future<void> _onChangeLastNameProfile(
      OnChangeLastNameProfileEvent event, Emitter<UserState> emit) async {
    try {
      final Address? address = state.address;
      final User? user = state.user;
      final String picture = state.pictureProfilePath;
      emit(LoadingUserState());

      final data = await userController.changeLastNameProfile(
          event.userId, event.lastName);

      if (data.resp) {
        state.user!.lastName = event.lastName;

        emit(SuccessUserState());
        emit(state.copyWith(
            user: user!, address: address, pictureProfilePath: picture));
      } else {
        emit(FailureUserState(data.msg));
      }
    } catch (e) {
      emit(FailureUserState(e.toString()));
    }
  }

  Future<void> _onChangeFirstNameProfile(
      OnChangeFirstNameProfileEvent event, Emitter<UserState> emit) async {
    try {
      emit(LoadingUserState());

      final data = await userController.changeFirstNameProfile(
          event.userId, event.firstName);

      if (data.resp) {
        final user = await userController.getUserById(event.userId);

        emit(SuccessUserState());

        emit(state.copyWith(user: user));
      } else {
        emit(FailureUserState(data.msg));
      }
    } catch (e) {
      emit(FailureUserState(e.toString()));
    }
  }

  Future<void> _onChangeSexProfile(
      OnChangeSexProfileEvent event, Emitter<UserState> emit) async {
    try {
      emit(LoadingUserState());

      final data =
          await userController.changeSexProfile(event.userId, event.sex);

      if (data.resp) {
        final user = await userController.getUserById(event.userId);

        emit(SuccessUserState());

        emit(state.copyWith(user: user!));
      } else {
        emit(FailureUserState(data.msg));
      }
    } catch (e) {
      emit(FailureUserState(e.toString()));
    }
  }

  Future<void> _onChangeDateOfBirthProfile(
      OnChangeDateOfBirthProfileEvent event, Emitter<UserState> emit) async {
    try {
      emit(LoadingUserState());

      final data = await userController.changeDateOfBirthProfile(
          event.userId, event.dateOfBirth);

      if (data.resp) {
        final user = await userController.getUserById(event.userId);

        emit(SuccessUserState());

        emit(state.copyWith(user: user!));
      } else {
        emit(FailureUserState(data.msg));
      }
    } catch (e) {
      emit(FailureUserState(e.toString()));
    }
  }

  Future<void> _onChangeWorkProfile(
      OnChangeWorkProfileEvent event, Emitter<UserState> emit) async {
    try {
      emit(LoadingUserState());

      final data = await userController.changeWork(event.userId, event.work);

      if (data.resp) {
        final user = await userController.getUserById(event.userId);

        emit(SuccessUserState());

        emit(state.copyWith(user: user!));
      } else {
        emit(FailureUserState(data.msg));
      }
    } catch (e) {
      emit(FailureUserState(e.toString()));
    }
  }

  // Future<void> _onChangePhoneNumberProfile(
  //     OnChangePhoneNumberProfileEvent event, Emitter<UserState> emit) async {
  //   try {
  //     emit(LoadingUserState());

  //     final data =
  //         await userController.changePhoneNumberProfile(event.phoneNumber);

  //     if (data.resp) {
  //       final user = await userController.getUserById(event.userId);

  //       emit(SuccessUserState());

  //       emit(state.copyWith(user: user!));
  //     } else {
  //       emit(FailureUserState(data.msg));
  //     }
  //   } catch (e) {
  //     emit(FailureUserState(e.toString()));
  //   }
  // }

  Future<void> _onEditProfileUser(
      OnEditUserEvent event, Emitter<UserState> emit) async {
    try {
      emit(LoadingUserState());

      final data = await userController.editProfile(
          event.userId, event.name, event.lastName, event.phone);

      if (data.resp) {
        final user = await userController.getUserById(event.userId);

        emit(SuccessUserState());

        emit(state.copyWith(user: user));
      } else {
        emit(FailureUserState(data.msg));
      }
    } catch (e) {
      emit(FailureUserState(e.toString()));
    }
  }

  Future<void> _onChangePassword(
      OnChangePasswordEvent event, Emitter<UserState> emit) async {
    try {
      emit(LoadingUserState());

      final data = await userController.changePassword(
          event.userId, event.currentPassword, event.newPassword);

      if (data.resp) {
        final user = await userController.getUserById(event.userId);

        emit(SuccessUserState());

        emit(state.copyWith(user: user));
      } else {
        emit(FailureUserState(data.msg));
      }
    } catch (e) {
      emit(FailureUserState(e.toString()));
    }
  }

  Future<void> _onRegisterClient(
      OnRegisterClientEvent event, Emitter<UserState> emit) async {
    try {
      final UserState currentState = state;
      emit(LoadingUserState());

      final validCharacters = RegExp(
          r'[aàảãáạăằẳẵắặâầẩẫấậbcdđeèẻẽéẹêềểễếệfghiìỉĩíịjklmnoòỏõóọôồổỗốộơờởỡớợpqrstuùủũúụưừửữứựvwxyỳỷỹýỵz0-9_]+');
      if (!validCharacters.hasMatch(event.name.replaceAll(" ", ""))) {
        emit(const FailureUserState("FirstName has special character"));
      } else if (!validCharacters
          .hasMatch(event.lastName.replaceAll(" ", ""))) {
        emit(const FailureUserState("LastName has special character"));
      } else if (event.image.isEmpty) {
        emit(const FailureUserState("No avatar images"));
      } else {
        final nToken = await pushNotification.getNotificationToken();

        final data = await userController.registerClient(
            event.name,
            event.lastName,
            event.phone,
            event.image,
            event.email,
            event.password,
            nToken!);

        if (data.resp) {
          emit(SuccessUserState());
          emit(currentState);
        } else {
          emit(FailureUserState(data.msg));
          emit(currentState);
        }
      }
    } catch (e) {
      emit(FailureUserState(e.toString()));
    }
  }

  // Future<void> _onRegisterDelivery(
  //     OnRegisterDeliveryEvent event, Emitter<UserState> emit) async {
  //   try {
  //     emit(LoadingUserState());

  //     final nToken = await pushNotification.getNotificationToken();

  //     final data = await userController.registerDelivery(event.user,
  //         event.name,
  //         event.lastName,
  //         event.phone,
  //         event.email,
  //         event.password,
  //         event.image,
  //         nToken!);

  //     if (data.resp) {
  //       final user = await userController.getUserById();

  //       emit(SuccessUserState());

  //       emit(state.copyWith(user: user));
  //     } else
  //       // ignore: curly_braces_in_flow_control_structures
  //       emit(FailureUserState(data.msg));
  //   } catch (e) {
  //     emit(FailureUserState(e.toString()));
  //   }
  // }

  Future<void> _onUpdateDeliveryToClient(
      OnUpdateDeliveryToClientEvent event, Emitter<UserState> emit) async {
    try {
      emit(LoadingUserState());

      final data = await userController.updateDeliveryToClient(event.idPerson);

      if (data.resp) {
        final user =
            await userController.getUserById(int.parse(event.idPerson));

        emit(SuccessUserState());

        emit(state.copyWith(user: user));
      } else {
        emit(FailureUserState(data.msg));
      }
    } catch (e) {
      emit(FailureUserState(e.toString()));
    }
  }

  Future<void> _onDeleteStreetAddress(
      OnDeleteStreetAddressEvent event, Emitter<UserState> emit) async {
    try {
      emit(LoadingUserState());

      final data = await userController.deleteStreetAddress(
          event.userId, event.addressId);

      if (data.resp) {
        final user = await userController.getUserById(event.userId);

        emit(SuccessUserState());

        emit(state.copyWith(user: user));
      } else {
        emit(FailureUserState(data.msg));
      }
    } catch (e) {
      emit(FailureUserState(e.toString()));
    }
  }

  Future<void> _onSelectAddressButton(
      OnSelectAddressButtonEvent event, Emitter<UserState> emit) async {
    emit(state.copyWith(address: event.address));
  }

  Future<void> _onAddNewStreetAddress(
      OnAddNewAddressEvent event, Emitter<UserState> emit) async {
    try {
      // final Address? address = state.address;
      final User? user = state.user;
      final String picture = state.pictureProfilePath;
      emit(LoadingUserState());

      final data = await userController.addNewAddressLocation(
          event.userId,
          event.typeAddress,
          event.receiver,
          event.phone,
          event.building,
          event.door,
          event.note,
          event.addressDetail,
          event.location.latitude.toString(),
          event.location.longitude.toString());

      if (data.resp) {
        // final user = await userController.getUserById();

        final userDb = await userController.getAddressOne(user!.uid!);

        // add(OnSelectAddressButtonEvent(userDb.address!));

        emit(SuccessUserState());
        emit(state.copyWith(
            user: user, address: userDb.address, pictureProfilePath: picture));
      } else {
        emit(FailureUserState(data.msg));
      }
    } catch (e) {
      emit(FailureUserState(e.toString()));
    }
  }

  Future<void> _onInitialCurrentAddress(
      OnInitialCurrentAddressEvent event, Emitter<UserState> emit) async {
    try {
      // emit(LoadingUserState());

      Address address = await GeolocatorUtil.getCurrentAddress();
      Position location =
          await GeolocatorUtil.getGeoLocationPosition().catchError((error) {
        emit(FailureUserState(error));
      });

      if (address.addressDetail.isNotEmpty) {
        var data = await userController.getAddresses(event.userId);
        var count = 0;
        if (data!.isNotEmpty) {
          for (var item in data) {
            var distance = Geolocator.distanceBetween(
                double.parse(item.latitude!),
                double.parse(item.longitude!),
                location.latitude,
                location.longitude);
            if (distance < 20) {
              count++;
              address.id = item.id!;
              address.receiver = item.receiver!;
              address.phone = item.phone!;
              address.typeAddress = item.type!;
              address.addressDetail = item.addressDetail!;
              address.latitude = item.latitude!;
              address.longitude = item.longitude!;
              break;
            }
          }
        }
        if (count == 0) {
          address.id = -1;
          address.receiver = event.userFullName;
          address.phone = event.phoneNumber;
          address.typeAddress = 1;
        }

        // emit(SuccessUserState());
        emit(state.copyWith(address: address));
      } else {
        emit(const FailureUserState("error"));
      }
    } catch (e) {
      emit(FailureUserState(e.toString()));
    }
  }
}
