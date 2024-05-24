import 'package:flutter/material.dart';

extension StringExtenstion on String {
  Color toColor() {
    String code = replaceAll('#', '');
    if (code.length == 6) {
      code = 'FF$code';
    }
    return Color(int.parse(code, radix: 16));
  }
}
