import 'package:flutter/material.dart';
import 'package:wall_paper/core/routes/app_routes.dart';
import 'package:wall_paper/core/theme/app_theme.dart';

class WallPaperApp extends StatelessWidget {
  const WallPaperApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      themeMode: ThemeMode.light,
      darkTheme: AppTheme.dark,
      initialRoute: AppRoutes.getStarted,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
