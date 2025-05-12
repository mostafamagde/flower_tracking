import 'package:flower_tracking/core/routes_manager/routes_names.dart';
import 'package:flower_tracking/features/onboarding/onboarding_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/layout/presentation/views/layout_view.dart';
import '../navigation_cubit/navigation_cubit.dart';

class RouteGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.layout:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create: (context) => NavigationCubit(),
                child: LayoutView(),
              ),
          settings: settings,
        );
      case RoutesNames.applyScreen:
        return CupertinoPageRoute(
          builder: (context) => const ApplyScreen(),
          settings: settings,
        );
        case RoutesNames.doneScreen:
        return CupertinoPageRoute(
          builder: (context) => const DoneScreen(),
          settings: settings,
        );
        case RoutesNames.loginScreenTest:
        return CupertinoPageRoute(
          builder: (context) => const LoginScreenTest(),
          settings: settings,
        );
      case RoutesNames.onboarding:
        return MaterialPageRoute(builder: (context) => OnboardingScreen());

      default:
        return MaterialPageRoute(
          builder: (context) => const LayoutView(),
          settings: settings,
        );
    }
  }
}
