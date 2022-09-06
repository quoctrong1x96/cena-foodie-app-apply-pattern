import 'package:cenafoodie/src/data/models/entities/address/address.dart';
import 'package:cenafoodie/src/data/models/ui/ui_response.dart';
import 'package:cenafoodie/src/utils/constants/route_constants.dart';
import 'package:cenafoodie/src/utils/navigation_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../data/app_locator.dart';
import '../../../../data/services/entities/address_service.dart';
import '../../../../utils/configs/cena_colors.dart';
import '../../../blocs/user/user_bloc.dart';
import '../../../resources/generated/l10n.dart';
import '../../../widgets/animation_route.dart';
import '../../../widgets/widgets.dart';

class SelectAddressPage extends StatelessWidget {
  final bool isSelectAddress;
  const SelectAddressPage({this.isSelectAddress = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    final _addressService = locator<IAddressService>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CenaAppbarDefault(
        centerTitle: true,
        leading: const CenaButtonDefaultBack(),
        title: lang.client_address_title,
        actions: [
          TextButton(
              onPressed: () => NavigationUtils.push(
                  context, RouteConstants.client_add_address),
              child: CenaTextDescription(
                  text: lang.client_address_button_add,
                  color: CenaColors.primary,
                  fontSize: 17))
        ],
      ),
      body: FutureBuilder<List<Address>?>(
          future: _addressService
              .fetchAll(
                  userId: BlocProvider.of<UserBloc>(context).state.user!.id)
              .then((value) => value.data),
          builder: (context, snapshot) => (!snapshot.hasData)
              ? const CenaShimmer()
              : _ListAddresses(
                  isSelectAddress: isSelectAddress,
                  listAddress: snapshot.data!)),
    );
  }
}

class _ListAddresses extends StatelessWidget {
  final List<Address> listAddress;
  final bool isSelectAddress;

  const _ListAddresses(
      {this.isSelectAddress = false, Key? key, required this.listAddress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);

    return (listAddress.isNotEmpty)
        ? ListView.builder(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            itemCount: listAddress.length,
            itemBuilder: (_, i) => Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(bottom: 20.0),
              decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(10.0)),
              child: ListTile(
                leading: BlocBuilder<UserBloc, UserState>(
                    builder: (_, state) =>
                        (state.address!.id == listAddress[i].id)
                            ? const Icon(Icons.radio_button_checked_rounded,
                                color: CenaColors.primary)
                            : const Icon(Icons.radio_button_off_rounded)),
                title: CenaTextDescription(
                    text: listAddress[i].detail!,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
                subtitle: CenaTextDescription(
                    text: listAddress[i].receiver!.name!,
                    fontSize: 16,
                    color: CenaColors.secondary),
                onTap: () {
                  userBloc.add(OnSelectAddressButtonEvent(listAddress[i]));
                  if (isSelectAddress) {
                    Navigator.pop(context);
                  }
                },
              ),
            ),
          )
        : _WithoutListAddress();
  }
}

class _WithoutListAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('Assets/my-location.svg', height: 400),
          CenaTextDescription(
              text: lang.client_address_without_address,
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: CenaColors.secondary),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}
