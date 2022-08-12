part of 'map_client_bloc.dart';

@immutable
abstract class MapClientEvent {}

class OnReadyMapClientEvent extends MapClientEvent {}

class OnMarkerClientEvent extends MapClientEvent {
  final LatLng delivery;
  final LatLng client;

  OnMarkerClientEvent(this.delivery, this.client);
}

class OnPositionDeliveryEvent extends MapClientEvent {
  final LatLng location;

  OnPositionDeliveryEvent(this.location);
}
