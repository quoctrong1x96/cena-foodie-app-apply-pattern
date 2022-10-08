import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../data/models/entities/order/order.dart';
import '../../../../utils/configs/cena_colors.dart';
import '../../../../utils/helpers/helpers.dart';
import '../../../../utils/image_ultils.dart';
import '../../../blocs/client_map/map_client_bloc.dart';
import '../../../widgets/widgets.dart';

class ClientMapPage extends StatefulWidget {
  final Order orderClient;

  const ClientMapPage({Key? key, required this.orderClient}) : super(key: key);

  @override
  _ClientMapPageState createState() => _ClientMapPageState();
}

class _ClientMapPageState extends State<ClientMapPage> {
  late MapClientBloc mapClientBloc;

  @override
  void initState() {
    mapClientBloc = BlocProvider.of<MapClientBloc>(context);
    mapClientBloc.add(OnMarkerClientEvent(
        LatLng(
            double.parse(widget.orderClient.latitude!),
            double.parse(widget.orderClient
                .longitude!)), //!TODO here thay client order location
        LatLng(double.parse(widget.orderClient.latitude!),
            double.parse(widget.orderClient.longitude!))));
    mapClientBloc.initSocketDelivery(widget.orderClient.id.toString());
    super.initState();
  }

  @override
  void dispose() {
    mapClientBloc.disconnectSocket();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _MapClient(orderClient: widget.orderClient),
          Positioned(
              left: 10,
              right: 10,
              bottom: 20,
              child: _InfoCardClient(widget.orderClient))
        ],
      ),
    );
  }
}

class _MapClient extends StatelessWidget {
  final Order orderClient;

  const _MapClient({required this.orderClient});

  @override
  Widget build(BuildContext context) {
    final mapClientBloc = BlocProvider.of<MapClientBloc>(context);

    return BlocBuilder<MapClientBloc, MapClientState>(
      builder: (context, state) => GoogleMap(
        initialCameraPosition: CameraPosition(
            target: LatLng(double.parse(orderClient.latitude!),
                double.parse(orderClient.longitude!)),
            zoom: 17.5),
        zoomControlsEnabled: false,
        myLocationEnabled: false,
        myLocationButtonEnabled: false,
        onMapCreated: mapClientBloc.initMapClient,
        markers: state.markerClient.values.toSet(),
      ),
    );
  }
}

class _InfoCardClient extends StatelessWidget {
  final Order orderClient;

  const _InfoCardClient(this.orderClient);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(.5),
                blurRadius: 7,
                spreadRadius: 5)
          ]),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(
                            ImagesUltils.getImageApiUrl(
                                orderClient.deliveryImage)))),
              ),
              const SizedBox(width: 10.0),
              CenaTextDescription(
                  text: orderClient.deliveryName ?? "Not assigned yet"),
              const Spacer(),
              InkWell(
                onTap: () async => await urlLauncherCena.makePhoneCall(
                    'tel:${orderClient.deliveryId}'), //!TODO: Thay delivery phone
                child: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[200]),
                  child: const Icon(Icons.phone, color: CenaColors.primary),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
