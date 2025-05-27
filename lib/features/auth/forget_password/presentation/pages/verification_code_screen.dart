import 'package:flower_tracking/core/app_colors/colors.dart';
import 'package:flower_tracking/core/app_theme/app_theme.dart';
import 'package:flower_tracking/features/auth/forget_password/presentation/cubit/forget_password/forget_password_cubit.dart';
import 'package:flower_tracking/features/auth/forget_password/presentation/cubit/verify_code/verify_code_cubit.dart';
import 'package:flower_tracking/features/auth/forget_password/presentation/widgets/custom_text.dart';
import 'package:flower_tracking/features/auth/forget_password/presentation/widgets/input_num.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/di.dart';
import '../../../../../core/routes_manager/routes_names.dart';
import '../../../../../core/utils/dialog_utils.dart';
import '../../../../../core/utils/status.dart';

class VerificationCodeScreen extends StatelessWidget {

  const VerificationCodeScreen({super.key});



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Password'),),
      body: BlocProvider(
        create: (context) => getIt<VerifyCodeCubit>(),
        child: Builder(
            builder: (context) {
              VerifyCodeCubit viewModel = context.read<VerifyCodeCubit>();
              return BlocListener<VerifyCodeCubit, VerifyCodeState>(
                listener: (context, state) {
                  if (state.verifyState == Status.loading) {
                    DialogUtils.showLoading(context, 'Loading . . .');
                  } else {
                    DialogUtils.hideLoading(context);
                  }
                  if (state.verifyState == Status.error) {
                    DialogUtils.showError(context, state.verifyError ?? '');
                  }
                  else if (state.verifyState == Status.success) {

                    Navigator.pushNamed(context, RoutesNames.resetPassword);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(topText: 'Email Verification',
                          text: 'Please enter your code that send to your\n email address '),
                      SizedBox(height: 20),
                      InputNum(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Didn't receive code? ",
                            style: AppTheme.lightTheme.textTheme.titleMedium
                                ?.copyWith(
                                color: AppColors.primaryTextColor),),
                          InkWell(
                            onTap: () async{
                              await viewModel.forgetPassword(viewModel.emailController.text);
                            },
                            child: Text("Resend",
                              style: AppTheme.lightTheme.textTheme.titleMedium
                                  ?.copyWith(
                                  color: AppColors.primaryColor),),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
}
