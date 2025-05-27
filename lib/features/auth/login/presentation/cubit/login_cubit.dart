import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/models/result.dart';
import '../../../../../core/shared_preference/shared_preference_helper.dart';
import '../../domain/use_case/login_use_case.dart';
import '../../domain/entity/login_request_entity.dart';
import 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginCubitState> {
  final LoginUseCase _loginUseCase;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final SecureStorageService storageService = SecureStorageService();
  bool rememberMe = false;

  LoginCubit(this._loginUseCase) : super(LoginInitialState());

  void setRememberMe(bool value) {
    rememberMe = value;
  }

  Future<void> login() async {
    emit(LoginLoadingState());
    try {
      final result = await _loginUseCase.login(
        LoginRequestEntity(
          email: emailController.text,
          password: passwordController.text,
        ),
      );
      print("Sending login request:");
      print("Email: ${emailController.text}");
      print("Password: ${passwordController.text}");
      print("Result type: ${result.runtimeType}");

      switch (result) {
        case Success():
          final data = result.data;
          if (data?.token != null) {
            if (rememberMe) {
              await storageService.saveToken(data!.token!);
              print("Token saved for Remember Me: ${data.token}");
            } else {
              await storageService.deleteToken();
              print("Token cleared as Remember Me is disabled");
            }
          } else {
            print("Token is null");
          }
          emit(LoginSuccessState(response: data!));
          return;

        case Error():
          final exception = result.exception;
          emit(LoginErrorState(message: exception.toString()));
          return;
      }
    } catch (e) {
      emit(LoginErrorState(message: 'حدث خطأ غير متوقع: $e'));
    }
  }
}