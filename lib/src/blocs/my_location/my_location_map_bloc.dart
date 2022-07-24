import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

import '../../themes/theme_maps.dart';

part 'my_location_map_event.dart';
part 'my_location_map_state.dart';

class MyLocationMapBloc extends Bloc<MyLocationMapEvent, MyLocationMapState> {
  MyLocationMapBloc() : super(const MyLocationMapState()) {
    on<OnChangeLocationEvent>(_onChangeLocation);
    on<OnMapReadyEvent>(_onMapReady);
    on<OnMoveMapEvent>(_onMoveMap);
    on<OnGetAddressLocationEvent>(_onGetAddressLocation);
  }

  late GoogleMapController _mapController;
  late StreamSubscription<Position> _positionSubscription;

  void initialLocation() async {
    _positionSubscription =
        Geolocator.getPositionStream().listen((Position position) {
      add(OnChangeLocationEvent(LatLng(position.latitude, position.longitude)));
    });
  }

  void cancelLocation() {
    _positionSubscription.cancel();
  }

  void initMapLocation(GoogleMapController controller) {
    if (!state.mapReady) {
      _mapController = controller;
      // Change Style from Map
      _mapController.setMapStyle(jsonEncode(MyThemes));

      add(OnMapReadyEvent());

      add(OnGetAddressLocationEvent(state.location!));
    }
  }

  Future<void> _onChangeLocation(
      OnChangeLocationEvent event, Emitter<MyLocationMapState> emit) async {
    emit(state.copyWith(existsLocation: true, location: event.location));
  }

  Future<void> _onMapReady(
      OnMapReadyEvent event, Emitter<MyLocationMapState> emit) async {
    emit(state.copyWith(mapReady: true));
  }

  Future<void> _onMoveMap(
      OnMoveMapEvent event, Emitter<MyLocationMapState> emit) async {
    emit(state.copyWith(locationCentral: event.location));
  }

  Future<void> _onGetAddressLocation(
      OnGetAddressLocationEvent event, Emitter<MyLocationMapState> emit) async {
    List<Placemark> address = await placemarkFromCoordinates(
        event.location.latitude, event.location.longitude);

    String direction = address[0].thoroughfare!;
    String street = address[0].subThoroughfare!;
    String city = address[0].administrativeArea!;
    String district = address[0].subAdministrativeArea!;

    emit(state.copyWith(
        addressName: '$street $direction, $district, $city',
        locationCentral: event.location));
  }
}
