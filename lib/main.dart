import 'package:flower_tracking/core/di/di.dart';
import 'package:flutter/material.dart';

import 'core/app_theme/app_theme.dart';
import 'core/routes_manager/route_generator.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flower Tracking',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: '/doneScreen',
      onGenerateRoute: RouteGenerator.generateRoutes,
    );
  }
}
