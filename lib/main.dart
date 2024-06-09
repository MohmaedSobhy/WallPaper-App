import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wall_papper/bloc_observer.dart';
import 'core/api/dio_service.dart';
import 'wallpaper_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserval();
  await Future.wait([
    DioService.init(),
  ]);
  runApp(const WallPaperApp());
}
