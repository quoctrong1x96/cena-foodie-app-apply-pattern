import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/my_location/my_location_map_bloc.dart';
import '../../widgets/widgets.dart';

class MapLocationAddressPage extends StatefulWidget {
  const MapLocationAddressPage({Key? key}) : super(key: key);

  @override
  _MapLocationAddressPageState createState() => _MapLocationAddressPageState();
}

class _MapLocationAddressPageState extends State<MapLocationAddressPage> {
  late MyLocationMapBloc mylocationmapBloc;

  @override
  void initState() {
    mylocationmapBloc = BlocProvider.of<MyLocationMapBloc>(context);
    mylocationmapBloc.initialLocation();
    super.initState();
  }

  @override
  void dispose() {
    mylocationmapBloc.cancelLocation();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [_CreateMap(), const ManualMarketMap()],
    ));
  }
}

class _CreateMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mapLocation = BlocProvider.of<MyLocationMapBloc>(context);

    return BlocBuilder<MyLocationMapBloc, MyLocationMapState>(
        builder: (context, state) => (state.existsLocation)
            ? GoogleMap(
                initialCameraPosition:
                    CameraPosition(target: state.location!, zoom: 18),
                zoomControlsEnabled: false,
                myLocationEnabled: false,
                myLocationButtonEnabled: false,
                onMapCreated: mapLocation.initMapLocation,
                onCameraMove: (position) =>
                    mapLocation.add(OnMoveMapEvent(position.target)),
                onCameraIdle: () {
                  if (state.locationCentral != null) {
                    mapLocation.add(OnGetAddressLocationEvent(
                        mapLocation.state.locationCentral!));
                  }
                },
              )
            : const Center(
                child: CenaTextDescription(text: 'Locating...'),
              ));
  }
}
