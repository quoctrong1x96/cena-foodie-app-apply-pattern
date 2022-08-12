import 'dart:async';
// import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cenafoodie/src/utils/constants/cena_service_constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

import '../../../utils/../utils/helpers/helpers.dart';

// import '../../themes/theme_maps.dart';

part 'map_client_event.dart';
part 'map_client_state.dart';

class MapClientBloc extends Bloc<MapClientEvent, MapClientState> {
  MapClientBloc() : super(MapClientState()) {
    on<OnReadyMapClientEvent>(_onReadyMapClient);
    on<OnMarkerClientEvent>(_onMarkerClient);
    on<OnPositionDeliveryEvent>(_onPositionDelivery);
  }

  // late GoogleMapController _mapController;
  late io.Socket _socket;

  void initMapClient(GoogleMapController controller) {
    if (!state.isReadyMapClient) {
      // _mapController = controller;

      // _mapController.setMapStyle(jsonEncode(themeMapsCena));

      add(OnReadyMapClientEvent());
    }
  }

  void initSocketDelivery(String idOrder) {
    _socket = io.io(CenaServiceConstants.BASE_URL + '/orders-delivery-socket', {
      'transports': ['websocket'],
      'autoConnect': true,
    });

    _socket.connect();

    _socket.on('position/$idOrder', (data) {
      add(OnPositionDeliveryEvent(LatLng(data['latitude'], data['longitude'])));
    });
  }

  void disconnectSocket() {
    _socket.disconnect();
  }

  Future<void> _onReadyMapClient(
      OnReadyMapClientEvent event, Emitter<MapClientState> emit) async {
    emit(state.copyWith(isReadyMapClient: true));
  }

  Future<void> _onMarkerClient(
      OnMarkerClientEvent event, Emitter<MapClientState> emit) async {
    final marketCustom =
        await getAssetImageMarker('Assets/food-delivery-marker.png');
    final iconDestination =
        await getAssetImageMarker('Assets/delivery-destination.png');

    final markerDeliver = Marker(
        markerId: const MarkerId('markerDeliver'),
        position: event.delivery,
        icon: marketCustom);

    final markerClient = Marker(
        markerId: const MarkerId('markerClient'),
        position: event.client,
        icon: iconDestination);

    final newMarker = {...state.markerClient};
    newMarker['markerDeliver'] = markerDeliver;
    newMarker['markerClient'] = markerClient;

    emit(state.copyWith(markerClient: newMarker));
  }

  Future<void> _onPositionDelivery(
      OnPositionDeliveryEvent event, Emitter<MapClientState> emit) async {
    final deliveryMarker =
        await getAssetImageMarker('Assets/food-delivery-marker.png');

    final markerDeliver = Marker(
        markerId: const MarkerId('markerDeliver'),
        position: event.location,
        icon: deliveryMarker);

    final newMarker = {...state.markerClient};
    newMarker['markerDeliver'] = markerDeliver;

    emit(state.copyWith(markerClient: newMarker));
  }
}
