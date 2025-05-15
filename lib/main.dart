import 'package:flower_tracking/core/routes_manager/routes_names.dart';
import 'package:flower_tracking/core/di/di.dart';
import 'package:flutter/material.dart';

import 'core/app_theme/app_theme.dart';
import 'core/di/di.dart';
import 'core/routes_manager/route_generator.dart';
import 'features/auth/login/presentation/screens/login_screen.dart';


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
      onGenerateRoute: RouteGenerator.generateRoutes,

    );
  }
}
