part of 'my_location_map_bloc.dart';

@immutable
abstract class MyLocationMapEvent {}

class OnChangeLocationEvent extends MyLocationMapEvent {
  final LatLng location;

  OnChangeLocationEvent(this.location);
}

class OnMapReadyEvent extends MyLocationMapEvent {}

class OnMoveMapEvent extends MyLocationMapEvent {
  final LatLng location;

  OnMoveMapEvent(this.location);
}

class OnGetAddressLocationEvent extends MyLocationMapEvent {
  final LatLng location;

  OnGetAddressLocationEvent(this.location);
}
