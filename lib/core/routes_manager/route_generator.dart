import 'package:flower_tracking/core/navigation_cubit/navigation_cubit.dart';
import 'package:flower_tracking/core/routes_manager/routes_names.dart';
import 'package:flower_tracking/features/auth/apply_screen/presentation/pages/apply_screen.dart';
import 'package:flower_tracking/features/auth/apply_screen/presentation/pages/done_screen.dart';
import 'package:flower_tracking/features/auth/login_screen_test.dart';
import 'package:flower_tracking/features/layout/presentation/views/layout_view.dart';
import 'package:flower_tracking/features/onboarding/onboarding_screen.dart';
import 'package:flower_tracking/features/auth/forget_password/presentation/pages/forget_password_screen.dart';
import 'package:flower_tracking/features/auth/forget_password/presentation/pages/verification_code_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/login/presentation/screens/home _screen.dart';
import '../../features/auth/login/presentation/screens/login_screen.dart';
import '../../features/auth/forget_password/presentation/pages/reset_password_screen.dart';
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
      case RoutesNames.login:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
          settings: settings,
        );
      case RoutesNames.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
          settings: settings,
        );

      case RoutesNames.onboarding:
        return MaterialPageRoute(builder: (context) => OnboardingScreen());
      case RoutesNames.forgetPassword:
        return MaterialPageRoute(builder: (_) =>  ForgetPasswordScreen());
      case RoutesNames.verificationCode:
        return MaterialPageRoute(builder: (_) =>  VerificationCodeScreen());
      case RoutesNames.resetPassword:
        return MaterialPageRoute(builder: (_) =>  ResetPasswordScreen());



      default:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => NavigationCubit(),
            child: LayoutView(),
          ),
          settings: settings,
        );
    }
  }
}
