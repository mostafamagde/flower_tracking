import 'package:flower_tracking/core/app_colors/colors.dart';
import 'package:flower_tracking/core/app_consts/app_validators.dart';
import 'package:flower_tracking/core/routes_manager/routes_names.dart';
import 'package:flower_tracking/features/auth/forget_password/presentation/cubit/forget_password_cubit.dart';
import 'package:flower_tracking/features/auth/forget_password/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_form_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  ForgetPasswordCubit viewModel = ForgetPasswordCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Password')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: viewModel.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomText(
                topText: 'Forget Password',
                text: 'Please enter your email associated to\n your account',
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                labelText: 'Email',
                hintText: 'Enter your email',
                keyboardType: TextInputType.emailAddress,
                controller: viewModel.emailController,
                autoValidateMode: AutovalidateMode.onUserInteraction,
                validator: (val) => AppValidators.validateEmail(val),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor
                  ),
                  onPressed: () {
                    if(viewModel.formKey.currentState!.validate()) {
                      Navigator.pushNamed(context, RoutesNames.verificationCode);
                    }
              }, child: Text('Confirm'))
            ],
          ),
        ),
      ),
    );
  }
}
