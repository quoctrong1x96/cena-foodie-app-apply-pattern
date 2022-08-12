part of 'map_delivery_bloc.dart';

@immutable
class MapDeliveryState {
  final bool isReadyMapDelivery;

  final Map<String, Marker> markers;
  final Map<String, Polyline>? polyline;

  MapDeliveryState(
      {this.isReadyMapDelivery = false,
      Map<String, Marker>? markers,
      Map<String, Polyline>? polyline})
      : markers = markers ?? {},
        polyline = polyline ?? {};

  MapDeliveryState copyWith(
          {bool? isReadyMapDelivery,
          Map<String, Marker>? markers,
          Map<String, Polyline>? polyline}) =>
      MapDeliveryState(
          isReadyMapDelivery: isReadyMapDelivery ?? this.isReadyMapDelivery,
          markers: markers ?? this.markers,
          polyline: polyline ?? this.polyline);
}
