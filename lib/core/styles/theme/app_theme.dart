import 'package:flutter/material.dart';

import '../colors/app_color.dart';
import 'app_text_style.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColor.primaryColor,
    useMaterial3: false,
    scaffoldBackgroundColor: AppColor.backgroundWhite,
    primarySwatch: AppColor.primarySwatch,
    appBarTheme: const AppBarTheme(
      elevation: 1,
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: AppTextStyle.displayLarge,
      displayMedium: AppTextStyle.displayMedium,
      displaySmall: AppTextStyle.displaySmall,
      headlineLarge: AppTextStyle.headlineLarge,
      headlineMedium: AppTextStyle.headlineMedium,
      headlineSmall: AppTextStyle.headlineSmall,
      titleLarge: AppTextStyle.titleLarge,
      titleSmall: AppTextStyle.titleSmall,
      titleMedium: AppTextStyle.titleMedium,
      labelLarge: AppTextStyle.labelLarge,
      labelMedium: AppTextStyle.labelMedium,
      labelSmall: AppTextStyle.labelSmall,
      bodyLarge: AppTextStyle.bodyLarge,
      bodyMedium: AppTextStyle.bodyMedium,
      bodySmall: AppTextStyle.bodySmall,
    ),
  );

  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColor.backgroundBlack,
    primaryColor: AppColor.primaryColor,
    useMaterial3: false,
    primarySwatch: AppColor.primarySwatch,
    appBarTheme: AppBarTheme(
      elevation: 0.0,
      backgroundColor: AppColor.backgroundBlack,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: AppTextStyle.displayLarge.copyWith(color: AppColor.white),
      displayMedium: AppTextStyle.displayMedium.copyWith(color: AppColor.white),
      displaySmall: AppTextStyle.displaySmall.copyWith(color: AppColor.white),
      headlineLarge: AppTextStyle.headlineLarge.copyWith(color: AppColor.white),
      headlineMedium:
          AppTextStyle.headlineMedium.copyWith(color: AppColor.white),
      headlineSmall: AppTextStyle.headlineSmall.copyWith(color: AppColor.white),
      titleLarge: AppTextStyle.titleLarge.copyWith(color: AppColor.white),
      titleSmall: AppTextStyle.titleSmall.copyWith(color: AppColor.white),
      titleMedium: AppTextStyle.titleMedium.copyWith(color: AppColor.white),
      labelLarge: AppTextStyle.labelLarge.copyWith(color: AppColor.white),
      labelMedium: AppTextStyle.labelMedium.copyWith(color: AppColor.white),
      labelSmall: AppTextStyle.labelSmall.copyWith(color: AppColor.white),
      bodyLarge: AppTextStyle.bodyLarge.copyWith(color: AppColor.white),
      bodyMedium: AppTextStyle.bodyMedium.copyWith(color: AppColor.white),
      bodySmall: AppTextStyle.bodySmall.copyWith(color: AppColor.white),
    ),
  );
}
