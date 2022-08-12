// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';

class AppDivider extends Divider {
  @override
  final double? indent;
  @override
  final double? endIndent;

  const AppDivider({Key? key, this.indent = 0, this.endIndent = 0})
      : super(
          key: key,
          color: Colors.grey,
          height: 1,
          indent: indent,
          endIndent: endIndent,
        );
}
