part of 'my_location_map_bloc.dart';

@immutable
class MyLocationMapState {
  final bool existsLocation;
  final LatLng? location;
  final bool mapReady;
  final LatLng? locationCentral;
  final String addressName;

  const MyLocationMapState(
      {this.existsLocation = false,
      this.location,
      this.mapReady = false,
      this.locationCentral,
      this.addressName = ''});

  MyLocationMapState copyWith(
          {bool? existsLocation,
          LatLng? location,
          bool? mapReady,
          LatLng? locationCentral,
          String? addressName}) =>
      MyLocationMapState(
          existsLocation: existsLocation ?? this.existsLocation,
          location: location ?? this.location,
          mapReady: mapReady ?? this.mapReady,
          locationCentral: locationCentral ?? this.locationCentral,
          addressName: addressName ?? this.addressName);
}

class LoadingMyLocationState extends MyLocationMapState {}

class SuccessMyLocationState extends MyLocationMapState {}

class FailureMyLocationState extends MyLocationMapState {
  final String error;

  const FailureMyLocationState(this.error);
}
