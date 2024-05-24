import 'package:flutter/material.dart';
import 'core/api/dio_service.dart';
import 'wallpaper_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    DioService.init(),
  ]);
  runApp(const WallPaperApp());
}
