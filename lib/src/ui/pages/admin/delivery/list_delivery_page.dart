import 'package:cached_network_image/cached_network_image.dart';
import 'package:cenafoodie/src/data/services/entities/delivery_service.dart';
import 'package:cenafoodie/src/utils/image_ultils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../data/app_locator.dart';
import '../../../../data/models/entities/delivery/delivery.dart';
import '../../../../data/models/ui/ui_response.dart';
import '../../../blocs/store/store_bloc.dart';
import '../../../blocs/user/user_bloc.dart';
import '../../../resources/generated/l10n.dart';
import '../../../../utils/configs/cena_colors.dart';
import '../../../../utils/helpers/helpers.dart';
import '../../../widgets/animation_route.dart';
import '../../../widgets/snackbars/cena_snackbar_toast.dart';
import '../../../widgets/widgets.dart';
import '../../admin/delivery/add_new_delivery_page.dart';

class ListDeliveriesPage extends StatefulWidget {
  const ListDeliveriesPage({Key? key}) : super(key: key);

  @override
  State<ListDeliveriesPage> createState() => _ListDeliveriesPageState();
}

class _ListDeliveriesPageState extends State<ListDeliveriesPage> {
  final IDeliveryService _deliveryService = locator<IDeliveryService>();
  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is LoadingUserState) {
          modalLoading(context);
        } else if (state is SuccessUserState) {
          Navigator.pop(context);
          cenaToastSuccess(lang.admin_delivery_success);
          setState(() {});
        } else if (state is FailureUserState) {
          Navigator.pop(context);
          errorMessageSnack(context, state.error);
        }
      },
      child: Scaffold(
        backgroundColor: CenaColors.LIGHT_GREY,
        appBar: CenaAppbarDefault(
          title: lang.admin_delivery_title,
          leading: const CenaButtonDefaultBack(),
          actions: [
            TextButton(
                onPressed: () => Navigator.push(
                    context, routeCena(page: const AddNewDeliveryPage())),
                child: CenaTextDescription(
                    text: lang.admin_delivery_button_add,
                    color: CenaColors.WHITE,
                    fontSize: 16))
          ],
        ),
        body: FutureBuilder<UiResponse<List<Delivery>?>>(
            future: _deliveryService.fetchAllOfStore(
                storeId: BlocProvider.of<StoreBloc>(context).state.store!.id),
            builder: (context, snapshot) => (!snapshot.hasData)
                ? Column(
                    children: const [
                      CenaShimmer(),
                      SizedBox(height: 10.0),
                      CenaShimmer(),
                      SizedBox(height: 10.0),
                      CenaShimmer(),
                    ],
                  )
                : _ListDelivery(listDelivery: snapshot.data!.data!)),
      ),
    );
  }
}

// ignore: unused_element
class _ListDelivery extends StatelessWidget {
  final List<Delivery>? listDelivery;

  const _ListDelivery({this.listDelivery});

  @override
  Widget build(BuildContext context) {
    return (listDelivery!.isNotEmpty)
        ? ListView.builder(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            itemCount: listDelivery!.length,
            itemBuilder: (context, i) => Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: InkWell(
                onTap: () => {
                  modalDelete(
                    context,
                    listDelivery![i].name!,
                    listDelivery![i].image!,
                    () {
                      BlocProvider.of<UserBloc>(context).add(
                          OnUpdateDeliveryToClientEvent(
                              listDelivery![i].id.toString()));
                      Navigator.pop(context);
                    },
                  )
                },
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.blue.withOpacity(0.5),
                          offset: const Offset(2, 20),
                          blurRadius: 4,
                          spreadRadius: -10)
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                    ImagesUltils.getImageApiUrl(
                                        listDelivery![i].image)),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(width: 15.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CenaTextDescription(
                              text: listDelivery![i].name!,
                              fontWeight: FontWeight.w500),
                          const SizedBox(height: 5.0),
                          CenaTextDescription(
                              text: listDelivery![i].phone!,
                              color: CenaColors.WHITE),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('Assets/no-data.svg', height: 290),
                const SizedBox(height: 20.0),
                CenaTextDescription(
                    text: S.of(context).admin_delivery_no_data,
                    color: CenaColors.primary,
                    fontSize: 20)
              ],
            ),
          );
  }
}
