import 'package:flutter/material.dart';
import 'core/styles/theme/app_theme.dart';

import 'core/routes/app_routes.dart';

class WallPaperApp extends StatelessWidget {
  const WallPaperApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      // themeMode: ThemeMode.light,
      darkTheme: AppTheme.dark,
      initialRoute: AppRoutes.getStarted,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
