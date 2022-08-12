import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:polyline_do/polyline_do.dart' as polylinedo;
import 'package:socket_io_client/socket_io_client.dart' as io;

import '../../../utils/constants/cena_service_constants.dart';
import '../../../utils/../utils/helpers/helpers.dart';
import '../../../utils/map_controller/mapbox_controller.dart';
import '../../../utils/themes/theme_maps.dart';

part 'map_delivery_event.dart';
part 'map_delivery_state.dart';

class MapDeliveryBloc extends Bloc<MapDeliveryEvent, MapDeliveryState> {
  MapDeliveryBloc() : super(MapDeliveryState()) {
    on<OnMapReadyEvent>(_onMapReady);
    on<OnMarkerDeliveryEvent>(_onMarkerDelivery);
    on<OnEmitLocationDeliveryEvent>(_onEmitLocationDelivery);
  }

  late GoogleMapController _mapController;
  late io.Socket _socket;

  Polyline _myRouteDestinationDelivery = const Polyline(
      polylineId: PolylineId('myRouteDestinationDelivery'),
      color: Colors.black87,
      width: 5);

  void initMapDeliveryCena(GoogleMapController controller) {
    if (!state.isReadyMapDelivery) {
      _mapController = controller;

      _mapController.setMapStyle(jsonEncode(MyThemes));

      add(OnMapReadyEvent());
    }
  }

  void moveCameraLocation(LatLng location) {
    final cameraUpdate = CameraUpdate.newLatLng(location);
    _mapController.animateCamera(cameraUpdate);
  }

  void initSocketDelivery() {
    _socket = io.io(CenaServiceConstants.BASE_URL + '/orders-delivery-socket', {
      'transports': ['websocket'],
      'autoConnect': true,
    });

    _socket.connect();
  }

  void disconnectSocket() {
    _socket.disconnect();
  }

  Future<void> _onMapReady(
      OnMapReadyEvent event, Emitter<MapDeliveryState> emit) async {
    emit(state.copyWith(isReadyMapDelivery: true));
  }

  Future<void> _onMarkerDelivery(
      OnMarkerDeliveryEvent event, Emitter<MapDeliveryState> emit) async {
    // Polylines

    final mapBoxResponse =
        await mapBoxController.getCoordsOriginAndDestinationDelivery(
            event.location, event.destination);

    final geometry = mapBoxResponse.routes![0].geometry;

    final points = polylinedo.Polyline.Decode(
            encodedString: geometry.toString(), precision: 6)
        .decodedCoords;

    final List<LatLng> routeCoords =
        points.map((p) => LatLng(p[0], p[1])).toList();

    _myRouteDestinationDelivery =
        _myRouteDestinationDelivery.copyWith(pointsParam: routeCoords);

    final currentPolylines = state.polyline;
    currentPolylines!['myRouteDestinationDelivery'] =
        _myRouteDestinationDelivery;

    // ------------------------ Markets

    final marketCustom =
        await getAssetImageMarker('Assets/food-delivery-marker.png');
    final iconDestination =
        await getAssetImageMarker('Assets/delivery-destination.png');

    final markerDelivery = Marker(
        markerId: const MarkerId('markerDelivery'),
        position: event.location,
        icon: marketCustom);

    final markerDestination = Marker(
        markerId: const MarkerId('markerDestination'),
        position: event.destination,
        icon: iconDestination);

    final newMarker = {...state.markers};
    newMarker['markerDelivery'] = markerDelivery;
    newMarker['markerDestination'] = markerDestination;

    emit(state.copyWith(polyline: currentPolylines, markers: newMarker));
  }

  Future<void> _onEmitLocationDelivery(
      OnEmitLocationDeliveryEvent event, Emitter<MapDeliveryState> emit) async {
    _socket.emit('position', {
      'idOrder': event.idOrder,
      'latitude': event.location.latitude,
      'longitude': event.location.longitude
    });
  }
}
