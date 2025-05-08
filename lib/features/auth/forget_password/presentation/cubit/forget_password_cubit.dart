import 'package:bloc/bloc.dart';
import 'package:flower_tracking/core/models/result.dart';
import 'package:flower_tracking/features/auth/forget_password/domain/entities/forget_password_entity.dart';
import 'package:flower_tracking/features/auth/forget_password/domain/use_cases/forget_password_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/utils/status.dart';

part 'forget_password_state.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit({required this.forgetUseCase})
      : super(ForgetPasswordState());

  ForgetPasswordUseCase forgetUseCase;


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isValid = true;
  bool isObscurePassword = true;
  bool isObscureConfirmPassword = true;
  final List<TextEditingController> controllers =
  List.generate(4, (index) => TextEditingController());


  Future<void> forgetPassword(String email) async {
    emit(state.copyWith(forgetState: Status.loading));
    Result<ForgetPasswordEntity> result = await forgetUseCase.call(email);

    switch (result) {
      case Success<ForgetPasswordEntity>():
        emit(state.copyWith(
            forgetState: Status.success, forgetEntity: result.data));

      case Error<ForgetPasswordEntity>():
        print('FULL ERROR: ${result.exception.toString()}');

        emit(state.copyWith(forgetState: Status.error,
            forgetError: result.exception.toString()));
    }
  }
}
