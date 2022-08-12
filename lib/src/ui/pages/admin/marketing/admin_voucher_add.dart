import 'package:flutter/material.dart';

import '../../../widgets/widgets.dart';

class VoucherAddNew extends StatefulWidget {
  const VoucherAddNew({Key? key}) : super(key: key);

  @override
  State<VoucherAddNew> createState() => _VoucherAddNewState();
}

class _VoucherAddNewState extends State<VoucherAddNew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColorLight,
        appBar: const CenaAppbarDefault(
          title: "Thêm voucher",
          leading: CenaButtonDefaultBack(),
        ),
        body: Container());
  }
}
