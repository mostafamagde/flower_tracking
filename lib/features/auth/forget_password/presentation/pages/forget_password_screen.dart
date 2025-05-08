import 'package:flower_tracking/core/app_colors/colors.dart';
import 'package:flower_tracking/core/app_consts/app_validators.dart';
import 'package:flower_tracking/core/di/di.dart';
import 'package:flower_tracking/core/routes_manager/routes_names.dart';
import 'package:flower_tracking/core/utils/status.dart';
import 'package:flower_tracking/features/auth/forget_password/presentation/cubit/forget_password_cubit.dart';
import 'package:flower_tracking/features/auth/forget_password/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/dialog_utils.dart';
import '../widgets/custom_form_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Password')),
      body: BlocProvider(
        create: (context) => getIt<ForgetPasswordCubit>(),
        child: Builder(
            builder: (context) {
              ForgetPasswordCubit viewModel = context.read<ForgetPasswordCubit>();
              return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
                listener: (context, state) {
                  if (state.forgetState == Status.loading) {
                    DialogUtils.showLoading(context, 'Loading . . .');
                  } else {
                    DialogUtils.hideLoading(context);
                  }
                  if (state.forgetState == Status.error) {
                    DialogUtils.showError(context, state.forgetError ?? '');
                  }
                  else if (state.forgetState == Status.success) {
                    Navigator.pushNamed(context, RoutesNames.verificationCode);
                  }
                },
                child: Padding(
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
                              print("email: ${viewModel.emailController.text}");
                              if (viewModel.formKey.currentState!.validate()) {
                                viewModel.forgetPassword(
                                    viewModel.emailController.text);
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
