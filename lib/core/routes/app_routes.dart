import 'package:flutter/material.dart';
import 'package:wall_paper/Feature/get_started/presentation/screens/get_started_screen.dart';

abstract class AppRoutes {
  static const String getStarted = "get-started";
  static const String home = "home";
  static const String search = "search";
  static const String detailPhoto = "detail-photo";
  static const String editPhoto = "edit-photo";

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case getStarted:
        return MaterialPageRoute(
          builder: (context) {
            return const GetStartedScreen();
          },
        );
    }
    return null;
  }
}
