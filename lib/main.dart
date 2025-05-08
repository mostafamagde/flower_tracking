import 'package:flower_tracking/core/routes_manager/routes_names.dart';
import 'package:flutter/material.dart';

import 'core/app_theme/app_theme.dart';
import 'core/routes_manager/route_generator.dart';

void main() {
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
      onGenerateRoute: RouteGenerator.generateRoutes,
      initialRoute: RoutesNames.onboarding,
    );
  }
}
