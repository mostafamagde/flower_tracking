import 'package:flower_tracking/core/app_colors/colors.dart';
import 'package:flower_tracking/core/app_theme/app_theme.dart';
import 'package:flower_tracking/features/auth/forget_password/presentation/cubit/forget_password_cubit.dart';
import 'package:flower_tracking/features/auth/forget_password/presentation/widgets/custom_text.dart';
import 'package:flower_tracking/features/auth/forget_password/presentation/widgets/input_num.dart';
import 'package:flutter/material.dart';

class VerificationCodeScreen extends StatelessWidget {
  VerificationCodeScreen({super.key});

  ForgetPasswordCubit viewModel = ForgetPasswordCubit();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Password'),),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(topText: 'Email Verification',
                text: 'Please enter your code that send to your\n email address '),
            SizedBox(height: 20),
            InputNum(viewModel: viewModel),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Didn't receive code? ",
                  style: AppTheme.lightTheme.textTheme.titleMedium?.copyWith(
                      color: AppColors.primaryTextColor),),
                InkWell(
                  onTap: () {
                    //todo: resend code
                  },
                  child: Text("Resend",
                    style: AppTheme.lightTheme.textTheme.titleMedium?.copyWith(
                        color: AppColors.primaryColor),),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
