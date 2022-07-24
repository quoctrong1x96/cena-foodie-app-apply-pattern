part of 'map_delivery_bloc.dart';

@immutable
abstract class MapDeliveryEvent {}

class OnMapReadyEvent extends MapDeliveryEvent {}

class OnMarkerDeliveryEvent extends MapDeliveryEvent {
  final LatLng location;
  final LatLng destination;

  OnMarkerDeliveryEvent(this.location, this.destination);
}

class OnMarkRouteDeliveryEvent extends MapDeliveryEvent {}

class OnEmitLocationDeliveryEvent extends MapDeliveryEvent {
  final String idOrder;
  final LatLng location;

  OnEmitLocationDeliveryEvent(this.idOrder, this.location);
}
