import 'package:flutter/material.dart';

import '../../utils/configs/cena_text_styles.dart';

class EmptyListWidget extends StatelessWidget {
  final String text;
  final RefreshCallback? onRefresh;

  const EmptyListWidget({Key? key, this.text = 'Không có data', this.onRefresh})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return SizedBox(
              height: 200,
              width: double.infinity,
              child: Center(
                child: Text(
                  text,
                  style: CenaTextStyles.greyS18W800,
                ),
              ),
            );
          },
          itemCount: 1,
        ),
        onRefresh: onRefresh ?? _onRefreshData);
  }

  Future<void> _onRefreshData() async {}
}
