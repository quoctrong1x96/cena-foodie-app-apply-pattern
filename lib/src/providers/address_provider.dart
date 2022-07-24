// import 'package:cenafoodie/helpers/geolocation_util.dart';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// // import 'package:latlng/latlng.dart';

// class Address {
//   Position? position;
//   String? fullAddress;
//   String? addressType;
//   String? recieveName;
//   String? recievePhoneNumber;
//   String? shortAddress;
//   Address(
//       {this.position,
//       this.fullAddress,
//       this.recieveName,
//       this.shortAddress,
//       this.recievePhoneNumber,
//       this.addressType});

//   factory Address.fromJson(Map<String, dynamic> json) => Address(
//         position: json['position']! as Position,
//         fullAddress: json['fullAddress']!.toString(),
//         recieveName: json['recieveName']!.toString(),
//         shortAddress: json['shortAddress'].toString(),
//         recievePhoneNumber: json['recievePhoneNumber'].toString(),
//         addressType: json['addressType'].toString(),
//       );
// }

// Position defaultPosition = Position(
//     altitude: 10.0,
//     longitude: 11.53678971632868,
//     accuracy: 10.0,
//     speed: 60.0,
//     timestamp: DateTime.now(),
//     latitude: 106.9018058905116,
//     speedAccuracy: 100.0,
//     heading: 1.0);

// class AddressProvider extends ChangeNotifier {
//   static Address _addressPoint = Address();
//   static Position _currentLocation = defaultPosition;
//   static bool _isFindingLoation = true;

//   AddressProvider() {
//     _getUserLocation();
//     _getUserAddress();
//   }

//   void init() {
//     AddressProvider();
//   }

//   Position getCurrentLoction() => _currentLocation;
//   Address getCurrentAddress() => _addressPoint;
//   bool getStateOfProvider() => _isFindingLoation;

//   Future<Position> _getCurrentLoction() async {
//     if (_currentLocation.latitude == defaultPosition.latitude) {
//       await _getUserLocation();
//     }
//     return _currentLocation;
//   }

//   Future<Position> _locateUser() async {
//     return await GeolocatorUtil.getGeoLocationPosition();
//   }

//   Future<void> _getUserLocation() async {
//     _currentLocation = await _locateUser();
//     // _latLng = LatLng(_currentLocation.latitude, _currentLocation.longitude);
//     _isFindingLoation = false;
//     notifyListeners();
//   }

//   Future<void> _getUserAddress() async {
//     Address addressName = await GeolocatorUtil.getCurrentAddress();
//     _addressPoint =
//         Address(position: await _getCurrentLoction(), fullAddress: addressName);
//     _addressPoint.shortAddress = addressName.split(',')[0];
//     _addressPoint.addressType = "home";
//     _isFindingLoation = false;
//     notifyListeners();
//   }

//   /// Mengganti index navigasi halaman utama
//   void changeAddressPoint(Address address) {
//     _isFindingLoation = true;
//     notifyListeners();
//     _addressPoint = address;
//     _isFindingLoation = false;
//     notifyListeners();
//   }
// }
