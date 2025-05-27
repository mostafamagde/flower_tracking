import 'package:flower_tracking/core/app_consts/app_validators.dart';
import 'package:flower_tracking/core/di/di.dart';
import 'package:flower_tracking/features/auth/forget_password/presentation/cubit/reset_password/reset_password_cubit.dart';
import 'package:flower_tracking/features/auth/forget_password/presentation/widgets/custom_form_field.dart';
import 'package:flower_tracking/features/auth/forget_password/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/app_colors/colors.dart';
import '../../../../../core/routes_manager/routes_names.dart';
import '../../../../../core/utils/dialog_utils.dart';
import '../../../../../core/utils/status.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Password')),
      body: BlocProvider(
        create: (context) => getIt<ResetPasswordCubit>(),
        child: Builder(
            builder: (context) {
              ResetPasswordCubit viewModel = context.read<ResetPasswordCubit>();
              return BlocListener<ResetPasswordCubit, ResetPasswordState>(
                listener: (context, state) {
                  if (state.resetState == Status.loading) {
                    DialogUtils.showLoading(context, 'Loading . . .');
                  } else {
                    DialogUtils.hideLoading(context);
                  }
                  if (state.resetState == Status.error) {
                    DialogUtils.showError(context, state.resetError ?? '');
                  }
                  else if (state.resetState == Status.success) {
                    Navigator.pushNamed(context, RoutesNames.layout);
                  }
                },
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Form(
                    key: viewModel.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomText(
                          topText: "Reset Password",
                          text:
                          'Password must not be empty and must contain\n 6 characters with upper case letter and one\n number at least ',
                        ),
                        SizedBox(height: 30),
                        CustomTextFormField(
                          labelText: 'Email',
                          hintText: "Enter Your Email",
                          keyboardType: TextInputType.emailAddress,
                          controller: viewModel.emailController,
                          validator: (val) =>
                              AppValidators.validateEmail(val),
                        ),
                        SizedBox(height: 30),
                        CustomTextFormField(
                          isObscure: viewModel.isObscureConfirmPassword,
                          icon: IconButton(
                            onPressed: () {
                              setState(() {
                                viewModel.isObscureConfirmPassword =
                                !viewModel.isObscureConfirmPassword;
                              });
                            },
                            icon: Icon(
                              viewModel.isObscureConfirmPassword
                                  ? Icons.visibility_off_rounded
                                  : Icons.visibility_rounded,
                            ),
                          ),
                          labelText: 'Confirm Password',
                          hintText: "Confirm Password",
                          keyboardType: TextInputType.name,
                          controller: viewModel.confirmPasswordController,
                          validator: (val) =>
                              AppValidators.validatePassword(val),
                        ),
                        SizedBox(height: 40),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryColor
                            ),
                            onPressed: () {
                              if (viewModel.formKey.currentState!.validate()) {
                                viewModel.resetPassword(
                                  viewModel.emailController.text,
                                  viewModel.confirmPasswordController.text,
                                );
                              }
                            }, child: Text('Confirm'))
                      ],
                    ),
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
}
