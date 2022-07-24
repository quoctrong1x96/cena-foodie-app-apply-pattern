import 'package:flutter/material.dart';

import '../configs/cena_colors.dart';

class CenaIndicatorTabBar extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) =>
      _CenaPainterIndicator(this, onChanged);
}

class _CenaPainterIndicator extends BoxPainter {
  final CenaIndicatorTabBar decoration;

  _CenaPainterIndicator(this.decoration, VoidCallback? onChanged)
      : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Rect rect;

    rect = Offset(offset.dx + 6, (configuration.size!.height - 3)) &
        Size(configuration.size!.width - 12, 3);

    final paint = Paint()
      ..color = CenaColors.primary
      ..style = PaintingStyle.fill;

    canvas.drawRRect(
        RRect.fromRectAndCorners(rect,
            topLeft: const Radius.circular(8.0),
            topRight: const Radius.circular(8.0)),
        paint);
  }
}
