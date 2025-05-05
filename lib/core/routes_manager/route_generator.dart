import 'package:flower_tracking/core/routes_manager/routes_names.dart';
import 'package:flower_tracking/features/auth/forget_password/presentation/pages/forget_password_screen.dart';
import 'package:flower_tracking/features/auth/forget_password/presentation/pages/verification_code_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/forget_password/presentation/pages/reset_password_screen.dart';
import '../../features/layout/presentation/views/layout_view.dart';
import '../navigation_cubit/navigation_cubit.dart';

class RouteGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.layout:
        return MaterialPageRoute(
          builder:
              (context) =>
              BlocProvider(
                create: (context) => NavigationCubit(),
                child: LayoutView(),
              ),
          settings: settings,
        );
      case RoutesNames.forgetPassword:
        return MaterialPageRoute(builder: (_) =>  ForgetPasswordScreen());
      case RoutesNames.verificationCode:
        return MaterialPageRoute(builder: (_) =>  VerificationCodeScreen());
      case RoutesNames.resetPassword:
        return MaterialPageRoute(builder: (_) =>  ResetPasswordScreen());



      default:
        return MaterialPageRoute(
          builder: (context) => const LayoutView(),
          settings: settings,
        );
    }
  }
}
