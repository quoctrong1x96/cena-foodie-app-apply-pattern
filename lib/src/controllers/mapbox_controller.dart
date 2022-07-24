import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;
import 'package:http/http.dart' as http;

import '../models/MapBox/driving_response.dart';

class MapBoxController {
  final _url = 'https://api.mapbox.com/directions/v5';
  final _apiKey =
      'pk.eyJ1IjoicXVvY3Ryb25nMXg5NiIsImEiOiJjbDBmZG1zem4wczI5M2NxdHh4cnNoYmRrIn0.gEjtHisJcuhfzc0R90Aj4Q';

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
