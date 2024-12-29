import 'package:flutter/material.dart';

import '../colors/app_color.dart';

abstract class AppTextStyle {
  static TextStyle displayLarge = TextStyle(
    color: AppColor.blackGrey,
    fontSize: 57,
    fontWeight: FontWeight.bold,
  );
  static TextStyle displayMedium = TextStyle(
    color: AppColor.blackGrey,
    fontSize: 45,
    fontWeight: FontWeight.bold,
  );
  static TextStyle displaySmall = TextStyle(
    color: AppColor.blackGrey,
    fontSize: 36,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headlineLarge = TextStyle(
    color: AppColor.blackGrey,
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headlineMedium = TextStyle(
    color: AppColor.blackGrey,
    fontSize: 28,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headlineSmall = TextStyle(
    color: AppColor.blackGrey,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );
  static TextStyle titleLarge = TextStyle(
    fontWeight: FontWeight.bold,
    color: AppColor.blackGrey,
    fontSize: 22,
  );
  static TextStyle titleMedium = TextStyle(
    fontWeight: FontWeight.bold,
    color: AppColor.blackGrey,
    fontSize: 18,
  );
  static TextStyle titleSmall = TextStyle(
    color: AppColor.blackGrey,
    fontSize: 14,
  );
  static TextStyle labelLarge = TextStyle(
    color: AppColor.blackGrey,
    fontSize: 14,
  );
  static TextStyle labelMedium = TextStyle(
    color: AppColor.blackGrey,
    fontSize: 12,
  );
  static TextStyle labelSmall = TextStyle(
    color: AppColor.blackGrey,
    fontSize: 11,
  );
  static TextStyle bodyLarge = TextStyle(
    color: AppColor.blackGrey,
    fontSize: 16,
  );
  static TextStyle bodyMedium = TextStyle(
    color: AppColor.blackGrey,
    fontSize: 14,
  );
  static TextStyle bodySmall = TextStyle(
    color: AppColor.blackGrey,
    fontSize: 12,
  );
}
