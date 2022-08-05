part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class OnGetUserEvent extends UserEvent {
  final User user;

  OnGetUserEvent(this.user);
}

class OnSelectPictureEvent extends UserEvent {
  final String pictureProfilePath;

  OnSelectPictureEvent(this.pictureProfilePath);
}

class OnClearPicturePathEvent extends UserEvent {}

class OnChangeImageProfileEvent extends UserEvent {
  final String image;
  final int userId;
  OnChangeImageProfileEvent(this.userId, this.image);
}

class OnChangeLastNameProfileEvent extends UserEvent {
  final String lastName;
  final int userId;

  OnChangeLastNameProfileEvent(this.userId, this.lastName);
}

class OnChangeFirstNameProfileEvent extends UserEvent {
  final int userId;
  final String firstName;

  OnChangeFirstNameProfileEvent(this.userId, this.firstName);
}

class OnChangeSexProfileEvent extends UserEvent {
  final String sex;
  final int userId;

  OnChangeSexProfileEvent(this.sex, this.userId);
}

class OnChangeDateOfBirthProfileEvent extends UserEvent {
  final DateTime dateOfBirth;
  final int userId;

  OnChangeDateOfBirthProfileEvent(this.dateOfBirth, this.userId);
}

class OnChangeWorkProfileEvent extends UserEvent {
  final String work;
  final int userId;

  OnChangeWorkProfileEvent(this.work, this.userId);
}

class OnChangePhoneNumberProfileEvent extends UserEvent {
  final String phoneNumber;
  final int userId;
  OnChangePhoneNumberProfileEvent(this.phoneNumber, this.userId);
}

class OnEditUserEvent extends UserEvent {
  final String name;
  final String lastName;
  final String phone;
  final int userId;

  OnEditUserEvent(this.name, this.lastName, this.phone, this.userId);
}

class OnChangePasswordEvent extends UserEvent {
  final String currentPassword;
  final String newPassword;
  final int userId;

  OnChangePasswordEvent(this.userId, this.currentPassword, this.newPassword);
}

class OnRegisterDeliveryEvent extends UserEvent {
  final String name;
  final String lastName;
  final String phone;
  final String email;
  final String password;
  final String image;

  OnRegisterDeliveryEvent(this.name, this.lastName, this.phone, this.email,
      this.password, this.image);
}

class OnRegisterClientEvent extends UserEvent {
  final String name;
  final String lastName;
  final String phone;
  final String email;
  final String password;
  final String image;

  OnRegisterClientEvent(this.name, this.lastName, this.phone, this.email,
      this.password, this.image);
}

class OnDeleteStreetAddressEvent extends UserEvent {
  final int addressId;
  final int userId;

  OnDeleteStreetAddressEvent(this.userId, this.addressId);
}

class OnInitialCurrentAddressEvent extends UserEvent {
  final String userFullName;
  final String phoneNumber;
  final int userId;
  OnInitialCurrentAddressEvent(
      this.userId, this.userFullName, this.phoneNumber);
}

class OnAddNewAddressEvent extends UserEvent {
  final int userId;
  final String typeAddress;
  final String receiver;
  final String phone;
  final String building;
  final String door;
  final String note;
  final String addressDetail;
  final LatLng location;

  OnAddNewAddressEvent(this.userId, this.typeAddress, this.receiver, this.phone,
      this.building, this.door, this.note, this.addressDetail, this.location);
}

class OnSelectAddressButtonEvent extends UserEvent {
  final Address address;

  OnSelectAddressButtonEvent(this.address);
}

class OnUpdateDeliveryToClientEvent extends UserEvent {
  final String idPerson;

  OnUpdateDeliveryToClientEvent(this.idPerson);
}
