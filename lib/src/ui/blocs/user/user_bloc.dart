import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

import '../../../data/app_locator.dart';
import '../../../data/models/entities/address/address.dart';
import '../../../data/models/entities/address/receiver.dart';
import '../../../data/models/entities/user/user.dart';
import '../../../data/services/entities/address_service.dart';
import '../../../data/services/entities/user_service.dart';
import '../../../data/services/google/push_notification.dart';
import '../../../data/services/local/storage_service.dart';
import '../../../helpers/geolocator_util.dart';
import '../../../services/push_notification.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final _userService = locator<IUserService>();
  final _addressService = locator<IAddressService>();

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

      final uiResponse = await _userService.changeImage(
        userId: event.userId,
        imageUrl: event.image,
      );

      if (!uiResponse.hasError) {
        emit(SuccessUserState());

        emit(state.copyWith(
            user: user, address: address, pictureProfilePath: picture));
      } else {
        emit(FailureUserState(uiResponse.errorMessage!));
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

      final uiResponse = await _userService.changeLastName(
          userId: event.userId, lastName: event.lastName);

      if (!uiResponse.hasError) {
        state.user!.copyWith(lastName: event.lastName);

        emit(SuccessUserState());
        emit(state.copyWith(
            user: user!, address: address, pictureProfilePath: picture));
      } else {
        emit(FailureUserState(uiResponse.errorMessage!));
      }
    } catch (e) {
      emit(FailureUserState(e.toString()));
    }
  }

  Future<void> _onChangeFirstNameProfile(
      OnChangeFirstNameProfileEvent event, Emitter<UserState> emit) async {
    try {
      emit(LoadingUserState());

      final uiResponse = await _userService.changeFirstName(
          userId: event.userId, lastName: event.firstName);

      if (!uiResponse.hasError) {
        final data = await _userService.byId(userID: event.userId);

        emit(SuccessUserState());

        emit(state.copyWith(user: data.data));
      } else {
        emit(FailureUserState(uiResponse.errorMessage!));
      }
    } catch (e) {
      emit(FailureUserState(e.toString()));
    }
  }

  Future<void> _onChangeSexProfile(
      OnChangeSexProfileEvent event, Emitter<UserState> emit) async {
    try {
      emit(LoadingUserState());

      final uiResponse = await _userService.changeSex(
          userId: event.userId, sexType: event.sex);

      if (!uiResponse.hasError) {
        final data = await _userService.byId(userID: event.userId);

        emit(SuccessUserState());

        emit(state.copyWith(user: data.data!));
      } else {
        emit(FailureUserState(uiResponse.errorMessage!));
      }
    } catch (e) {
      emit(FailureUserState(e.toString()));
    }
  }

  Future<void> _onChangeDateOfBirthProfile(
      OnChangeDateOfBirthProfileEvent event, Emitter<UserState> emit) async {
    try {
      emit(LoadingUserState());

      final uiResponse = await _userService.changeDateOfBirth(
          userId: event.userId, dateOfBirth: event.dateOfBirth);

      if (!uiResponse.hasError) {
        final user = await _userService.byId(userID: event.userId);

        emit(SuccessUserState());

        emit(state.copyWith(user: user.data!));
      } else {
        emit(FailureUserState(uiResponse.errorMessage!));
      }
    } catch (e) {
      emit(FailureUserState(e.toString()));
    }
  }

  Future<void> _onChangeWorkProfile(
      OnChangeWorkProfileEvent event, Emitter<UserState> emit) async {
    try {
      emit(LoadingUserState());

      final uiResponse =
          await _userService.changeWork(userId: event.userId, work: event.work);

      if (!uiResponse.hasError) {
        final user = await _userService.byId(userID: event.userId);

        emit(SuccessUserState());

        emit(state.copyWith(user: user.data));
      } else {
        emit(FailureUserState(uiResponse.errorMessage!));
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
  //         await _userService.changePhoneNumberProfile(event.phoneNumber);

  //     if (data.resp) {
  //       final user = await _userService.getUserById(event.userId);

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

      final uiResponse = await _userService.changeProfile(
          user: User(
              id: event.userId,
              firstName: event.name,
              lastName: event.lastName,
              email: "",
              image: "",
              notificationToken: "",
              phone: event.phone));

      if (!uiResponse.hasError) {
        final user = await _userService.byId(userID: event.userId);

        emit(SuccessUserState());

        emit(state.copyWith(user: user.data));
      } else {
        emit(FailureUserState(uiResponse.errorMessage!));
      }
    } catch (e) {
      emit(FailureUserState(e.toString()));
    }
  }

  Future<void> _onChangePassword(
      OnChangePasswordEvent event, Emitter<UserState> emit) async {
    try {
      emit(LoadingUserState());

      final uiResponse = await _userService.changePassword(
          userId: event.userId,
          oldPassword: event.currentPassword,
          newPassword: event.newPassword);

      if (!uiResponse.hasError) {
        final user = await _userService.byId(userID: event.userId);

        emit(SuccessUserState());

        emit(state.copyWith(user: user.data));
      } else {
        emit(FailureUserState(uiResponse.errorMessage!));
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

        final uiResponse = await _userService.register(
          user: User(
              id: 0,
              firstName: event.name,
              lastName: event.lastName,
              image: event.image,
              email: event.email,
              phone: event.phone,
              notificationToken: nToken!),
          password: event.password,
        );

        if (!uiResponse.hasError) {
          emit(SuccessUserState());
          emit(currentState);
        } else {
          emit(FailureUserState(uiResponse.errorMessage!));
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

  //     final data = await _userService.registerDelivery(event.user,
  //         event.name,
  //         event.lastName,
  //         event.phone,
  //         event.email,
  //         event.password,
  //         event.image,
  //         nToken!);

  //     if (data.resp) {
  //       final user = await _userService.getUserById();

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
    // try {
    //   emit(LoadingUserState());

    //   final data = await _userService.(event.idPerson);

    //   if (data.resp) {
    //     final user = await _userService.getUserById(int.parse(event.idPerson));

    //     emit(SuccessUserState());

    //     emit(state.copyWith(user: user));
    //   } else {
    //     emit(FailureUserState(data.msg));
    //   }
    // } catch (e) {
    //   emit(FailureUserState(e.toString()));
    // }
  }

  Future<void> _onDeleteStreetAddress(
      OnDeleteStreetAddressEvent event, Emitter<UserState> emit) async {
    try {
      emit(LoadingUserState());

      final uiResponse = await _addressService.delete(
          userId: event.userId, addressId: event.addressId);

      if (!uiResponse.hasError) {
        final user = await _userService.byId(userID: event.userId);

        emit(SuccessUserState());

        emit(state.copyWith(user: user.data));
      } else {
        emit(FailureUserState(uiResponse.errorMessage!));
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

      final uiResponse = await _addressService.add(
          userId: event.userId,
          address: Address(
            id: 0,
            detail: event.addressDetail,
            door: event.door,
            latitude: event.location.latitude.toString(),
            longitude: event.location.longitude.toString(),
            type: event.typeAddress,
            receiver: Receiver(
              isFemale: false,
              name: event.receiver,
              phoneNumber: event.phone,
            ),
            note: event.note,
          ));

      if (!uiResponse.hasError) {
        // final user = await _userService.getUserById();

        final userDb = await _addressService.first(userId: event.userId);

        // add(OnSelectAddressButtonEvent(userDb.address!));

        emit(SuccessUserState());
        emit(state.copyWith(
            user: user, address: userDb.data, pictureProfilePath: picture));
      } else {
        emit(FailureUserState(uiResponse.errorMessage!));
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
        var data = await _userService.getAddresses(event.userId);
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
