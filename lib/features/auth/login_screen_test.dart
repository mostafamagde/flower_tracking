import 'package:flower_tracking/core/app_colors/colors.dart';
import 'package:flutter/material.dart';

class LoginScreenTest extends StatelessWidget {
  const LoginScreenTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(child: Text("Login Screen Test",
      style: TextStyle(
        fontSize: 25,
      ),
      ),),
    );
  }
}
