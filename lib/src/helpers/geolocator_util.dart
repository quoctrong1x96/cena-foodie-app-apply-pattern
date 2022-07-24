import 'package:cenafoodie/models/response/address_one_response.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class GeolocatorUtil {
  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  static Future<Position> getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();

      return Future.error('Vui lòng bật vị trí để sử dụng chức năng này.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Cena Foodie chưa được phép truy cập vị trí');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Quyền vị trí bị từ chối vĩnh viễn, Cena Foodie không thể yêu cầu quyền.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  static Future<Address> getCurrentAddress() async {
    Position position = await getGeoLocationPosition();
    return await getAddressFromLatLong(position);
  }

  static Future<Address> getAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    //print(placemarks);
    Placemark place = placemarks[0];
    return Address(
        id: -1,
        typeAddress: -1,
        receiver: 'receiver',
        phone: 'phone',
        addressDetail:
            '${place.street}, ${place.subAdministrativeArea}, ${place.administrativeArea}, ${place.isoCountryCode}',
        latitude: position.latitude.toString(),
        longitude: position.longitude.toString(),
        personaId: -1);
  }
}
