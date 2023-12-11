import 'package:flutter/material.dart';

abstract class AppRoutes {
  static const String getStarted = "get-started";
  static const String home = "home";
  static const String search = "search";
  static const String detailPhoto = "detail-photo";
  static const String editPhoto = "edit-photo";

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    return null;
  }
}
