import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../blocs/delivery_map/map_delivery_bloc.dart';
import '../../blocs/my_location/my_location_map_bloc.dart';
import '../../blocs/order/orders_bloc.dart';
import '../../configs/cena_colors.dart';
import '../../generated/l10n.dart';
import '../../helpers/helpers.dart';
import '../../models/response/orders_by_status_response.dart';
import '../../services/url.dart';
import '../../widgets/animation_route.dart';
import '../../widgets/snackbars/cena_snackbar_toast.dart';
import '../../widgets/widgets.dart';
import '../delivery/delivery_home_page.dart';
import '../delivery/order_delivered_page.dart';

class MapDeliveryPage extends StatefulWidget {
  final OrdersResponse order;

  const MapDeliveryPage({Key? key, required this.order}) : super(key: key);

  @override
  _MapDeliveryPageState createState() => _MapDeliveryPageState();
}

class _MapDeliveryPageState extends State<MapDeliveryPage>
    with WidgetsBindingObserver {
  late MyLocationMapBloc mylocationmapBloc;
  late MapDeliveryBloc mapDeliveryBloc;

  @override
  void initState() {
    mylocationmapBloc = BlocProvider.of<MyLocationMapBloc>(context);
    mapDeliveryBloc = BlocProvider.of<MapDeliveryBloc>(context);

    mylocationmapBloc.initialLocation();
    mapDeliveryBloc.initSocketDelivery();
    mylocationmapBloc.add(OnChangeLocationEvent(LatLng(
        double.parse(widget.order.storeLatitude.toString()),
        double.parse(widget.order.storeLongitude
            .toString())))); // them initial location tai5 quan1
    WidgetsBinding.instance!.addObserver(this);

    super.initState();
  }

  @override
  void dispose() {
    mylocationmapBloc.cancelLocation();
    mapDeliveryBloc.disconnectSocket();
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      if (!await Geolocator.isLocationServiceEnabled() ||
          !await Permission.location.isGranted) {
        Navigator.pushReplacement(
            context, routeCena(page: const DeliveryHomePage()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return BlocListener<OrdersBloc, OrdersState>(
      listener: (context, state) {
        if (state is LoadingOrderState) {
          modalLoading(context);
        } else if (state is SuccessOrdersState) {
          Navigator.pop(context);
          cenaToastSuccess(lang.delivery_map_susscess);
          Navigator.pushAndRemoveUntil(context,
              routeCena(page: const OrderDeliveredPage()), (route) => false);
        } else if (state is FailureOrdersState) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content:
                  CenaTextDescription(text: state.error, color: Colors.white),
              backgroundColor: Colors.red));
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            _MapDelivery(order: widget.order),
            Column(
              children: [
                Align(alignment: Alignment.centerRight, child: _BtnLocation()),
                const SizedBox(height: 10.0),
                Align(
                    alignment: Alignment.centerRight,
                    child: _BtnGoogleMap(order: widget.order)),
              ],
            ),
            Positioned(
              left: 20,
              right: 20,
              bottom: 20,
              child: _InformationBottom(order: widget.order),
            )
          ],
        ),
      ),
    );
  }
}

class _InformationBottom extends StatelessWidget {
  final OrdersResponse order;

  const _InformationBottom({required this.order});

  @override
  Widget build(BuildContext context) {
    final orderBloc = BlocProvider.of<OrdersBloc>(context);
    final lang = S.of(context);

    return Container(
      padding: const EdgeInsets.all(15.0),
      height: 240,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
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
              const Icon(Icons.location_on_outlined,
                  size: 28, color: Colors.black87),
              const SizedBox(width: 15.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CenaTextDescription(
                      text: lang.delivery_map_address,
                      fontSize: 15,
                      color: Colors.grey),
                  CenaTextDescription(
                    text: order.address!,
                    fontSize: 14,
                    maxLine: 2,
                    color: CenaColors.primary,
                    textWidth: 250,
                  ),
                ],
              )
            ],
          ),
          const Divider(),
          Row(
            children: [
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(
                            URLS.BASE_URL + order.clientImage!))),
              ),
              CenaTextDescription(text: order.client!),
              const Spacer(),
              InkWell(
                onTap: () async => await urlLauncherCena
                    .makePhoneCall('tel:${order.clientPhone}'),
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
          const SizedBox(height: 10.0),
          BlocBuilder<MyLocationMapBloc, MyLocationMapState>(
            builder: (context, state) => CenaButton(
              height: 45,
              text: lang.delivery_map_button_delivered,
              fontWeight: FontWeight.w500,
              onPressed: () {
                final distanceDelivery = Geolocator.distanceBetween(
                    state.location!.latitude,
                    state.location!.longitude,
                    double.parse(order.latitude!),
                    double.parse(order.longitude!));

                if (distanceDelivery <= 150) {
                  orderBloc.add(OnUpdateStatusOrderDeliveredEvent(
                      order.orderId.toString()));
                } else {
                  modalInfoCena(context, lang.delivery_map_still_far);
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

class _MapDelivery extends StatelessWidget {
  final OrdersResponse order;

  const _MapDelivery({required this.order});

  @override
  Widget build(BuildContext context) {
    final mapDelivery = BlocProvider.of<MapDeliveryBloc>(context);
    final myLocationDeliveryBloc = BlocProvider.of<MyLocationMapBloc>(context);

    return BlocBuilder<MyLocationMapBloc, MyLocationMapState>(
        builder: (_, state) {
      if (state.location != null) {
        mapDelivery.add(OnMarkerDeliveryEvent(
            state.location!,
            LatLng(double.parse(order.latitude!),
                double.parse(order.longitude!))));
        mapDelivery.add(OnEmitLocationDeliveryEvent(
            order.orderId.toString(), myLocationDeliveryBloc.state.location!));
      }

      return (state.existsLocation)
          ? GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: state.location!, zoom: 17.5),
              zoomControlsEnabled: false,
              myLocationEnabled: false,
              myLocationButtonEnabled: false,
              onMapCreated: mapDelivery.initMapDeliveryCena,
              markers: mapDelivery.state.markers.values.toSet(),
              polylines: mapDelivery.state.polyline!.values.toSet(),
            )
          : Center(
              child:
                  CenaTextDescription(text: S.of(context).delivery_map_looking),
            );
    });
  }
}

class _BtnLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mapDeliveryBloc = BlocProvider.of<MapDeliveryBloc>(context);
    final locationBloc = BlocProvider.of<MyLocationMapBloc>(context);

    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(right: 10.0),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(color: Colors.grey[300]!, blurRadius: 10, spreadRadius: -5)
        ]),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          maxRadius: 25,
          child: IconButton(
            icon: const Icon(Icons.my_location_rounded,
                color: CenaColors.primary),
            onPressed: () => mapDeliveryBloc
                .moveCameraLocation(locationBloc.state.location!),
          ),
        ),
      ),
    );
  }
}

class _BtnGoogleMap extends StatelessWidget {
  final OrdersResponse order;

  const _BtnGoogleMap({required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10.0),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.grey[300]!, blurRadius: 10, spreadRadius: -5)
      ]),
      child: CircleAvatar(
          backgroundColor: Colors.white,
          maxRadius: 25,
          child: InkWell(
              onTap: () async => await urlLauncherCena.openMapLaunch(
                  order.latitude!, order.longitude!),
              child: Image.asset('Assets/google-map.png', height: 30))),
    );
  }
}
