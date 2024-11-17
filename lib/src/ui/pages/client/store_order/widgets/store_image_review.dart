import 'package:flutter/material.dart';

import '../../../../../data/models/entities/store/store.dart';
import 'imges_review.dart';

class StoreImageReview extends StatefulWidget {
  final Store store;
  final double height;
  const StoreImageReview({required this.store, Key? key, required this.height})
      : super(key: key);

  @override
  _StoreImageReview createState() => _StoreImageReview();
}

class _StoreImageReview extends State<StoreImageReview> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: PageView.builder(
        onPageChanged: (value) {
          setState(() {
            currentPage = value;
          });
        },
        itemCount: 1,
        itemBuilder: (context, index) => ImageReview(
          image: widget.store.image!,
          height: widget.height,
        ),
      ),
    );
  }
}
