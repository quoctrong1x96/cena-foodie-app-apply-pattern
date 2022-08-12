part of 'map_client_bloc.dart';

@immutable
class MapClientState {
  final bool isReadyMapClient;

  final Map<String, Marker> markerClient;

  MapClientState(
      {this.isReadyMapClient = false, Map<String, Marker>? markerClient})
      : markerClient = markerClient ?? {};

  MapClientState copyWith(
          {bool? isReadyMapClient, Map<String, Marker>? markerClient}) =>
      MapClientState(
          isReadyMapClient: isReadyMapClient ?? this.isReadyMapClient,
          markerClient: markerClient ?? this.markerClient);
}
