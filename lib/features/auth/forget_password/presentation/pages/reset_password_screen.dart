import 'package:flower_tracking/core/app_consts/app_validators.dart';
import 'package:flower_tracking/features/auth/forget_password/presentation/cubit/forget_password_cubit.dart';
import 'package:flower_tracking/features/auth/forget_password/presentation/widgets/custom_form_field.dart';
import 'package:flower_tracking/features/auth/forget_password/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../../../core/app_colors/colors.dart';

class ResetPasswordScreen extends StatefulWidget {
  ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  ForgetPasswordCubit viewModel = ForgetPasswordCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Password')),
      body: Padding(
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
                isObscure: viewModel.isObscurePassword,
                icon: IconButton(
                  onPressed: () {
                    setState(() {
                      viewModel.isObscurePassword = !viewModel.isObscurePassword;
                    });
                  },
                  icon: Icon(
                    viewModel.isObscurePassword
                        ? Icons.visibility_off_rounded
                        : Icons.visibility_rounded,
                  ),
                ),
                labelText: 'New Password',
                hintText: "Enter Your Password",
                keyboardType: TextInputType.name,
                controller: viewModel.passwordController,
                validator: (val) => AppValidators.validatePassword(val),
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
                validator: (val) => AppValidators.validatePassword(val),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor
                  ),
                  onPressed: () {
                    if(viewModel.formKey.currentState!.validate()) {
                      //todo: change password
                    }
                  }, child: Text('Confirm'))
            ],
          ),
        ),
      ),
    );
  }
}
