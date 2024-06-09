import 'package:flutter/material.dart';
import 'package:wall_papper/Feature/edit_photo/presentation/screens/edit_photo_screen.dart';
import '../../Feature/get_started/presentation/screens/get_started_screen.dart';
import '../../Feature/home/data/model/photo_model.dart';
import '../../Feature/home/presentation/screens/home_screen.dart';
import '../../Feature/photo_details/presentation/screens/photo_details.screen.dart';
import '../../Feature/search/presentation/screens/search_screen.dart';
import 'base_route.dart';

abstract class AppRoutes {
  static const String getStarted = "/get-started";
  static const String home = "/home";
  static const String search = "/search";
  static const String detailPhoto = "/detail-photo";
  static const String editPhoto = "/edit-photo";

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case getStarted:
        return MaterialPageRoute(
          builder: (context) {
            return const GetStartedScreen();
          },
        );
      case home:
        return BaseRoute(
          pageBuilder: (_, __, ___) {
            return const HomeScreen();
          },
        );
      case search:
        return BaseRoute(pageBuilder: (_, __, ___) {
          return SearchScreen(
            searchKey: settings.arguments as dynamic,
          );
        });
      case detailPhoto:
        return BaseRoute(pageBuilder: (_, __, ___) {
          return PhotoDetailsScreen(
            photo: settings.arguments as PhotoModel,
          );
        });
      case editPhoto:
        return BaseRoute(pageBuilder: (_, __, ___) {
          return EditPhotoScreen(photoUrl: settings.arguments as String);
        });
    }
    return null;
  }
}
