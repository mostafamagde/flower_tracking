import 'package:flower_tracking/core/di/di.dart';
import 'package:flower_tracking/core/routes_manager/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flower_tracking/core/app_consts/string_manager.dart';
import 'package:flower_tracking/core/app_consts/app_validators.dart';
import 'package:flower_tracking/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:flower_tracking/features/auth/login/presentation/cubit/login_state.dart';
import '../widget/text_feild.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final LoginCubit viewModel = getIt<LoginCubit>();
  bool rememberMe = false;

  bool get isButtonEnabled =>
      AppValidators.validateEmail(viewModel.emailController.text) == null &&
          AppValidators.validatePassword(viewModel.passwordController.text) == null;

  @override
  void initState() {
    super.initState();
    _checkToken();
    viewModel.emailController.addListener(() => setState(() {}));
    viewModel.passwordController.addListener(() => setState(() {}));
  }

  Future<void> _checkToken() async {
    final token = await viewModel.storageService.getToken();
    if (token != null) {
      setState(() {
        rememberMe = true;
        viewModel.setRememberMe(true);
      });
    } else {
      setState(() {
        rememberMe = false;
        viewModel.setRememberMe(false);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (_) => viewModel,
      child: BlocConsumer<LoginCubit, LoginCubitState>(
        listener: (context, state) {
          if (state is LoginLoadingState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Registering..')),
            );
          } else if (state is LoginSuccessState) {
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Login successful')),
            );
            Navigator.of(context).pushReplacementNamed(RoutesNames.home);
          } else if (state is LoginErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(StringManager.login),
              leading: const Icon(Icons.arrow_back),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BuildTextField(
                      controller: viewModel.emailController,
                      labelText: StringManager.email,
                      hintText: StringManager.enterYourEmail,
                      validation: AppValidators.validateEmail,
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(height: 16),
                    BuildTextField(
                      controller: viewModel.passwordController,
                      labelText: StringManager.password,
                      hintText: StringManager.enterYourPassword,
                      validation: AppValidators.validatePassword,
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: true,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Checkbox(
                          value: rememberMe,
                          onChanged: (val) async {
                            setState(() => rememberMe = val!);
                            viewModel.setRememberMe(val!);
                            if (!val) {
                              await viewModel.storageService.deleteToken();

                            }
                          },
                          activeColor: Colors.pink,
                        ),
                        const Text(StringManager.rememberMe),
                        const Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: const Text(StringManager.forgetPassword),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: isButtonEnabled
                            ? () {
                          if (_formKey.currentState!.validate()) {
                            viewModel.login();
                          }
                        }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                          isButtonEnabled ? Colors.pink : Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text(
                          StringManager.continueBtn,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    viewModel.emailController.dispose();
    viewModel.passwordController.dispose();
    super.dispose();
  }
}