import 'package:flutter/material.dart';

import '../../../widgets/animation_route.dart';
import '../../../widgets/widgets.dart';
import 'admin_voucher_add.dart';

class VoucherManagerPage extends StatelessWidget {
  const VoucherManagerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColorLight,
        appBar: CenaAppbarDefault(
          title: "Voucher của shop",
          leading: const CenaButtonDefaultBack(),
          actions: [
            TextButton(
                onPressed: () => Navigator.push(
                    context, routeCena(page: const VoucherAddNew())),
                child: CenaTextDescription(
                    text: "Thêm",
                    color: Theme.of(context).primaryColor,
                    fontSize: 16))
          ],
        ),
        body:
            // FutureBuilder<List<Delivery>?>(
            //     future: deliveryController.getAllDelivery(
            //         BlocProvider.of<StoreBloc>(context).state.store!.id!),
            //     builder: (context, snapshot) => (!snapshot.hasData)
            //         ? Column(
            //             children: const [
            //               CenaShimmer(),
            //               SizedBox(height: 10.0),
            //               CenaShimmer(),
            //               SizedBox(height: 10.0),
            //               CenaShimmer(),
            //             ],
            //           )
            //         :
            const SizedBox()
        // ) // _ListDelivery(listDelivery: snapshot.data!)),
        );
  }
}
