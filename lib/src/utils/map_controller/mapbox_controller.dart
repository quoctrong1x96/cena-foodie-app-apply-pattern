import 'dart:convert';

import 'package:cenafoodie/src/utils/constants/map_box_constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;
import 'package:http/http.dart' as http;

import '../../data/models/mapbox/driving_response.dart';

class MapBoxController {
  final _url = MapBoxConstants.map_box_url;
  final _apiKey = MapBoxConstants.map_box_key;

  Future<DrivingResponse> getCoordsOriginAndDestinationDelivery(
      LatLng origin, LatLng destination) async {
    final coordString =
        '${origin.longitude},${origin.latitude};${destination.longitude},${destination.latitude}';

    final url = '$_url/mapbox/driving/$coordString';

    final resp = await http.get(Uri.parse(
        '$url?alternatives=true&geometries=polyline6&steps=false&access_token=$_apiKey&language=es'));

    return DrivingResponse.fromJson(jsonDecode(resp.body));
  }
}

final mapBoxController = MapBoxController();
